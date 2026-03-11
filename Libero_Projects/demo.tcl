# Microsemi Tcl Script
# libero
# Date: Wed Feb 25 13:11:18 2026
# Directory C:\Users\declan\Downloads
# File C:\Users\declan\Downloads\exported4.tcl

set sd_name {demo}
set exProgramHex {demo.hex}

new_project -location {./MIV_RV32_CFG1_BD} -name {MIV_RV32_CFG1_BD} -project_description {} -block_mode 0 -standalone_peripheral_initialization 0 -instantiate_in_smartdesign 1 -ondemand_build_dh 1 -use_relative_path 0 -linked_files_root_dir_env {} -hdl {VERILOG} -family {PolarFire} -die {MPF300TS} -package {FCG484} -speed {-1} -die_voltage {1.0} -part_range {IND} -adv_options {IO_DEFT_STD:LVCMOS 1.8V} -adv_options {RESTRICTPROBEPINS:1} -adv_options {RESTRICTSPIPINS:0} -adv_options {SYSTEM_CONTROLLER_SUSPEND_MODE:0} -adv_options {TEMPR:IND} -adv_options {VCCI_1.2_VOLTR:IND} -adv_options {VCCI_1.5_VOLTR:IND} -adv_options {VCCI_1.8_VOLTR:IND} -adv_options {VCCI_2.5_VOLTR:IND} -adv_options {VCCI_3.3_VOLTR:IND} -adv_options {VOLTR:IND}
set_device -family {PolarFire} -die {MPF300TS} -package {FCG484} -speed {-1} -die_voltage {1.0} -part_range {IND} -adv_options {IO_DEFT_STD:LVCMOS 1.8V} -adv_options {RESTRICTPROBEPINS:1} -adv_options {RESTRICTSPIPINS:0} -adv_options {SYSTEM_CONTROLLER_SUSPEND_MODE:0} -adv_options {TEMPR:IND} -adv_options {VCCI_1.2_VOLTR:IND} -adv_options {VCCI_1.5_VOLTR:IND} -adv_options {VCCI_1.8_VOLTR:IND} -adv_options {VCCI_2.5_VOLTR:IND} -adv_options {VCCI_3.3_VOLTR:IND} -adv_options {VOLTR:IND}
create_smartdesign -sd_name {demo}

import_files \
    -convert_EDN_to_HDL 0 \
    -library {work} \
    -hdl_source {./import/hdl/data_generator.sv} \
    -hdl_source {./import/hdl/udp_framer_multi.sv} \
    -hdl_source {./import/hdl/lvds_receiver.v} \
    -hdl_source {./import/hdl/pixel_engine.v} \
    -hdl_source {./import/hdl/crc_table.sv}

build_design_hierarchy

source ./import/components/CoreFIFO_C0.tcl
source ./import/components/CORETSE_C2.tcl
source ./import/components/lvds_receiver.tcl
source ./import/components/PF_IO_C1.tcl
source ./import/components/PF_RGMII_TO_GMII_C0.tcl
source ./import/components/pixel_engine.tcl
source ./import/components/PF_INIT_MONITOR_C0.tcl
source ./import/components/CORERESET_PF_C0.tcl
source ./import/components/PF_CCC_C0.tcl
source ./import/components/CoreJTAGDebug_TRSTN_C0.tcl
source ./import/components/MIV_ESS_C0.tcl
source ./import/components/MIV_RV32_CFG1_C0.tcl
source ./import/components/PF_SRAM_AHB_C0.tcl

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_D0_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_D0_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_D1_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_D1_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_D2_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_D2_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_D3_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_D3_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_D4_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_D4_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_D5_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_D5_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_D6_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_D6_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_D7_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_D7_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_DCLK_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_DCLK_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REF_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RGMII_RXC} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RGMII_RX_CTL} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RX} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPI_SDI} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SW_1} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SW_2} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TCK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TDI} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TMS} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TRSTB} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USER_RST} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {LED_1} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED_2} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED_3} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED_4} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PHY_MDC} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PHY_RST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RGMII_TXC} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RGMII_TX_CTL} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPI_CSN} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPI_SCK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SPI_SDO} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TDO} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TX} -port_direction {OUT}

sd_create_scalar_port -sd_name ${sd_name} -port_name {PHY_MDIO} -port_direction {INOUT} -port_is_pad {1}

# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {RGMII_RXD} -port_direction {IN} -port_range {[3:0]} -port_is_pad {1}

