----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.02.2021 14:39:17
-- Design Name: 
-- Module Name: ex9_proc - Behavioral
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

entity ex9_proc is
    Port ( r : in STD_LOGIC;
           s : in STD_LOGIC;
           q : out STD_LOGIC);
end ex9_proc;

architecture Behavioral of ex9_proc is

begin

--process(r, s)
--begin
--if (s='0' and r='1') then
--    q<='0';
--elsif (s='1' and r='0') then
--     q<='1';
--end if;
--end process;

process(r, s)
begin
if (s='1') then
    q<=r;
end if;
end process;

end Behavioral;
