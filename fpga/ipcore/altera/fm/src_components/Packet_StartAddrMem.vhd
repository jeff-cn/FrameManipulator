-------------------------------------------------------------------------------
--! @file Packet_StartAddrMem.vhd
--! @brief Start adress memory
-------------------------------------------------------------------------------
--
--    (c) B&R, 2014
--
--    Redistribution and use in source and binary forms, with or without
--    modification, are permitted provided that the following conditions
--    are met:
--
--    1. Redistributions of source code must retain the above copyright
--       notice, this list of conditions and the following disclaimer.
--
--    2. Redistributions in binary form must reproduce the above copyright
--       notice, this list of conditions and the following disclaimer in the
--       documentation and/or other materials provided with the distribution.
--
--    3. Neither the name of B&R nor the names of its
--       contributors may be used to endorse or promote products derived
--       from this software without prior written permission. For written
--       permission, please contact office@br-automation.com
--
--    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
--    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
--    LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
--    FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
--    COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
--    INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
--    BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
--    LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
--    CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
--    LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
--    ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
--    POSSIBILITY OF SUCH DAMAGE.
--
-------------------------------------------------------------------------------

--! Use standard ieee library
library ieee;
--! Use logic elements
use ieee.std_logic_1164.all;
--! Use numeric functions
use ieee.numeric_std.all;

--! Use work library
library work;
--! use global library
use work.global.all;


--! This is the entity of the packet start address memory
entity Packet_StartAddrMem is
    generic(
            gPacketAddrWidth    : natural := 14;    --!enough for 500 Packets with the size of 28 Bytes
            gAddrMemoryWidth    : natural := 9      --!Width of address memory, should store at least 500 addresses
            );
    port(
        clk, reset          : in std_logic;                                     --! clk, reset
        iResetPaketBuff     : in std_logic;                                     --! Resets the packet FIFO
        iTwistPacketEx      : in std_logic;                                     --! exchange packets in opposite order
        oErrorAddrBuff      : out std_logic;                                    --! Error: Address-buffer is overwritten while an incorrect-sequence task
        iWrAddrEn           : in std_logic;                                     --! Write current address
        iRdAddrEn           : in std_logic;                                     --! read current address
        iAddrData           : in std_logic_vector(gPacketAddrWidth-1 downto 0); --! Address in
        oAddrData           : out std_logic_vector(gPacketAddrWidth-1 downto 0) --! Address out
        );
end Packet_StartAddrMem;

--! @brief Packet_StartAddrMem architecture
--! @details Start address memory
--! - Store write address and receive new read start address
--! - Address output like a FiFo
--! - Temporary LiFo output at Incorrect-Sequence
--! - Error output at overlapping packets
architecture two_seg_arch of Packet_StartAddrMem is

    --! @brief RAM for address memory
    component FiFo_File
        generic(
                B   : natural:=8;       --! number of Bits
                W   : natural:=8        --! number of address bits
                );
        port(
            clk     : in std_logic;                         --! clk
            iWrEn   : in std_logic;                         --! Write enable
            iWrAddr : in std_logic_vector(W-1 downto 0);    --! Write address
            iRdAddr : in std_logic_vector(W-1 downto 0);    --! Read address
            iWrData : in std_logic_vector(B-1 downto 0);    --! Write data
            oRdData : out std_logic_vector(B-1 downto 0)    --! Read data
        );
    end component;


    --! @brief Counter for the address-memory address
    component Basic_Cnter
        generic(
                gCntWidth   : natural := 2  --! Width of the coutner
                );
        port(
            clk, reset  : in std_logic;                                 --! clk, reset
            iClear      : in std_logic;                                 --! Synchronous reset
            iEn         : in std_logic;                                 --! Cnt Enable
            iStartValue : in std_logic_vector(gCntWidth-1 downto 0);    --! Init value
            iEndValue   : in std_logic_vector(gCntWidth-1 downto 0);    --! End value
            oQ          : out std_logic_vector(gCntWidth-1 downto 0);   --! Current value
            oOv         : out std_logic                                 --! Overflow
        );
    end component;


    --! @brief Down counter for the Incorrect-Sequece task
    component Basic_DownCnter
        generic(
                gCntWidth   : natural := 2  --! Width of the coutner
                );
        port(
            clk, reset  : in std_logic;                                 --! clk, reset
            iClear      : in std_logic;                                 --! Synchronous reset
            iEn         : in std_logic;                                 --! Cnt Enable
            iStartValue : in std_logic_vector(gCntWidth-1 downto 0);    --! Init value
            iEndValue   : in std_logic_vector(gCntWidth-1 downto 0);    --! End value
            oQ          : out std_logic_vector(gCntWidth-1 downto 0);   --! Current value
            oOv         : out std_logic                                 --! Overflow
        );
    end component;


    --Last write address
    signal LastWrAddr_reg   : std_logic_vector(gAddrMemoryWidth-1 downto 0);    --! Register of last write address
    signal LastWrAddr_next  : std_logic_vector(gAddrMemoryWidth-1 downto 0);    --! Next value of write address register

    --incorrect sequence override signals
    signal RdAddr           : std_logic_vector(gAddrMemoryWidth-1 downto 0);    --! FIFO read address
    signal RdAddrBack       : std_logic_vector(gAddrMemoryWidth-1 downto 0);    --! LIFO override address
    signal clearTwistCnter  : std_logic;                                        --! clear LIFO

    --Address FIFO
    signal FifoWrAddr   : std_logic_vector(gAddrMemoryWidth-1 downto 0);        --! Write address of address-memory
    signal FifoRdAddr   : std_logic_vector(gAddrMemoryWidth-1 downto 0);        --! Read address of address-memory

