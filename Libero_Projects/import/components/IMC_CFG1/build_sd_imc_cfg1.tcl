#MIV Cores    : MIV_RV32
#
#Libero's TCL top level script
#
#This Tcl file sources other Tcl files to build the design(on which recursive export is run) in a bottom-up fashion

#Sourcing the Tcl files for creating individual components under the top level
source ./import/components/SHARED_COMPONENTS/CoreJTAGDebug_0.tcl 
source ./import/components/SHARED_COMPONENTS/CoreRESET_PF_0.tcl 
source ./import/components/SHARED_COMPONENTS/CoreTimer_0.tcl 
source ./import/components/SHARED_COMPONENTS/CoreTimer_1.tcl 
source ./import/components/SHARED_COMPONENTS/MIV_RV32_CFG1_0.tcl 
source ./import/components/SHARED_COMPONENTS/PF_CCC_0.tcl 
source ./import/components/SHARED_COMPONENTS/PF_INIT_MONITOR_0.tcl 
source ./import/components/SHARED_COMPONENTS/PF_OSC_0.tcl 
source ./import/components/SHARED_COMPONENTS/PF_SRAM_0.tcl 
source ./import/components/SHARED_COMPONENTS/MIV_ESS_0.tcl 

# Creating SmartDesign BaseDesign
set sd_name {BaseDesign}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {TDO} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TRSTB} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TCK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TDI} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TMS} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RX} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TX} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USER_RST} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {SW_3} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SW_4} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED_1} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED_2} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED_3} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LED_4} -port_direction {OUT}


# Add CoreJTAGDebug_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreJTAGDebug_0} -instance_name {CoreJTAGDebug_0}



# Add CoreRESET_PF_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreRESET_PF_0} -instance_name {CoreRESET_PF_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CoreRESET_PF_0:BANK_x_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CoreRESET_PF_0:BANK_y_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CoreRESET_PF_0:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CoreRESET_PF_0:FF_US_RESTORE} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreRESET_PF_0:PLL_POWERDOWN_B}



# Add CoreTimer_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreTimer_0} -instance_name {CoreTimer_0}



# Add CoreTimer_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreTimer_1} -instance_name {CoreTimer_1}



# Add MIV_RV32_CFG1_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {MIV_RV32_CFG1_0} -instance_name {MIV_RV32_CFG1_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MIV_RV32_CFG1_0:TIME_COUNT_OUT}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MIV_RV32_CFG1_0:JTAG_TDO_DR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MIV_RV32_CFG1_0:EXT_RESETN}



# Add MIV_ESS_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {MIV_ESS_0} -instance_name {MIV_ESS_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_ESS_0:GPIO_IN} -pin_slices {[0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_ESS_0:GPIO_IN} -pin_slices {[1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_ESS_0:GPIO_IN} -pin_slices {[3:2]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {MIV_ESS_0:GPIO_IN[3:2]} -value {GND}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_ESS_0:GPIO_OUT} -pin_slices {[0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_ESS_0:GPIO_OUT} -pin_slices {[1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_ESS_0:GPIO_OUT} -pin_slices {[2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIV_ESS_0:GPIO_OUT} -pin_slices {[3]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {MIV_ESS_0:GPIO_INT}



# Add PF_CCC_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_CCC_0} -instance_name {PF_CCC_0}



# Add PF_INIT_MONITOR_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_INIT_MONITOR_0} -instance_name {PF_INIT_MONITOR_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_0:PCIE_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_0:USRAM_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_0:SRAM_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_0:XCVR_INIT_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_0:USRAM_INIT_FROM_SNVM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_0:USRAM_INIT_FROM_UPROM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_0:USRAM_INIT_FROM_SPI_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_0:SRAM_INIT_FROM_SNVM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_0:SRAM_INIT_FROM_UPROM_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_0:SRAM_INIT_FROM_SPI_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_INIT_MONITOR_0:AUTOCALIB_DONE}



# Add PF_OSC_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_OSC_0} -instance_name {PF_OSC_0}



# Add PF_SRAM_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_SRAM_0} -instance_name {PF_SRAM_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_0:TGT_TCK_0" "MIV_RV32_CFG1_0:JTAG_TCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_0:TGT_TDI_0" "MIV_RV32_CFG1_0:JTAG_TDI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_0:TGT_TDO_0" "MIV_RV32_CFG1_0:JTAG_TDO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_0:TGT_TMS_0" "MIV_RV32_CFG1_0:JTAG_TMS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_0:TGT_TRSTN_0" "MIV_RV32_CFG1_0:JTAG_TRSTN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_ESS_0:PRESETN" "CoreTimer_0:PRESETn" "CoreTimer_1:PRESETn" "CoreRESET_PF_0:FABRIC_RESET_N" "PF_SRAM_0:HRESETN" "MIV_RV32_CFG1_0:RESETN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreTimer_0:TIMINT" "MIV_RV32_CFG1_0:MSYS_EI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreTimer_1:TIMINT" "MIV_RV32_CFG1_0:EXT_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_0:OUT0_FABCLK_0" "MIV_ESS_0:PCLK" "CoreTimer_0:PCLK" "CoreTimer_1:PCLK" "CoreRESET_PF_0:CLK" "PF_SRAM_0:HCLK" "MIV_RV32_CFG1_0:CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_0:PLL_LOCK_0" "CoreRESET_PF_0:PLL_LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreRESET_PF_0:INIT_DONE" "PF_INIT_MONITOR_0:DEVICE_INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_0:REF_CLK_0" "PF_OSC_0:RCOSC_160MHZ_GL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_0:TCK" "TCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_0:TDI" "TDI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_0:TDO" "TDO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_0:TMS" "TMS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreJTAGDebug_0:TRSTB" "TRSTB" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_ESS_0:UART_RX" "RX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_ESS_0:UART_TX" "TX" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreRESET_PF_0:EXT_RST_N" "USER_RST" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_INIT_MONITOR_0:FABRIC_POR_N" "CoreRESET_PF_0:FPGA_POR_N"}


# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_ESS_0:GPIO_IN[0]" "SW_3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_ESS_0:GPIO_IN[1]" "SW_4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_ESS_0:GPIO_OUT[0]" "LED_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_ESS_0:GPIO_OUT[1]" "LED_2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_ESS_0:GPIO_OUT[2]" "LED_3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_ESS_0:GPIO_OUT[3]" "LED_4" }


# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_ESS_0:APB_3_mTARGET" "CoreTimer_0:APBslave" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_ESS_0:APB_4_mTARGET" "CoreTimer_1:APBslave" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_ESS_0:APB_0_mINITIATOR" "MIV_RV32_CFG1_0:APB_MSTR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIV_RV32_CFG1_0:AHBL_M_SLV" "PF_SRAM_0:AHBSlaveInterface" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Re-arrange SmartDesign layout
sd_reset_layout -sd_name ${sd_name}
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign BaseDesign
generate_component -component_name ${sd_name}
