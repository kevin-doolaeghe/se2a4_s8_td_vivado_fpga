----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.02.2021 15:55:38
-- Design Name: 
-- Module Name: ex9_4 - Behavioral
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

entity fdce is
    Port ( raz : in STD_LOGIC;
           clk : in STD_LOGIC;
           d : in STD_LOGIC;
           ce : in STD_LOGIC;
           set : in STD_LOGIC;
           q : out STD_LOGIC);
end fdce;

architecture Behavioral of fdce is

begin

process(raz)
begin
    q<='0';
end process;

process(set)
begin
    if (set='1' and raz='0' and ce='1') then
        q<=d;
    end if;
end process;

process(clk)
begin
if (clk'event and clk='1' and raz='0' and ce='1') then
    q<=d;
end if;
end process;




end Behavioral;
