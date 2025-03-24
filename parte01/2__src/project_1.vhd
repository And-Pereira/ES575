-- Library importing
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

LIBRARY MY_LIB;
USE MY_LIB.ATOMIC_COMPONENTS.ALL;

ENTITY PROJECT_1 IS
	PORT(
		SW: IN std_logic_vector(15 DOWNTO 0);
		HEX3, HEX2, HEX1, HEX0: OUT std_logic_vector(6 DOWNTO 0)
	
	);
	
END ENTITY PROJECT_1;


ARCHITECTURE ARCH_PROJECT_1 OF PROJECT_1 IS

BEGIN
		-- Porting all components
      HEX3_CONV_4_TO_7: CONV_4_TO_7
        PORT MAP (SW(15 DOWNTO 12), HEX3);
		  
      HEX2_CONV_4_TO_7: CONV_4_TO_7
        PORT MAP (SW(11 DOWNTO 8), HEX2);
		  
      HEX1_CONV_4_TO_7: CONV_4_TO_7
        PORT MAP (SW(7 DOWNTO 4), HEX1);
		  
      HEX0_CONV_4_TO_7: CONV_4_TO_7
        PORT MAP (SW(3 DOWNTO 0), HEX0);



END ARCHITECTURE ARCH_PROJECT_1;

