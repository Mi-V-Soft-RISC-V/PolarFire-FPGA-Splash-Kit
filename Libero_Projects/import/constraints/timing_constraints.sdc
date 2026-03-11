# Specify clock frequencies
create_clock -name { TCK } -period 166.67 -waveform { 0 83.33 } [ get_ports { TCK } ]
create_clock -name {REF_CLK} -period 20 [ get_ports { REF_CLK } ]
create_clock -name {RGMII_RXC} -period 8 [ get_ports { RGMII_RXC } ]
create_clock -name {ADC_DCLK} -period 5 [ get_ports { ADC_DCLK_P } ]

create_generated_clock -name {PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT0} -divide_by 1 -source [ get_pins { PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/REF_CLK_0 } ] -phase 0 [ get_pins { PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT0 } ]
create_generated_clock -name {PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT1} -multiply_by 5 -divide_by 2 -source [ get_pins { PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/REF_CLK_0 } ] -phase 0 [ get_pins { PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT1 } ]

# set_false_path -to [ get_cells { COREFIFO_C5_0/COREFIFO_C5_0/genblk*.U_corefifo_async/*/shift_reg* } ]

# Set clock domains as asynchronous
set_clock_groups -name {async1} -asynchronous -group [ get_clocks { PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT0 } ] -group [ get_clocks { TCK } ]
set_clock_groups -name {async2} -asynchronous -group [ get_clocks { PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT0 } ] -group [ get_clocks { RGMII_RXC } ]
set_clock_groups -name {async3} -asynchronous -group [ get_clocks { PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT0 } ] -group [ get_clocks { ADC_DCLK } ]
