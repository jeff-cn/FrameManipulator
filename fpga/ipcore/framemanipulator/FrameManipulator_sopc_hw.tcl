# TCL File Generated by Component Editor 10.1sp1
# Wed Aug 29 09:34:17 CEST 2012
# DO NOT MODIFY


# +-----------------------------------
# |
# | FrameManipulator "FrameManipulator" v1.0
# | null 2012.08.29.09:34:17
# |
# |
# | C:/Git_proj/Framemanipulator_muelhausens/example_CNDK/BeMicro_Q10/fpga/altera/IP_core/Framemanipulator_SOPC/FrameManipulator.vhd
# |
# |    ./FrameManipulator.vhd syn, sim
# |    ./lib_Basics/adder_2121.vhd syn, sim
# |    ./lib_Basics/Basic_Cnter.vhd syn, sim
# |    ./lib_Basics/From_To_Cnt_Filter.vhd syn, sim
# |    ./lib_Basics/Mux1D.vhd syn, sim
# |    ./lib_Basics/Mux2D.vhd syn, sim
# |    ./lib_Basics/shift_right_register.vhd syn, sim
# |    ./lib_Ethernet/CRC_calculator.vhd syn, sim
# |    ./lib_Ethernet/end_of_frame_detection.vhd syn, sim
# |    ./lib_Ethernet/Preamble_check.vhd syn, sim
# |    ./lib_Ethernet/Preamble_Generator.vhd syn, sim
# |    ./lib_Ethernet/sync_newData.vhd syn, sim
# |    ./lib_Ethernet/sync_RxFrame.vhd syn, sim
# |    ./lib_Memory/DPRAM.vhd syn, sim
# |    ./lib_Memory/DPRAM_Plus.vhd syn, sim
# |    ./lib_Memory/FiFo_File.vhd syn, sim
# |    ./lib_Memory/FiFo_Sync_Ctrl.vhd syn, sim
# |    ./lib_Memory/FiFo_top.vhd syn, sim
# |    ./lib_Memory/read_logic.vhd syn, sim
# |    ./lib_Memory/write_logic.vhd syn, sim
# |    ./src_components/Address_Manager.vhd syn, sim
# |    ./src_components/Byte_to_TXData.vhd syn, sim
# |    ./src_components/Control_Register.vhd syn, sim
# |    ./src_components/Delay_FSM.vhd syn, sim
# |    ./src_components/Delay_Handler.vhd syn, sim
# |    ./src_components/Frame_collector.vhd syn, sim
# |    ./src_components/Frame_Create_FSM.vhd syn, sim
# |    ./src_components/Manipulation_Manager.vhd syn, sim
# |    ./src_components/ReadAddress_FSM.vhd syn, sim
# |    ./src_components/RXData_to_Byte.vhd syn, sim
# |    ./src_components/SoC_Cnter.vhd syn, sim
# |    ./src_components/StoreAddress_FSM.vhd syn, sim
# |    ./src_components/Task_Mem_Reset.vhd syn, sim
# |    ./src_components/Task_Memory.vhd syn, sim
# |    ./src_Manipulator_top_level/Data_Buffer.vhd syn, sim
# |    ./src_Manipulator_top_level/Frame_Creator.vhd syn, sim
# |    ./src_Manipulator_top_level/Frame_Receiver.vhd syn, sim
# |    ./src_Manipulator_top_level/Memory_Interface.vhd syn, sim
# |    ./src_Manipulator_top_level/Process_Unit.vhd syn, sim
# |
# +-----------------------------------

# +-----------------------------------
# | request TCL package from ACDS 10.1
# |
package require -exact sopc 10.1
# |
# +-----------------------------------

# +-----------------------------------
# | module FrameManipulator
# |
set_module_property NAME FrameManipulator
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property DISPLAY_NAME FrameManipulator
set_module_property TOP_LEVEL_HDL_FILE FrameManipulator.vhd
set_module_property TOP_LEVEL_HDL_MODULE FrameManipulator
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL TRUE
# |
# +-----------------------------------

