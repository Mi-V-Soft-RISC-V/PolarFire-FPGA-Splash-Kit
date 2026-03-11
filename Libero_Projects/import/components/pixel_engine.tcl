# Exporting core pixel_engine to TCL
# Exporting Create HDL core command for module pixel_engine
create_hdl_core -file {hdl/pixel_engine.v} -module {pixel_engine} -library {work} -package {}
# Exporting BIF information of  HDL core command for module pixel_engine
hdl_core_add_bif -hdl_core_name {pixel_engine} -bif_definition {APB:AMBA:AMBA2:slave} -bif_name {APB_BIF} -signal_map {\
"PADDR:paddr" \
"PENABLE:penable" \
"PWRITE:pwrite" \
"PRDATA:prdata" \
"PWDATA:pwdata" \
"PREADY:pready" \
"PSLVERR:pslverr" \
"PSELx:psel" }
