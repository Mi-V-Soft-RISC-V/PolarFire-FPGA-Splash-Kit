# Exporting core lvds_receiver to TCL
# Exporting Create HDL core command for module lvds_receiver
create_hdl_core -file {hdl/lvds_receiver.v} -module {lvds_receiver} -library {work} -package {}
# Exporting BIF information of  HDL core command for module lvds_receiver
hdl_core_add_bif -hdl_core_name {lvds_receiver} -bif_definition {APB:AMBA:AMBA2:slave} -bif_name {APB_BIF} -signal_map {\
"PADDR:paddr" \
"PSELx:psel" \
"PENABLE:penable" \
"PWRITE:pwrite" \
"PRDATA:prdata" \
"PWDATA:pwdata" \
"PREADY:pready" \
"PSLVERR:pslverr" }
