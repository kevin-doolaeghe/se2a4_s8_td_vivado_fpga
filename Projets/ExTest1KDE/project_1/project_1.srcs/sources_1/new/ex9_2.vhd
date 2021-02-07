----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.02.2021 14:28:05
-- Design Name: 
-- Module Name: ex9_2 - Behavioral
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

entity ex9_2 is
    Port ( d : in STD_LOGIC;
           e : in STD_LOGIC;
           q : inout STD_LOGIC);
end ex9_2;

architecture Behavioral of ex9_2 is

signal nor1:std_logic;
signal nor2:std_logic;
signal tmp:std_logic;

begin

nor1 <= (not d) and e;
nor2 <= e and d;
tmp <= q nor nor2;
q <= nor1 nor tmp;

end Behavioral;
