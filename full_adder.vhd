----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.02.2021 15:07:01
-- Design Name: 
-- Module Name: full_adder - Behavioral
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

entity full_adder is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           cin : in STD_LOGIC;
           carry : out STD_LOGIC;
           sum : out STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is

component ha1
    Port ( a : in STD_LOGIC;
       b : in STD_LOGIC;
       s : out STD_LOGIC;
       c : out STD_LOGIC);
end component;

component ha2
    Port ( a : in STD_LOGIC;
       b : in STD_LOGIC;
       s : out STD_LOGIC;
       c : out STD_LOGIC);
end component;

signal s1: std_logic;
signal c1: std_logic;
signal c2: std_logic;

begin

ha1_tmp: ha1 port map (
    a => a,
    b => b,
    s => s1,
    c => c1
);

ha2_tmp: ha2 port map (
    a => s1,
    b => cin,
    s => sum,
    c => c2
);

carry <= c1 or c2;

end Behavioral;
