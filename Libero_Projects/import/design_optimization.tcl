# Build the design hierarchy and set the root of the project
build_design_hierarchy
set_root $sdName

# Not currently supported feature
# If LPR (Low-Powered RAM) memory client selected for TCM, modify .pkg files
#if {($hwFamily eq "POLARFIRE") && ($softCpu eq "MIV_RV32") && ($config eq "CFG3")} then {
#    set tcmRamCfg_fp $projectDir/component/Microsemi/MiV/MIV_RV32/3.1.100/pkg/miv_rv32_subsys_pkg.v
#	puts "Info: Configuring Low-powered RAM for TCM, modifying pkg file: $tcmRamCfg_fp"
#	update_param $tcmRamCfg_fp \
#		"  localparam logic        l_cfg_hard_tcm0_en              " \
#		"= 1'b1;"
#	build_design_hierarchy
#}

# Import constraint files for all base and design guide configurations
import_files -sdc $scriptDir/import/constraints/io_jtag_constraints.sdc
import_files -io_pdc $scriptDir/import/constraints/io/io_constraints.pdc

# Organize PDC and SDC constraints to Synthesis, Place and Route and Verify Timing tools

# CFG1, CFG2, CFG3 MIV_RV32: Base Configs 
organize_tool_files -tool {PLACEROUTE} \
	-file $projectDir/constraint/io/io_constraints.pdc \
	-file $projectDir/constraint/io_jtag_constraints.sdc \
	-module ${sdName}::work -input_type {constraint}

organize_tool_files -tool {SYNTHESIZE} \
	-file $projectDir/constraint/io_jtag_constraints.sdc \
	-module ${sdName}::work -input_type {constraint}

organize_tool_files -tool {VERIFYTIMING} \
	-file $projectDir/constraint/io_jtag_constraints.sdc \
	-module ${sdName}::work -input_type {constraint}

run_tool -name {CONSTRAINT_MANAGEMENT}
derive_constraints_sdc