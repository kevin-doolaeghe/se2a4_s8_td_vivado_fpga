----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.02.2021 15:16:11
-- Design Name: 
-- Module Name: full_adder_tb - Behavioral
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

entity full_adder_tb is
--  Port ( );
end full_adder_tb;

architecture Behavioral of full_adder_tb is

component full_adder
    Port ( a : in STD_LOGIC;
       b : in STD_LOGIC;
       cin : in STD_LOGIC;
       carry : out STD_LOGIC;
       sum : out STD_LOGIC);
end component;

signal a, b, cin, carry, sum: std_logic;

begin

uut: full_adder port map (
    a => a,
    b => b,
    cin => cin,
    carry => carry,
    sum => sum
);

stim_proc: process
begin
    wait for 10 ns;
    a <= '1';
    b <= '0';
    cin <= '0';
    wait for 10 ns;
    a <= '0';
    b <= '0';
    cin <= '1';
    wait for 10 ns;
    a <= '1';
    b <= '1';
    cin <= '0';
    wait;
end process;

end Behavioral;
