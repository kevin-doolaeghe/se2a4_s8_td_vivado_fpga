@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto 249220f386d345548e99a89c69872d6f -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot test_behav xil_defaultlib.test -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