sd_create_bus_port -sd_name ${sd_name} -port_name {RGMII_TXD} -port_direction {OUT} -port_range {[3:0]} -port_is_pad {1}


# Add BIBUF_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_0}



# Add CLKINT_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {CLKINT} -instance_name {CLKINT_0}



# Add COREFIFO_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREFIFO_C0} -instance_name {COREFIFO_C0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {COREFIFO_C0_0:FULL}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {COREFIFO_C0_0:EMPTY}



# Add COREFIFO_C3_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREFIFO_C0} -instance_name {COREFIFO_C3_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {COREFIFO_C3_0:FULL}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {COREFIFO_C3_0:EMPTY}



# Add COREFIFO_C4_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREFIFO_C0} -instance_name {COREFIFO_C4_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {COREFIFO_C4_0:FULL}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {COREFIFO_C4_0:EMPTY}



# Add COREFIFO_C5_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREFIFO_C0} -instance_name {COREFIFO_C5_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {COREFIFO_C5_0:FULL}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {COREFIFO_C5_0:EMPTY}



# Add CoreJTAGDebug_TRSTN_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreJTAGDebug_TRSTN_C0} -instance_name {CoreJTAGDebug_TRSTN_C0_0}



# Add CORERESET_PF_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORERESET_PF_C0} -instance_name {CORERESET_PF_C0_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_0:BANK_x_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_0:BANK_y_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_0:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_0:FF_US_RESTORE} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORERESET_PF_C0_0:PLL_POWERDOWN_B}



# Add CORETSE_C2_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORETSE_C2} -instance_name {CORETSE_C2_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORETSE_C2_0:STBP} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORETSE_C2_0:MTXCFRM} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORETSE_C2_0:MTXHWM}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORETSE_C2_0:MRXRDY}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORETSE_C2_0:MRXACPT} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORETSE_C2_0:MRXSOF}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORETSE_C2_0:MRXEOF}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORETSE_C2_0:GTXCLK} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORETSE_C2_0:MTXBYTEVALID} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORETSE_C2_0:MRXDAT}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORETSE_C2_0:MRXBYTEVALID}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORETSE_C2_0:TSM_INTR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORETSE_C2_0:TSM_CONTROL}


# Add data_generator_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {data_generator} -hdl_file {hdl\data_generator.sv} -instance_name {data_generator_0}



# Add data_generator_1 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {data_generator} -hdl_file {hdl\data_generator.sv} -instance_name {data_generator_1}



# Add data_generator_2 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {data_generator} -hdl_file {hdl\data_generator.sv} -instance_name {data_generator_2}



# Add data_generator_3 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {data_generator} -hdl_file {hdl\data_generator.sv} -instance_name {data_generator_3}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {data_generator_3:w_en}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {data_generator_3:data}



# Add INBUF_DIFF_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INBUF_DIFF} -instance_name {INBUF_DIFF_0}



