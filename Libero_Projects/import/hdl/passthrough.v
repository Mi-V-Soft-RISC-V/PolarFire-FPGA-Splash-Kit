module passthrough( port_in, port_out );
input port_in;
output port_out;

assign port_out = port_in;

endmodule