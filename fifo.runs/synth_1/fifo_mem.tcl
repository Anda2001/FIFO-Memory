# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35ticpg236-1L

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {D:/Faculta/IIIsem1/SCS/Lab/Lab 5/fifo/fifo.cache/wt} [current_project]
set_property parent.project_path {D:/Faculta/IIIsem1/SCS/Lab/Lab 5/fifo/fifo.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo {d:/Faculta/IIIsem1/SCS/Lab/Lab 5/fifo/fifo.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  {D:/Faculta/IIIsem1/SCS/Lab/Lab 5/fifo/fifo.srcs/sources_1/new/hex2sseg.vhd}
  {D:/Faculta/IIIsem1/SCS/Lab/Lab 5/fifo/fifo.srcs/sources_1/new/filtr.vhd}
  {D:/Faculta/IIIsem1/SCS/Lab/Lab 5/fifo/fifo.srcs/sources_1/new/fifo_ctrl.vhd}
  {D:/Faculta/IIIsem1/SCS/Lab/Lab 5/fifo/fifo.srcs/sources_1/new/fifo8x8.vhd}
  {D:/Faculta/IIIsem1/SCS/Lab/Lab 5/fifo/fifo.srcs/sources_1/new/seven_seg.vhd}
  {D:/Faculta/IIIsem1/SCS/Lab/Lab 5/fifo/fifo.srcs/sources_1/new/fifo_mem.vhd}
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc {{D:/Faculta/IIIsem1/SCS/Lab/Lab 5/fifo/fifo.srcs/constrs_1/new/basys3.xdc}}
set_property used_in_implementation false [get_files {{D:/Faculta/IIIsem1/SCS/Lab/Lab 5/fifo/fifo.srcs/constrs_1/new/basys3.xdc}}]


synth_design -top fifo_mem -part xc7a35ticpg236-1L


write_checkpoint -force -noxdef fifo_mem.dcp

catch { report_utilization -file fifo_mem_utilization_synth.rpt -pb fifo_mem_utilization_synth.pb }