# +-----------------------------------
# | files
# |
add_file FrameManipulator.vhd {SYNTHESIS SIMULATION}
add_file lib_Basics/adder_2121.vhd {SYNTHESIS SIMULATION}
add_file lib_Basics/Basic_Cnter.vhd {SYNTHESIS SIMULATION}
add_file lib_Basics/From_To_Cnt_Filter.vhd {SYNTHESIS SIMULATION}
add_file lib_Basics/Mux1D.vhd {SYNTHESIS SIMULATION}
add_file lib_Basics/Mux2D.vhd {SYNTHESIS SIMULATION}
add_file lib_Basics/shift_right_register.vhd {SYNTHESIS SIMULATION}
add_file lib_Ethernet/CRC_calculator.vhd {SYNTHESIS SIMULATION}
add_file lib_Ethernet/end_of_frame_detection.vhd {SYNTHESIS SIMULATION}
add_file lib_Ethernet/Preamble_check.vhd {SYNTHESIS SIMULATION}
add_file lib_Ethernet/Preamble_Generator.vhd {SYNTHESIS SIMULATION}
add_file lib_Ethernet/sync_newData.vhd {SYNTHESIS SIMULATION}
add_file lib_Ethernet/sync_RxFrame.vhd {SYNTHESIS SIMULATION}
add_file lib_Memory/DPRAM.vhd {SYNTHESIS SIMULATION}
add_file lib_Memory/DPRAM_Plus.vhd {SYNTHESIS SIMULATION}
add_file lib_Memory/FiFo_File.vhd {SYNTHESIS SIMULATION}
add_file lib_Memory/FiFo_Sync_Ctrl.vhd {SYNTHESIS SIMULATION}
add_file lib_Memory/FiFo_top.vhd {SYNTHESIS SIMULATION}
add_file lib_Memory/read_logic.vhd {SYNTHESIS SIMULATION}
add_file lib_Memory/write_logic.vhd {SYNTHESIS SIMULATION}
add_file src_components/Address_Manager.vhd {SYNTHESIS SIMULATION}
add_file src_components/Byte_to_TXData.vhd {SYNTHESIS SIMULATION}
add_file src_components/Control_Register.vhd {SYNTHESIS SIMULATION}
add_file src_components/Delay_FSM.vhd {SYNTHESIS SIMULATION}
add_file src_components/Delay_Handler.vhd {SYNTHESIS SIMULATION}
add_file src_components/Frame_collector.vhd {SYNTHESIS SIMULATION}
add_file src_components/Frame_Create_FSM.vhd {SYNTHESIS SIMULATION}
add_file src_components/Manipulation_Manager.vhd {SYNTHESIS SIMULATION}
add_file src_components/ReadAddress_FSM.vhd {SYNTHESIS SIMULATION}
add_file src_components/RXData_to_Byte.vhd {SYNTHESIS SIMULATION}
add_file src_components/SoC_Cnter.vhd {SYNTHESIS SIMULATION}
add_file src_components/StoreAddress_FSM.vhd {SYNTHESIS SIMULATION}
add_file src_components/Task_Mem_Reset.vhd {SYNTHESIS SIMULATION}
add_file src_components/Task_Memory.vhd {SYNTHESIS SIMULATION}
add_file src_Manipulator_top_level/Data_Buffer.vhd {SYNTHESIS SIMULATION}
add_file src_Manipulator_top_level/Frame_Creator.vhd {SYNTHESIS SIMULATION}
add_file src_Manipulator_top_level/Frame_Receiver.vhd {SYNTHESIS SIMULATION}
add_file src_Manipulator_top_level/Memory_Interface.vhd {SYNTHESIS SIMULATION}
add_file src_Manipulator_top_level/Process_Unit.vhd {SYNTHESIS SIMULATION}
# |
# +-----------------------------------