# Add lvds_receiver_1 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {lvds_receiver} -instance_name {lvds_receiver_1}
# Exporting Parameters of instance lvds_receiver_1
sd_configure_core_instance -sd_name ${sd_name} -instance_name {lvds_receiver_1} -params {\
"D:16" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {lvds_receiver_1}
sd_update_instance -sd_name ${sd_name} -instance_name {lvds_receiver_1}



# Add MIV_ESS_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {MIV_ESS_C0} -instance_name {MIV_ESS_C0_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_ESS_C0_0:GPIO_IN} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_ESS_C0_0:GPIO_IN} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_ESS_C0_0:GPIO_IN} -pin_slices {[3:2]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_ESS_C0_0:GPIO_IN[3:2]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_ESS_C0_0:GPIO_OUT} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_ESS_C0_0:GPIO_OUT} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_ESS_C0_0:GPIO_OUT} -pin_slices {[2:2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_ESS_C0_0:GPIO_OUT} -pin_slices {[3:3]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MIV_ESS_C0_0:GPIO_INT}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MIV_ESS_C0_0:SPI_SS}



# Add MIV_RV32_CFG1_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {MIV_RV32_CFG1_C0} -instance_name {MIV_RV32_CFG1_C0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MIV_RV32_CFG1_C0_0:EXT_RESETN}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MIV_RV32_CFG1_C0_0:JTAG_TDO_DR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MIV_RV32_CFG1_C0_0:TIME_COUNT_OUT}



# Add OR2_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {OR2} -instance_name {OR2_0}



# Add OR2_0_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {OR2} -instance_name {OR2_0_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {OR2_0_0:B} -value {GND}



# Add OR2_1 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {OR2} -instance_name {OR2_1}



# Add PF_CCC_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_CCC_C0} -instance_name {PF_CCC_C0_0}



# Add PF_INIT_MONITOR_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_INIT_MONITOR_C0} -instance_name {PF_INIT_MONITOR_C0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_C0_0:PCIE_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_C0_0:USRAM_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_C0_0:SRAM_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_C0_0:XCVR_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_C0_0:USRAM_INIT_FROM_SNVM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_C0_0:USRAM_INIT_FROM_UPROM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_C0_0:USRAM_INIT_FROM_SPI_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_C0_0:SRAM_INIT_FROM_SNVM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_C0_0:SRAM_INIT_FROM_UPROM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_C0_0:SRAM_INIT_FROM_SPI_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_C0_0:AUTOCALIB_DONE}



# Add PF_IO_C1_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_IO_C1} -instance_name {PF_IO_C1_0}



# Add PF_IO_C1_0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_IO_C1} -instance_name {PF_IO_C1_0_0}



# Add PF_IO_C1_0_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_IO_C1} -instance_name {PF_IO_C1_0_1}



# Add PF_IO_C1_0_2 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_IO_C1} -instance_name {PF_IO_C1_0_2}



# Add PF_IO_C1_0_3 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_IO_C1} -instance_name {PF_IO_C1_0_3}



# Add PF_IO_C1_0_4 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_IO_C1} -instance_name {PF_IO_C1_0_4}



# Add PF_IO_C1_0_5 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_IO_C1} -instance_name {PF_IO_C1_0_5}



# Add PF_IO_C1_0_5_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_IO_C1} -instance_name {PF_IO_C1_0_5_0}



# Add PF_RGMII_TO_GMII_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_RGMII_TO_GMII_C0} -instance_name {PF_RGMII_TO_GMII_C0_0}



# Add PF_SRAM_AHB_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_SRAM_AHB_C0} -instance_name {PF_SRAM_AHB_C0_0}



# Add pixel_engine_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {pixel_engine} -instance_name {pixel_engine_0}
# Exporting Parameters of instance pixel_engine_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {pixel_engine_0} -params {\
"ADD_END:7" \
"ADD_START:4" \
"FRAME_DIV:64" \
"LINE_DIV:32" \
"PIX_DIV:16" \
"SUB_END:14" \
"SUB_START:10" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {pixel_engine_0}
sd_update_instance -sd_name ${sd_name} -instance_name {pixel_engine_0}



# Add udp_framer_multi_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {udp_framer_multi} -hdl_file {hdl\udp_framer_multi.sv} -instance_name {udp_framer_multi_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {udp_framer_multi_0:empty} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {udp_framer_multi_0:empty} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {udp_framer_multi_0:empty} -pin_slices {[2:2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {udp_framer_multi_0:empty} -pin_slices {[3:3]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {udp_framer_multi_0:data_in} -pin_slices {[127:96]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {udp_framer_multi_0:data_in} -pin_slices {[31:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {udp_framer_multi_0:data_in} -pin_slices {[63:32]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {udp_framer_multi_0:data_in} -pin_slices {[95:64]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {udp_framer_multi_0:rd_enable} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {udp_framer_multi_0:rd_enable} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {udp_framer_multi_0:rd_enable} -pin_slices {[2:2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {udp_framer_multi_0:rd_enable} -pin_slices {[3:3]}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"ADC_D0_N" "PF_IO_C1_0:PADIN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ADC_D0_P" "PF_IO_C1_0:PADIP" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ADC_D1_N" "PF_IO_C1_0_0:PADIN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ADC_D1_P" "PF_IO_C1_0_0:PADIP" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ADC_D2_N" "PF_IO_C1_0_1:PADIN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ADC_D2_P" "PF_IO_C1_0_1:PADIP" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ADC_D3_N" "PF_IO_C1_0_4:PADIN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ADC_D3_P" "PF_IO_C1_0_4:PADIP" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ADC_D4_N" "PF_IO_C1_0_3:PADIN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ADC_D4_P" "PF_IO_C1_0_3:PADIP" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ADC_D5_N" "PF_IO_C1_0_2:PADIN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ADC_D5_P" "PF_IO_C1_0_2:PADIP" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ADC_D6_N" "PF_IO_C1_0_5:PADIN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ADC_D6_P" "PF_IO_C1_0_5:PADIP" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ADC_D7_N" "PF_IO_C1_0_5_0:PADIN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ADC_D7_P" "PF_IO_C1_0_5_0:PADIP" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ADC_DCLK_N" "INBUF_DIFF_0:PADN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ADC_DCLK_P" "INBUF_DIFF_0:PADP" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_0:D" "CORETSE_C2_0:MDO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_0:E" "CORETSE_C2_0:MDOEN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_0:PAD" "PHY_MDIO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_0:Y" "CORETSE_C2_0:MDI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLKINT_0:A" "REF_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLKINT_0:Y" "PF_CCC_C0_0:REF_CLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C0_0:AEMPTY" "udp_framer_multi_0:empty[3:3]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C0_0:AFULL" "data_generator_0:full" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C0_0:RCLOCK" "COREFIFO_C3_0:RCLOCK" "COREFIFO_C4_0:RCLOCK" "COREFIFO_C5_0:RCLOCK" "CORERESET_PF_C0_0:CLK" "CORETSE_C2_0:MRXCLK" "CORETSE_C2_0:MTXCLK" "CORETSE_C2_0:PCLK" "MIV_ESS_C0_0:PCLK" "MIV_RV32_CFG1_C0_0:CLK" "PF_CCC_C0_0:OUT0_FABCLK_0" "PF_SRAM_AHB_C0_0:HCLK" "lvds_receiver_1:pclk" "pixel_engine_0:pclk" "udp_framer_multi_0:clk" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C0_0:RE" "udp_framer_multi_0:rd_enable[3:3]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C0_0:RRESET_N" "COREFIFO_C0_0:WRESET_N" "COREFIFO_C3_0:RRESET_N" "COREFIFO_C3_0:WRESET_N" "COREFIFO_C4_0:RRESET_N" "COREFIFO_C4_0:WRESET_N" "COREFIFO_C5_0:RRESET_N" "COREFIFO_C5_0:WRESET_N" "CORERESET_PF_C0_0:FABRIC_RESET_N" "CORETSE_C2_0:PRESETN" "MIV_ESS_C0_0:PRESETN" "MIV_RV32_CFG1_C0_0:RESETN" "PF_SRAM_AHB_C0_0:HRESETN" "PHY_RST" "data_generator_0:resetn" "data_generator_1:resetn" "data_generator_2:resetn" "data_generator_3:resetn" "lvds_receiver_1:presetn" "pixel_engine_0:presetn" "udp_framer_multi_0:resetn" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C0_0:WCLOCK" "COREFIFO_C3_0:WCLOCK" "COREFIFO_C4_0:WCLOCK" "PF_CCC_C0_0:OUT1_FABCLK_0" "data_generator_0:clk" "data_generator_1:clk" "data_generator_2:clk" "data_generator_3:clk" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C0_0:WE" "data_generator_0:w_en" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C3_0:AEMPTY" "udp_framer_multi_0:empty[2:2]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C3_0:AFULL" "data_generator_1:full" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C3_0:RE" "udp_framer_multi_0:rd_enable[2:2]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C3_0:WE" "data_generator_1:w_en" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C4_0:AEMPTY" "udp_framer_multi_0:empty[1:1]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C4_0:AFULL" "data_generator_2:full" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C4_0:RE" "udp_framer_multi_0:rd_enable[1:1]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C4_0:WE" "data_generator_2:w_en" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C5_0:AEMPTY" "OR2_0:B" "udp_framer_multi_0:empty[0:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C5_0:AFULL" "OR2_1:B" "data_generator_3:full" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C5_0:RE" "udp_framer_multi_0:rd_enable[0:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C5_0:WCLOCK" "lvds_receiver_1:write_clk" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C5_0:WE" "lvds_receiver_1:write_en" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_0:EXT_RST_N" "USER_RST" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_0:FPGA_POR_N" "PF_INIT_MONITOR_C0_0:FABRIC_POR_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_0:INIT_DONE" "PF_INIT_MONITOR_C0_0:DEVICE_INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C0_0:PLL_LOCK" "PF_CCC_C0_0:PLL_LOCK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORETSE_C2_0:COL" "PF_RGMII_TO_GMII_C0_0:GMII_COL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORETSE_C2_0:CRS" "PF_RGMII_TO_GMII_C0_0:GMII_CRS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORETSE_C2_0:MDC" "PHY_MDC" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORETSE_C2_0:MTXACPT" "udp_framer_multi_0:mtx_acpt" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORETSE_C2_0:MTXEOF" "udp_framer_multi_0:mtx_eof" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORETSE_C2_0:MTXRDY" "udp_framer_multi_0:mtx_rdy" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORETSE_C2_0:MTXSOF" "udp_framer_multi_0:mtx_sof" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORETSE_C2_0:RXCLK" "CORETSE_C2_0:TXCLK" "PF_RGMII_TO_GMII_C0_0:GMII_RXCLK" "PF_RGMII_TO_GMII_C0_0:GMII_TXCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORETSE_C2_0:RXDV" "PF_RGMII_TO_GMII_C0_0:GMII_RX_DV" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORETSE_C2_0:RXER" "PF_RGMII_TO_GMII_C0_0:GMII_RX_ER" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORETSE_C2_0:TXEN" "PF_RGMII_TO_GMII_C0_0:GMII_TX_EN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORETSE_C2_0:TXER" "PF_RGMII_TO_GMII_C0_0:GMII_TX_ER" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_TRSTN_C0_0:TCK" "TCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_TRSTN_C0_0:TDI" "TDI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_TRSTN_C0_0:TDO" "TDO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_TRSTN_C0_0:TGT_TCK_0" "MIV_RV32_CFG1_C0_0:JTAG_TCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_TRSTN_C0_0:TGT_TDI_0" "MIV_RV32_CFG1_C0_0:JTAG_TDI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_TRSTN_C0_0:TGT_TDO_0" "MIV_RV32_CFG1_C0_0:JTAG_TDO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_TRSTN_C0_0:TGT_TMS_0" "MIV_RV32_CFG1_C0_0:JTAG_TMS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_TRSTN_C0_0:TGT_TRSTN_0" "MIV_RV32_CFG1_C0_0:JTAG_TRSTN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_TRSTN_C0_0:TMS" "TMS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_TRSTN_C0_0:TRSTB" "TRSTB" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"INBUF_DIFF_0:Y" "PF_IO_C1_0:RX_CLK" "PF_IO_C1_0_0:RX_CLK" "PF_IO_C1_0_1:RX_CLK" "PF_IO_C1_0_2:RX_CLK" "PF_IO_C1_0_3:RX_CLK" "PF_IO_C1_0_4:RX_CLK" "PF_IO_C1_0_5:RX_CLK" "PF_IO_C1_0_5_0:RX_CLK" "lvds_receiver_1:dck" "pixel_engine_0:dck" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LED_1" "MIV_ESS_C0_0:GPIO_OUT[0:0]" "data_generator_0:enable" "data_generator_1:enable" "data_generator_2:enable" "data_generator_3:enable" "lvds_receiver_1:gpio_fill" "pixel_engine_0:gpio_fill" "udp_framer_multi_0:enable" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LED_2" "OR2_1:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LED_3" "OR2_0:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LED_4" "OR2_0_0:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_ESS_C0_0:GPIO_IN[0:0]" "SW_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_ESS_C0_0:GPIO_IN[1:1]" "SW_2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_ESS_C0_0:GPIO_OUT[1:1]" "OR2_1:A" "SPI_CSN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_ESS_C0_0:GPIO_OUT[2:2]" "OR2_0:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_ESS_C0_0:GPIO_OUT[3:3]" "OR2_0_0:A" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_ESS_C0_0:SPI_SCK" "SPI_SCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_ESS_C0_0:SPI_SDI" "SPI_SDI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_ESS_C0_0:SPI_SDO" "SPI_SDO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_ESS_C0_0:UART_RX" "RX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_ESS_C0_0:UART_TX" "TX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IO_C1_0:QF" "lvds_receiver_1:d0_f" "pixel_engine_0:d0_f" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IO_C1_0:QR" "lvds_receiver_1:d0_r" "pixel_engine_0:d0_r" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IO_C1_0_0:QF" "lvds_receiver_1:d1_f" "pixel_engine_0:d1_f" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IO_C1_0_0:QR" "lvds_receiver_1:d1_r" "pixel_engine_0:d1_r" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IO_C1_0_1:QF" "lvds_receiver_1:d2_f" "pixel_engine_0:d2_f" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IO_C1_0_1:QR" "lvds_receiver_1:d2_r" "pixel_engine_0:d2_r" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IO_C1_0_2:QF" "lvds_receiver_1:d5_f" "pixel_engine_0:d5_f" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IO_C1_0_2:QR" "lvds_receiver_1:d5_r" "pixel_engine_0:d5_r" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IO_C1_0_3:QF" "lvds_receiver_1:d4_f" "pixel_engine_0:d4_f" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IO_C1_0_3:QR" "lvds_receiver_1:d4_r" "pixel_engine_0:d4_r" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IO_C1_0_4:QF" "lvds_receiver_1:d3_f" "pixel_engine_0:d3_f" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IO_C1_0_4:QR" "lvds_receiver_1:d3_r" "pixel_engine_0:d3_r" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IO_C1_0_5:QF" "lvds_receiver_1:d6_f" "pixel_engine_0:d6_f" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IO_C1_0_5:QR" "lvds_receiver_1:d6_r" "pixel_engine_0:d6_r" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IO_C1_0_5_0:QF" "lvds_receiver_1:d7_f" "pixel_engine_0:d7_f" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IO_C1_0_5_0:QR" "lvds_receiver_1:d7_r" "pixel_engine_0:d7_r" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_RGMII_TO_GMII_C0_0:RGMII_RXC" "RGMII_RXC" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_RGMII_TO_GMII_C0_0:RGMII_RX_CTL" "RGMII_RX_CTL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_RGMII_TO_GMII_C0_0:RGMII_TXC" "RGMII_TXC" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_RGMII_TO_GMII_C0_0:RGMII_TX_CTL" "RGMII_TX_CTL" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C0_0:DATA" "data_generator_0:data" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C0_0:Q" "udp_framer_multi_0:data_in[127:96]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C3_0:DATA" "data_generator_1:data" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C3_0:Q" "udp_framer_multi_0:data_in[95:64]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C4_0:DATA" "data_generator_2:data" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C4_0:Q" "udp_framer_multi_0:data_in[63:32]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C5_0:DATA" "lvds_receiver_1:data_out" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREFIFO_C5_0:Q" "udp_framer_multi_0:data_in[31:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORETSE_C2_0:MTXDAT" "udp_framer_multi_0:mtx_dat" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORETSE_C2_0:RXD" "PF_RGMII_TO_GMII_C0_0:GMII_RXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORETSE_C2_0:TXD" "PF_RGMII_TO_GMII_C0_0:GMII_TXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_RGMII_TO_GMII_C0_0:RGMII_RXD" "RGMII_RXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_RGMII_TO_GMII_C0_0:RGMII_TXD" "RGMII_TXD" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORETSE_C2_0:APBS" "MIV_ESS_C0_0:APB_3_mTARGET" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_ESS_C0_0:APB_0_mINITIATOR" "MIV_RV32_CFG1_C0_0:APB_INITIATOR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_ESS_C0_0:APB_11_mTARGET" "pixel_engine_0:APB_BIF" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_ESS_C0_0:APB_4_mTARGET" "lvds_receiver_1:APB_BIF" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_RV32_CFG1_C0_0:AHBL_M_TARGET" "PF_SRAM_AHB_C0_0:AHBSlaveInterface" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "BaseDesign"
generate_component -component_name ${sd_name}

build_design_hierarchy
set_root -module {demo::work}


# Import constraint files
import_files -sdc ./import/constraints/timing_constraints.sdc
import_files -io_pdc ./import/constraints/io/io_constraints.pdc
import_files -io_pdc ./import/constraints/io/user_io_constraints.pdc

# Specify constraint files to be used by each tool
organize_tool_files -tool {PLACEROUTE} \
	-file ./MIV_RV32_CFG1_BD/constraint/io/io_constraints.pdc \
    -file ./MIV_RV32_CFG1_BD/constraint/io/user_io_constraints.pdc \
    -file ./MIV_RV32_CFG1_BD/constraint/timing_constraints.sdc \
	-module ${sd_name}::work -input_type {constraint}

organize_tool_files -tool {SYNTHESIZE} \
	-file ./MIV_RV32_CFG1_BD/constraint/timing_constraints.sdc \
	-module ${sd_name}::work -input_type {constraint}

organize_tool_files -tool {VERIFYTIMING} \
	-file ./MIV_RV32_CFG1_BD/constraint/timing_constraints.sdc \
	-module ${sd_name}::work -input_type {constraint}


configure_tool -name {PLACEROUTE} -params {EFFORT_LEVEL:false} -params {REPAIR_MIN_DELAY:true} -params {TDPR:true}


run_tool -name {SYNTHESIZE}
run_tool -name {PLACEROUTE}
run_tool -name {VERIFYTIMING}
save_project
