----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.02.2021 14:17:07
-- Design Name: 
-- Module Name: ex9 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ex9 is
    Port ( r : in STD_LOGIC;
           s : in STD_LOGIC;
           q : inout STD_LOGIC);
end ex9;

architecture Behavioral of ex9 is

signal tmp: std_logic;

begin
tmp<= q nor s;
q<= r nor tmp;


end Behavioral;
