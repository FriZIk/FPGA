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
ExecStep $xv_path/bin/xelab -wto 4f78d8a690984960858f9b9edc369193 -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot test_bench_behav xil_defaultlib.test_bench -log elaborate.log