begin


    -- FIFO Control -------------------------------------------------------------------------


    --! @brief Counter for address-memory write address
    --! - Select address for next memory entry
    WrAddrCnter : Basic_Cnter
    generic map(gCntWidth   => gAddrMemoryWidth)
    port map(
            clk         => clk,
            reset       => reset,
            iClear      => iResetPaketBuff,
            iEn         => iWrAddrEn,
            iStartValue => (1 => '1', others => '0'),  --starts with value 2. It has to be a step ahead, that the read address value is correct
             iEndValue  => (others => '1'),
            oQ          => FifoWrAddr,
            oOv         => open);


    --! @brief Counter for address-memory read address
    --! - Select address for the output of the next start-address from memory
    RdAddrCnter : Basic_Cnter
    generic map(gCntWidth   => gAddrMemoryWidth)
    port map(
            clk         => clk,
            reset       => reset,
            iClear      => iResetPaketBuff,
            iEn         => iRdAddrEn,
            iStartValue => (others => '0'),
            iEndValue   => (others => '1'),
            oQ          => RdAddr,
            oOv         => open
            );


    -----------------------------------------------------------------------------------------



    -- Incorrect Sequence Override ----------------------------------------------------------

    --! @brief Register for the last write address of the FIFO
    --! - Storing with asynchronous reset
    regs:
    process(clk,reset)
    begin
        if reset='1' then
            LastWrAddr_reg  <= (others => '0');

        elsif rising_edge(clk) then
            LastWrAddr_reg  <= LastWrAddr_next;

        end if;
    end process;


    --! @brief Logic for the last write address of the FIFO
    --! - Store current address at write enable signal
    combLastWrAddr:
    process(iWrAddrEn, LastWrAddr_reg, FifoWrAddr)
    begin

        LastWrAddr_next     <= LastWrAddr_reg;

        if iWrAddrEn='1' then
            LastWrAddr_next <= FifoWrAddr;

        end if;
    end process;



    --clear when incorrect sequence is inactive
    clearTwistCnter <= not iTwistPacketEx;



    --! @brief Counter for the output of packet start addresses in the reverse sequence
    --! - Start with current write address and counts down
    --! - Reset, when task is over
    TwistCnter : Basic_DownCnter
    generic map(gCntWidth   => gAddrMemoryWidth)
    port map(
            clk         => clk,
            reset       => reset,
            iClear      => clearTwistCnter,
            iEn         => iRdAddrEn,
            iStartValue => LastWrAddr_reg,
            iEndValue   => (others => '0'),
            oQ          => RdAddrBack,
            oOv         => open
            );


    --!selection of Readaddr
    FifoRdAddr  <= RdAddrBack when iTwistPacketEx='1' else RdAddr;

    --!Address-buffer is overwritten while an incorrect-sequence task
    oErrorAddrBuff  <= '1' when RdAddrBack      = FifoWrAddr and
                                iTwistPacketEx  = '1'       else '0';

    -----------------------------------------------------------------------------------------



    -- Memory block -------------------------------------------------------------------------

    --! @brief Memory for packet start address
    --! - Normally like a FiFo
    --! - Temporary a LiFo at Incorrect-Sequence task
    RdAddressMem : FiFo_File
    generic map(
                W => gAddrMemoryWidth,
                B => gPacketAddrWidth
                )
    port map(
            clk     => clk,
            iWrEn   => iWrAddrEn,
            iWrAddr => FifoWrAddr,
            iWrData => iAddrData,
            iRdAddr => FifoRdAddr,
            oRdData => oAddrData
            );


end two_seg_arch;