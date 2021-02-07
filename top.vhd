----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.02.2021 11:54:29
-- Design Name: 
-- Module Name: top - arch
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

entity top is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : in STD_LOGIC;
           f : out STD_LOGIC);
end top;

architecture arch of top is

signal tmp: std_logic;

component and2 port (
i0,i1: in STD_LOGIC;
o: out STD_LOGIC);
end component;

component or2 port (
i0,i1: in STD_LOGIC;
o: out STD_LOGIC);
end component;

begin

retruhg : and2 port map(
    i0=>a,
    i1=>b,
    o=>tmp
);

retour2 : or2 port map(
    i0=>tmp,
    i1=>c,
    o=>f
);

--    f <= (a and b) or c;
    

end arch;