# +-----------------------------------
# | parameters
# |
add_parameter gBytesOfTheFrameBuffer NATURAL 1600
set_parameter_property gBytesOfTheFrameBuffer DEFAULT_VALUE 1600
set_parameter_property gBytesOfTheFrameBuffer DISPLAY_NAME gBytesOfTheFrameBuffer
set_parameter_property gBytesOfTheFrameBuffer TYPE NATURAL
set_parameter_property gBytesOfTheFrameBuffer UNITS None
set_parameter_property gBytesOfTheFrameBuffer ALLOWED_RANGES 0:2147483647
set_parameter_property gBytesOfTheFrameBuffer AFFECTS_GENERATION false
set_parameter_property gBytesOfTheFrameBuffer HDL_PARAMETER true
add_parameter gTaskBytesPerWord NATURAL 4
set_parameter_property gTaskBytesPerWord DEFAULT_VALUE 4
set_parameter_property gTaskBytesPerWord DISPLAY_NAME gTaskBytesPerWord
set_parameter_property gTaskBytesPerWord TYPE NATURAL
set_parameter_property gTaskBytesPerWord ENABLED false
set_parameter_property gTaskBytesPerWord UNITS None
set_parameter_property gTaskBytesPerWord ALLOWED_RANGES 0:2147483647
set_parameter_property gTaskBytesPerWord AFFECTS_GENERATION false
set_parameter_property gTaskBytesPerWord HDL_PARAMETER true
add_parameter gTaskAddr NATURAL 8
set_parameter_property gTaskAddr DEFAULT_VALUE 8
set_parameter_property gTaskAddr DISPLAY_NAME gTaskAddr
set_parameter_property gTaskAddr TYPE NATURAL
set_parameter_property gTaskAddr UNITS None
set_parameter_property gTaskAddr ALLOWED_RANGES 0:2147483647
set_parameter_property gTaskAddr AFFECTS_GENERATION false
set_parameter_property gTaskAddr HDL_PARAMETER true
add_parameter gTaskCount NATURAL 32
set_parameter_property gTaskCount DEFAULT_VALUE 32
set_parameter_property gTaskCount DISPLAY_NAME gTaskCount
set_parameter_property gTaskCount TYPE NATURAL
set_parameter_property gTaskCount UNITS None
set_parameter_property gTaskCount ALLOWED_RANGES 0:2147483647
set_parameter_property gTaskCount AFFECTS_GENERATION false
set_parameter_property gTaskCount HDL_PARAMETER true
add_parameter gControlBytesPerWord NATURAL 1
set_parameter_property gControlBytesPerWord DEFAULT_VALUE 1
set_parameter_property gControlBytesPerWord DISPLAY_NAME gControlBytesPerWord
set_parameter_property gControlBytesPerWord TYPE NATURAL
set_parameter_property gControlBytesPerWord ENABLED false
set_parameter_property gControlBytesPerWord UNITS None
set_parameter_property gControlBytesPerWord ALLOWED_RANGES 0:2147483647
set_parameter_property gControlBytesPerWord AFFECTS_GENERATION false
set_parameter_property gControlBytesPerWord HDL_PARAMETER true
add_parameter gControlAddr NATURAL 1
set_parameter_property gControlAddr DEFAULT_VALUE 1
set_parameter_property gControlAddr DISPLAY_NAME gControlAddr
set_parameter_property gControlAddr TYPE NATURAL
set_parameter_property gControlAddr ENABLED false
set_parameter_property gControlAddr UNITS None
set_parameter_property gControlAddr ALLOWED_RANGES 0:2147483647
set_parameter_property gControlAddr AFFECTS_GENERATION false
set_parameter_property gControlAddr HDL_PARAMETER true
# |
# +-----------------------------------

# +-----------------------------------
# | display items
# |
# |
# +-----------------------------------

# +-----------------------------------
# | connection point clock_50
# |
add_interface clock_50 clock end
set_interface_property clock_50 clockRate 50000000

set_interface_property clock_50 ENABLED true

add_interface_port clock_50 clk_50 clk Input 1
# |
# +-----------------------------------

# +-----------------------------------
# | connection point reset
# |
add_interface reset reset end
set_interface_property reset associatedClock clock_50
set_interface_property reset synchronousEdges DEASSERT

set_interface_property reset ENABLED true

