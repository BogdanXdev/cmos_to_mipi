// Verilog netlist produced by program LSE 
// Netlist written on Sat Jun 19 13:59:34 2021
// Source file index table: 
// Object locations will have the form @<file_index>(<first_ line>[<left_column>],<last_line>[<right_column>])
// file 0 "c:/lscc/radiant/2.2/ip/common/adder/rtl/lscc_adder.v"
// file 1 "c:/lscc/radiant/2.2/ip/common/adder_subtractor/rtl/lscc_add_sub.v"
// file 2 "c:/lscc/radiant/2.2/ip/common/complex_mult/rtl/lscc_complex_mult.v"
// file 3 "c:/lscc/radiant/2.2/ip/common/counter/rtl/lscc_cntr.v"
// file 4 "c:/lscc/radiant/2.2/ip/common/distributed_dpram/rtl/lscc_distributed_dpram.v"
// file 5 "c:/lscc/radiant/2.2/ip/common/distributed_rom/rtl/lscc_distributed_rom.v"
// file 6 "c:/lscc/radiant/2.2/ip/common/distributed_spram/rtl/lscc_distributed_spram.v"
// file 7 "c:/lscc/radiant/2.2/ip/common/fifo/rtl/lscc_fifo.v"
// file 8 "c:/lscc/radiant/2.2/ip/common/fifo_dc/rtl/lscc_fifo_dc.v"
// file 9 "c:/lscc/radiant/2.2/ip/common/mult_accumulate/rtl/lscc_mult_accumulate.v"
// file 10 "c:/lscc/radiant/2.2/ip/common/mult_add_sub/rtl/lscc_mult_add_sub.v"
// file 11 "c:/lscc/radiant/2.2/ip/common/mult_add_sub_sum/rtl/lscc_mult_add_sub_sum.v"
// file 12 "c:/lscc/radiant/2.2/ip/common/multiplier/rtl/lscc_multiplier.v"
// file 13 "c:/lscc/radiant/2.2/ip/common/ram_dp/rtl/lscc_ram_dp.v"
// file 14 "c:/lscc/radiant/2.2/ip/common/ram_dp_true/rtl/lscc_ram_dp_true.v"
// file 15 "c:/lscc/radiant/2.2/ip/common/ram_dq/rtl/lscc_ram_dq.v"
// file 16 "c:/lscc/radiant/2.2/ip/common/ram_shift_reg/rtl/lscc_shift_register.v"
// file 17 "c:/lscc/radiant/2.2/ip/common/rom/rtl/lscc_rom.v"
// file 18 "c:/lscc/radiant/2.2/ip/common/subtractor/rtl/lscc_subtractor.v"
// file 19 "c:/lscc/radiant/2.2/ip/pmi/pmi_add.v"
// file 20 "c:/lscc/radiant/2.2/ip/pmi/pmi_addsub.v"
// file 21 "c:/lscc/radiant/2.2/ip/pmi/pmi_complex_mult.v"
// file 22 "c:/lscc/radiant/2.2/ip/pmi/pmi_counter.v"
// file 23 "c:/lscc/radiant/2.2/ip/pmi/pmi_distributed_dpram.v"
// file 24 "c:/lscc/radiant/2.2/ip/pmi/pmi_distributed_rom.v"
// file 25 "c:/lscc/radiant/2.2/ip/pmi/pmi_distributed_shift_reg.v"
// file 26 "c:/lscc/radiant/2.2/ip/pmi/pmi_distributed_spram.v"
// file 27 "c:/lscc/radiant/2.2/ip/pmi/pmi_fifo.v"
// file 28 "c:/lscc/radiant/2.2/ip/pmi/pmi_fifo_dc.v"
// file 29 "c:/lscc/radiant/2.2/ip/pmi/pmi_mac.v"
// file 30 "c:/lscc/radiant/2.2/ip/pmi/pmi_mult.v"
// file 31 "c:/lscc/radiant/2.2/ip/pmi/pmi_multaddsub.v"
// file 32 "c:/lscc/radiant/2.2/ip/pmi/pmi_multaddsubsum.v"
// file 33 "c:/lscc/radiant/2.2/ip/pmi/pmi_ram_dp.v"
// file 34 "c:/lscc/radiant/2.2/ip/pmi/pmi_ram_dp_be.v"
// file 35 "c:/lscc/radiant/2.2/ip/pmi/pmi_ram_dp_true.v"
// file 36 "c:/lscc/radiant/2.2/ip/pmi/pmi_ram_dq.v"
// file 37 "c:/lscc/radiant/2.2/ip/pmi/pmi_ram_dq_be.v"
// file 38 "c:/lscc/radiant/2.2/ip/pmi/pmi_rom.v"
// file 39 "c:/lscc/radiant/2.2/ip/pmi/pmi_sub.v"
// file 40 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/acc54.v"
// file 41 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/adc.v"
// file 42 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/alureg.v"
// file 43 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/bb_adc.v"
// file 44 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/bb_cdr.v"
// file 45 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/bb_i3c_a.v"
// file 46 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/bfd1p3kx.v"
// file 47 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/bfd1p3lx.v"
// file 48 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/bnkref18.v"
// file 49 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/config_ip.v"
// file 50 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/config_lmmi.v"
// file 51 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/ddrdll.v"
// file 52 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/diffio18.v"
// file 53 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/dlldel.v"
// file 54 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/dp16k.v"
// file 55 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/dphy.v"
// file 56 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/dpsc512k.v"
// file 57 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/dqsbuf.v"
// file 58 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/ebr.v"
// file 59 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/eclkdiv.v"
// file 60 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/eclksync.v"
// file 61 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/fbmux.v"
// file 62 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/fifo16k.v"
// file 63 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/i2cfifo.v"
// file 64 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/ifd1p3bx.v"
// file 65 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/ifd1p3dx.v"
// file 66 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/ifd1p3ix.v"
// file 67 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/ifd1p3jx.v"
// file 68 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/iologic.v"
// file 69 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/jtag.v"
// file 70 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/lram.v"
// file 71 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/m18x36.v"
// file 72 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/mipi.v"
// file 73 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/mult18.v"
// file 74 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/mult18x18.v"
// file 75 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/mult18x36.v"
// file 76 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/mult36.v"
// file 77 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/mult36x36.v"
// file 78 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/mult9.v"
// file 79 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/mult9x9.v"
// file 80 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/multaddsub18x18.v"
// file 81 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/multaddsub18x18wide.v"
// file 82 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/multaddsub18x36.v"
// file 83 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/multaddsub36x36.v"
// file 84 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/multaddsub9x9wide.v"
// file 85 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/multiboot.v"
// file 86 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/multpreadd18x18.v"
// file 87 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/multpreadd9x9.v"
// file 88 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/ofd1p3bx.v"
// file 89 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/ofd1p3dx.v"
// file 90 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/ofd1p3ix.v"
// file 91 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/ofd1p3jx.v"
// file 92 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/osc.v"
// file 93 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/osca.v"
// file 94 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/pcie.v"
// file 95 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/pdp16k.v"
// file 96 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/pdpsc16k.v"
// file 97 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/pdpsc512k.v"
// file 98 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/pll.v"
// file 99 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/pmu.v"
// file 100 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/preadd9.v"
// file 101 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/refmux.v"
// file 102 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/reg18.v"
// file 103 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/sedc.v"
// file 104 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/seio18.v"
// file 105 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/seio33.v"
// file 106 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/sgmiicdr.v"
// file 107 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/siologic.v"
// file 108 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/sp16k.v"
// file 109 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/sp512k.v"
// file 110 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/tsall.v"
// file 111 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/lifcl/wdt.v"
// file 112 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/uaplatform/dpr16x4.v"
// file 113 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/uaplatform/fd1p3bx.v"
// file 114 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/uaplatform/fd1p3dx.v"
// file 115 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/uaplatform/fd1p3ix.v"
// file 116 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/uaplatform/fd1p3jx.v"
// file 117 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/uaplatform/fl1p3az.v"
// file 118 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/uaplatform/gsr.v"
// file 119 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/uaplatform/ib.v"
// file 120 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/uaplatform/ob.v"
// file 121 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/uaplatform/obz.v"
// file 122 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/uaplatform/pclkdivsp.v"
// file 123 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/uaplatform/spr16x4.v"
// file 124 "c:/lscc/radiant/2.2/cae_library/simulation/verilog/uaplatform/widefn9.v"

//
// Verilog Description of module p2b
//

module p2b (rst_n_i, pix_clk_i, byte_clk_i, fv_i, lv_i, dvalid_i, 
            pix_data0_i, c2d_ready_i, txfr_en_i, fv_start_o, fv_end_o, 
            lv_start_o, lv_end_o, txfr_req_o, byte_en_o, byte_data_o);
    input rst_n_i;
    input pix_clk_i;
    input byte_clk_i;
    input fv_i;
    input lv_i;
    input dvalid_i;
    input [7:0]pix_data0_i;
    input c2d_ready_i;
    input txfr_en_i;
    output fv_start_o;
    output fv_end_o;
    output lv_start_o;
    output lv_end_o;
    output txfr_req_o;
    output byte_en_o;
    output [7:0]byte_data_o;
    
    
    
endmodule
