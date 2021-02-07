---------------------------------------------------------------------
--GENERAL: structure d'une entité VHDL:
-- 1e partie: déclaration de l'entité (entrées/sorties vues de l'extérieur de l'entité)
entity f_async is
    Port ( iClock : in  STD_LOGIC;
           iD : in  STD_LOGIC;
		   iRaz: in  STD_LOGIC;
           oQ : out  STD_LOGIC);
end f_async;

-- 2e partie: architecture de l'entité (descritpion de ses fonctionnalités)
architecture Behavioral of f_async is
-- partie délcarative: y déclarer tous les signaux internes à l'entité, ainsi que
-- les composants que vous allez utiliser dans cette entité
begin

	--exemple de syntaxe d'un process fonction bascule avecc reset asynchrone
    process (iClock, iRaz) --le process doit se lancer sur les 2 signaux de cette liste de sensibilité
	begin
	    if (iRaz = '0') then 
			oQ <= '0';
		else if (iClock = '1' and iClock'event)
			oQ <= iD;
		end if;
	end process;

end Behavioral;
--FIN GENERAL: structure d'une entité VHDL:
---------------------------------------------------------------------



---------------------------------------------------------------------
--EXEMPLES DE SYNTAXES D'ASSIGNEMENT DIRECTE
-- donc utlisable dans l'architecture (entre le begin et le end), mais hors des process

--vu dans exo3
signal_x <=			value_expr_1	when boolean_expr_1 
			else 	value_expr_2 	when boolean_expr_2
			else 	valeur_z;
			
--vu dans exo4
With	sel select
	signal <= 	value_expr_1 when val1,
				value_expr_2 when val2,
				… 
				value_expr_n when others;
				
--vu dans exo14				
LABEL: for I in int_a to int_b generate
	-- mettre ici toutes les instructions à réaliser
	-- (rappel: instructions "concurrentes", exécutées simultanéement)
end generate;
--FIN EXEMPLES DE SYNTAXES D'ASSIGNEMENT DIRECTE
---------------------------------------------------------------------



---------------------------------------------------------------------
--EXEMPLES DE SYNTAXES DANS UN PROCESS
-- donc qui ne fonctionne pas hors des process
	if boolean_expr_1 then

		-- sequential statements
	elsif boolean_expr_2 then
		-- sequential statements
	else
		-- sequential statements
	end if;


	case sel is
		when choice_1 =>
			-- sequential statements
		when choice_2 =>
			-- sequential statements
		…
		when others =>
			-- sequential statements

			
			
	for i in 0 to 7 loop
		-- sequential statements
	end loop ;
--FIN EXEMPLES DE SYNTAXES DANS UN PROCESS
---------------------------------------------------------------------



---------------------------------------------------------------------
-- STRUCTURE D'UN TESTBENCH "top_tb" PERMTTANT DE SIMULER LE COMPOSANT "top"

--package définissant les types std_logic, std_logic_vector,...
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- 1e partie: déclaration de l'entité (entrées/sorties vues de l'extérieur de l'entité)
-- dans le cas d'un testbench, il n'y a pas d'entrées/sorties extérieures => rien à déclarer
ENTITY top_tb IS
END top_tb;

-- 2e partie: architecture de l'entité (descritpion de ses fonctionnalités)
ARCHITECTURE behavior OF top_tb IS 

	-- avant le begin de l'architecture, déclarer tout ce que nous allons utiliser ici: composant à tester, signaux internes, et constantes
 
    -- Déclaration du composant à tester, qui sera à cabler plus loin 
    component top port 
        (
        iD : in  STD_LOGIC_VECTOR (9 downto 0);
        iLoad : in  STD_LOGIC;
        iUp_down : in  STD_LOGIC;
        iClock : in  STD_LOGIC;
        iRst : in  STD_LOGIC;
        oCnt : out  STD_LOGIC_vector (9 downto 0)
        );
    end component;
        
    --déclaration des signaux internes au testbench, qui seront connectées aux entrées du composant à tester
    signal iLoad , iUp_down, iClock, iRst :  STD_LOGIC := '0';
    signal iD : STD_LOGIC_VECTOR (9 downto 0) := (others => '0') ;
    
    --déclaration des signaux internes au testbench, qui seront connectées aux sorties du composant à tester
    signal oCnt : STD_LOGIC_VECTOR (9 downto 0) ;
	
	--déclaration des constantes 
	constant period : time := 10ns; 


-- maitenant que tout est déclaré, il faut décrire ce que fait le testbench 
-- (entre le begin et le end de l'architecture)
BEGIN

	-- création d'une instance du composant à tester, et cablage de ce composant aux signaux internes de  notre testbench
    uut : top port map 
    (
        iD => iD,
        iLoad  => iLoad,
        iUp_down  => iUp_down,
        iClock  => iClock,
        iRst  => iRst,
        oCnt  => oCnt
    );
       


    -- Clock process definitions( clock with 50% duty cycle is generated here).
    clk_process: process
    begin
       iClock_fasynch <= '0';
       wait for period/2;  
       iClock_fasynch <= '1';
       wait for period/2;  
    end process;

	
	  -- Stimulus process
  stim_proc: process
  begin          
	
		-- ajouter ici toutes les combinaisaons d'entrée que vous souhaitez tester,
		-- par exemple:
      
       --test compteur ascendant
		iD <= "0000001000";  
		iLoad <= '0';
		iUp_down <= '1';
		iRst <= '0'; 
		wait for period*5;
         
        --test load: maintenu pdt 3 périodes puis incrémente pendant 3 périodes
		iD <= "0000010000";  
		iLoad <= '1';
		iUp_down <= '1';
		iRst <= '0'; 
		wait for period*3;

		iD <= "0000010000";  
		iLoad <= '0';
		iUp_down <= '1';
		iRst <= '0'; 
		wait for period*3;  
		

     wait; -- pour éviter que le process ne tourne en boucle, infiniement.
  end process;
  
 END;
 
 
-- FIN STRUCTURE D'UN TESTBENCH "top_tb" PERMTTANT DE SIMULER LE COMPOSANT "top"
---------------------------------------------------------------------