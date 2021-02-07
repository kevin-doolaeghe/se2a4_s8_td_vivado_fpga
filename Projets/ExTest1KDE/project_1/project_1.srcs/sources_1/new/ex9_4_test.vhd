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

entity test is
end test;

architecture Behavioral of test is

component fdce port (
raz : in STD_LOGIC;
clk : in STD_LOGIC;
d : in STD_LOGIC;
ce : in STD_LOGIC;
set : in STD_LOGIC;
q : out STD_LOGIC
);
end component;

signal i : std_logic;
signal o : std_logic;
signal clk : std_logic;

constant clk_period: time:= 1ns;

begin

uut: fdce port map (
    input => i,
    clock => clk,
    output => o
);

clk_process: process
begin
clk<= '0';
wait for clk_period/2;
clk<= '1';
wait for clk_period/2;
end process;

stim_proc: process
begin
wait for 10 ns;
i<='1';
wait for 11 ns;
i<='0';
wait for 3 ns;
i<='1';
wait for 8 ns;
i<='0';
wait for 5 ns;
i<='1';
wait for 12 ns;
i<='0';
wait;
end process;

end Behavioral;
