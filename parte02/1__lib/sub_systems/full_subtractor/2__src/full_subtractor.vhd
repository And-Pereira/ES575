-- Library declaration
LIBRARY ieee ;
USE ieee.std_logic_1164.all;

-- Entity declaration
ENTITY FULL_SUBTRACTOR IS 
	PORT(
		X1, X2, BIN : IN std_logic;
		Y : OUT std_logic;
		BOUT : OUT std_logic
    
  );
END ENTITY FULL_SUBTRACTOR;


-- Architecture declaration
ARCHITECTURE ARCH_FULL_SUBTRACTOR OF FULL_SUBTRACTOR IS
  --DEFINE INTERMEDIATE SIGNALS
	SIGNAL X, ALGO1, ALGO2: std_logic; 

 	BEGIN
		X <= X1 XOR X2;
		Y <= X XOR BIN;
		ALGO1 <= (NOT X1) AND X2;
		ALGO2 <= (NOT X) AND BIN;
		BOUT <= ALGO1 OR ALGO2;

END ARCH_FULL_SUBTRACTOR;