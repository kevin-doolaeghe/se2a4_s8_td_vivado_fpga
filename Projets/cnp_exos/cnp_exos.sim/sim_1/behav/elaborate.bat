@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto 9cd464dc34044241ac383c3cef1b3d2d -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot full_adder_tb_behav xil_defaultlib.full_adder_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
