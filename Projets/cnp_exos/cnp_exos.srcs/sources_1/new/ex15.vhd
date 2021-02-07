----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.02.2021 15:38:39
-- Design Name: 
-- Module Name: ex15 - Behavioral
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

entity ex15 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Clock : in STD_LOGIC;
           S : out STD_LOGIC);
end ex15;

architecture Behavioral of ex15 is

type typetat is (etat0, etat1, etat2);
signal etat : typetat;

begin

process(Clock)
begin

    if (Clock = '1' and Clock'event) then
        case etat is
            when etat0 =>
                if A = '1' then  etat <= etat1;
                else etat <= etat0;
                end if;
            when etat1 =>
                if A = '0' then  etat <= etat2;
                else etat <= etat1;
                end if;
            when etat2 =>
                if A = '1' and B = '1' then etat <= etat1;
                elsif A = '0' and B = '1' then etat <= etat0;
                else etat <= etat2;
                end if;
        end case;
    end if;

end process;

S <= '1' when etat = etat2 else '0';

end Behavioral;
