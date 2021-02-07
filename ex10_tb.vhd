----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.02.2021 14:28:13
-- Design Name: 
-- Module Name: ex10_tb - Behavioral
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

entity cpt_tb is
--  Port ( );
end cpt_tb;

architecture Behavioral of cpt_tb is

component cpt
    port (
        iClock, iRst, iLoad, iUp_down: in std_logic;
        iD : in std_logic_vector(9 downto 0);
        oCnt : out std_logic_vector(9 downto 0)
    );
end component;

signal iClock, iRst, iLoad, iUp_down: std_logic;
signal iD, oCnt: std_logic_vector(9 downto 0);

constant period: time := 1ns;

begin

uut: cpt port map (
    iClock => iClock,
    iRst => iRst,
    iLoad => iLoad,
    iUp_down => iUp_down,
    iD => iD,
    oCnt => oCnt
);

clk_process: process
begin
    iClock <= '0';
    wait for period/2;
    iClock <= '1';
    wait for period/2;
end process;

stim_proc: process
begin
    wait for 10 ns;
    iRst <= '0';
    iLoad <= '0';
    iUp_down <= '0';
    iD <= "0000001000";
    wait for 10 ns;
    iRst <= '1';
    wait for 1 ns;
    iRst <= '0';
    wait for 9 ns;
    iLoad <= '1';
    wait for 1 ns;
    iLoad <= '0';
    wait for 9 ns;
    iUp_down <= '0';
    wait for 10 ns;
    iUp_down <= '1';
    wait;
end process;

end Behavioral;
