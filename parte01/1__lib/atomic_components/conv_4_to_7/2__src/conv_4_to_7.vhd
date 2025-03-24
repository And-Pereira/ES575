-- Library definition
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

-- Entity Definition
ENTITY CONV_4_TO_7 IS
	PORT(
		X: IN std_logic_vector(3 DOWNTO 0);
		Y: OUT std_logic_vector (6 DOWNTO 0)
	);
		
END ENTITY CONV_4_TO_7;

-- Architecture definition
ARCHITECTURE ARCH_CONV_4_TO_7 OF CONV_4_TO_7 IS
	
	
	BEGIN
		Y(6) <= (X(1) AND X(3)) OR (X(2) AND X(3)) OR (NOT(X(1)) AND NOT(X(2)) AND NOT(X(3)));
		Y(5) <= (X(1) AND NOT(X(2))) OR (X(2) AND X(3)) OR (X(0) AND NOT(X(2)) AND NOT(X(3)));
		Y(4) <= (X(1) AND X(3)) OR (NOT(X(1)) AND X(2)) OR (X(0) AND NOT(X(2)));
		Y(3) <= (X(1) AND X(3)) OR (X(2) AND X(3)) OR (NOT(X(0)) AND NOT(X(1)) AND X(2)) OR (X(0) AND NOT(X(1)) AND NOT(X(2)) AND NOT(X(3)));
		Y(2) <= (X(1) AND X(3)) OR (X(2) AND X(3)) OR (X(0) AND X(1) AND X(2)) OR (NOT(X(0)) AND X(1) AND NOT(X(2))) ;
		Y(1) <= (X(1) AND X(3)) OR (X(1) AND X(2)) OR (X(0) AND X(2)) OR (X(2) AND X(3));
		Y(0) <= (X(1) AND X(3)) OR (X(2) AND X(3)) OR (X(0) AND X(1) AND X(2)) OR (NOT(X(0)) AND NOT(X(1)) AND X(2)) OR (X(0) AND NOT(X(1)) AND NOT(X(2)) AND NOT(X(3)));
	
	
	

END ARCHITECTURE ARCH_CONV_4_TO_7;
