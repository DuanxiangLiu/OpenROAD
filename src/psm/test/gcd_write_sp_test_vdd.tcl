source helpers.tcl

read_lef Nangate45/Nangate45.lef
read_def Nangate45_data/gcd.def
read_liberty Nangate45/Nangate45_typ.lib
read_sdc Nangate45_data/gcd.sdc

# The command below runs a check for connectivity of the power grid
# The analyze_power_grid command calls it by default
# check_power_grid -vsrc Vsrc_gcd.loc
set spice_file [make_result_file gcd_spice_vdd.sp]

write_pg_spice -vsrc Vsrc_gcd_vdd.loc -outfile $spice_file -net VDD
diff_files $spice_file gcd_spice_vdd.spok
