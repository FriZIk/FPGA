#!/bin/bash -f
xv_path="/home/frizik/MOPEVM/fpga/Xilinx/Vivado/2016.3"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xsim test_bench_behav -key {Behavioral:sim_1:Functional:test_bench} -tclbatch test_bench.tcl -log simulate.log