add_interface_port reset reset reset Input 1
# |
# +-----------------------------------

# +-----------------------------------
# | connection point st_slave_tasks
# |
add_interface st_slave_tasks avalon end
set_interface_property st_slave_tasks addressAlignment DYNAMIC
set_interface_property st_slave_tasks addressUnits WORDS
set_interface_property st_slave_tasks associatedClock clock_slave
set_interface_property st_slave_tasks associatedReset reset
set_interface_property st_slave_tasks burstOnBurstBoundariesOnly false
set_interface_property st_slave_tasks explicitAddressSpan 0
set_interface_property st_slave_tasks holdTime 0
set_interface_property st_slave_tasks isMemoryDevice false
set_interface_property st_slave_tasks isNonVolatileStorage false
set_interface_property st_slave_tasks linewrapBursts false
set_interface_property st_slave_tasks maximumPendingReadTransactions 0
set_interface_property st_slave_tasks printableDevice false
set_interface_property st_slave_tasks readLatency 0
set_interface_property st_slave_tasks readWaitTime 1
set_interface_property st_slave_tasks setupTime 0
set_interface_property st_slave_tasks timingUnits Cycles
set_interface_property st_slave_tasks writeWaitTime 0

set_interface_property st_slave_tasks ENABLED true

add_interface_port st_slave_tasks st_address address Input gtaskaddr
add_interface_port st_slave_tasks st_writedata writedata Input gtaskbytesperword*8
add_interface_port st_slave_tasks st_write write Input 1
add_interface_port st_slave_tasks st_read read Input 1
add_interface_port st_slave_tasks st_readdata readdata Output gtaskbytesperword*8
add_interface_port st_slave_tasks st_byteenable byteenable Input gtaskbytesperword
# |
# +-----------------------------------

# +-----------------------------------
# | connection point sc_slave_control
# |
add_interface sc_slave_control avalon end
set_interface_property sc_slave_control addressAlignment DYNAMIC
set_interface_property sc_slave_control addressUnits WORDS
set_interface_property sc_slave_control associatedClock clock_slave
set_interface_property sc_slave_control associatedReset reset
set_interface_property sc_slave_control burstOnBurstBoundariesOnly false
set_interface_property sc_slave_control explicitAddressSpan 0
set_interface_property sc_slave_control holdTime 0
set_interface_property sc_slave_control isMemoryDevice false
set_interface_property sc_slave_control isNonVolatileStorage false
set_interface_property sc_slave_control linewrapBursts false
set_interface_property sc_slave_control maximumPendingReadTransactions 0
set_interface_property sc_slave_control printableDevice false
set_interface_property sc_slave_control readLatency 0
set_interface_property sc_slave_control readWaitTime 1
set_interface_property sc_slave_control setupTime 0
set_interface_property sc_slave_control timingUnits Cycles
set_interface_property sc_slave_control writeWaitTime 0

set_interface_property sc_slave_control ENABLED true

add_interface_port sc_slave_control sc_address address Input gcontroladdr
add_interface_port sc_slave_control sc_writedata writedata Input gcontrolbytesperword*8
add_interface_port sc_slave_control sc_write write Input 1
add_interface_port sc_slave_control sc_read read Input 1
add_interface_port sc_slave_control sc_readdata readdata Output gcontrolbytesperword*8
add_interface_port sc_slave_control sc_byteenable byteenable Input gcontrolbytesperword
# |
# +-----------------------------------

# +-----------------------------------
# | connection point conduit_end
# |
add_interface conduit_end conduit end

set_interface_property conduit_end ENABLED true

add_interface_port conduit_end oTXDV export Output 1
add_interface_port conduit_end oTXData export Output 2
add_interface_port conduit_end iRXD export Input 2
add_interface_port conduit_end iRXDV export Input 1
# |
# +-----------------------------------

# +-----------------------------------
# | connection point clock_slave
# |
add_interface clock_slave clock end
set_interface_property clock_slave clockRate 0

set_interface_property clock_slave ENABLED true

add_interface_port clock_slave s_clk clk Input 1
# |
# +-----------------------------------
