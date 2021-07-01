if {[catch {

# define run engine funtion
source [file join {C:/lscc/radiant/2.2} scripts tcl flow run_engine.tcl]
# define global variables
global para
set para(gui_mode) 1
set para(prj_dir) "C:/code/fw_fpga_sensor_if/CMOS_to_MIPI"
# synthesize IPs
# synthesize VMs
# propgate constraints
file delete -force -- CMOS_to_MIPI_impl_1_cpe.ldc
run_engine_newmsg cpe -f "CMOS_to_MIPI_impl_1.cprj" "tx_dphy_csi2.cprj" "p2b.cprj" -a "LIFCL" -o CMOS_to_MIPI_impl_1_cpe.ldc
# synthesize top design
file delete -force -- CMOS_to_MIPI_impl_1.vm CMOS_to_MIPI_impl_1.ldc
run_engine_newmsg synthesis -f "CMOS_to_MIPI_impl_1_lattice.synproj"
run_postsyn [list -a LIFCL -p LIFCL-40 -t CABGA400 -sp 7_High-Performance_1.0V -oc Industrial -top -w -o CMOS_to_MIPI_impl_1_syn.udb CMOS_to_MIPI_impl_1.vm] "C:/code/fw_fpga_sensor_if/CMOS_to_MIPI/impl_1/CMOS_to_MIPI_impl_1.ldc"

} out]} {
   runtime_log $out
   exit 1
}
