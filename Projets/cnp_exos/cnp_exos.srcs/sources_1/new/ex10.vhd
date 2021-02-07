----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.02.2021 11:47:40
-- Design Name: 
-- Module Name: ex - Behavioral
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
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cpt is
    port(
        iClock, iRst, iLoad, iUp_down: in std_logic;
        iD : in std_logic_vector(9 downto 0);
        oCnt : out std_logic_vector(9 downto 0)
    );
end cpt;

architecture Behavioral of cpt is

signal q_tmp : std_logic_vector(9 downto 0) := "0000000000";

begin

process(iRst)
begin

end process;

process(iClock, iRst)
begin
    if (iRst = '1') then
        q_tmp <= "0000000000";
    else
        if (iClock = '1' and iClock'event) then
            if (iLoad = '1') then
                q_tmp <= iD;
            elsif (iLoad = '0') then
                if (iUp_down = '1') then
                    q_tmp <= q_tmp + 1;
                elsif (iUp_down = '0') then
                    q_tmp <= q_tmp - 1;
                end if;
            end if;
        end if;
    end if;
end process;

oCnt <= q_tmp;

end Behavioral;
