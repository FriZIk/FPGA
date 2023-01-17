@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.3\\bin
call %xv_path%/xelab  -wto cf2190a6be0d4cb68bd28f0912284e73 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot testbench_behav xil_defaultlib.testbench -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
