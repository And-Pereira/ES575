- Library importing
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

LIBRARY MY_LIB;
USE MY_LIB.ATOMIC_COMPONENTS.ALL;

ENTITY PROJECT_2 IS
	PORT(
		SW: IN std_logic_vector(3 DOWNTO 0);
		HEX1, HEX0: OUT std_logic_vector(6 DOWNTO 0)
	
	);
	
END ENTITY PROJECT_2;


ARCHITECTURE ARCH_PROJECT_2 OF PROJECT_2 IS
    SIGNAL Z: std_logic;
    SIGNAL Y_CA: Std_logic_vector(2 DOWNTO 0);
    SIGNAL Y_CB: Std_logic_vector(3 DOWNTO 0);
    SIGNAL Y_MUX: Std_logic_vector(3 DOWNTO 0);

BEGIN
	-- Porting all components
    COMP: COMPARATOR_NBIT
    PORT MAP (SW, Z);

    CA: CIRCUITA
    PORT MAP (SW(2 DOWNTO 0), Y_CA);

    Y_MUX(3) <= SW(3) WHEN Z = '0' ELSE '0';
    Y_MUX(2) <= SW(2) WHEN Z = '0' ELSE Y_CA(2);
    Y_MUX(1) <= SW(1) WHEN Z = '0' ELSE Y_CA(1);
    Y_MUX(0) <= SW(0) WHEN Z = '0' ELSE Y_CA(0);

    CB: CIRCUITB
    PORT MAP (Z, Y_CB);

		  
    HEX1_CONV_4_TO_7: CONV_4_TO_7
    PORT MAP (Y_CB, HEX1);
        
    HEX0_CONV_4_TO_7: CONV_4_TO_7
    PORT MAP (Y_CA, HEX0);



END ARCHITECTURE ARCH_PROJECT_2;

