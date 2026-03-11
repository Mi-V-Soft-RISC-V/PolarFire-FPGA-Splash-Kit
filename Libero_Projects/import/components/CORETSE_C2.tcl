# Exporting Component Description of CORETSE_C2 to TCL
# Family: PolarFire
# Part Number: MPF300TS-1FCG484I
# Create and Configure the core component CORETSE_C2
create_and_configure_core -core_vlnv {Actel:DirectCore:CORETSE:3.2.119} -component_name {CORETSE_C2} -params {\
"GMII_TBI:0"  \
"MDIO_PHYID:18"  \
"PACKET_SIZE:11"  \
"SAL:true"  \
"SLIP_ENABLE:false"  \
"STATS:true"  \
"WoL:true"   }
# Exporting Component Description of CORETSE_C2 to TCL done
