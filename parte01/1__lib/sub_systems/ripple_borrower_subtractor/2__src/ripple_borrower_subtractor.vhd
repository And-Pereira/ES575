-- Library importing
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

LIBRARY SUB_SYSTEMS;
USE SUB_SYSTEMS.SUB_SYSTEMS.ALL;

ENTITY RIPPLE_BORROWER_SUBTRACTOR IS
  
  GENERIC (
    N: INTEGER := 8
  );
  
  PORT(
    	X1, X2: IN std_logic_vector(N-1 DOWNTO 0);
	BIN: IN std_logic;
    	Y: OUT std_logic_vector(N-1 DOWNTO 0);
    	BOUT: OUT std_logic
    );
    
END ENTITY RIPPLE_BORROWER_SUBTRACTOR;

ARCHITECTURE ARCH_RIPPLE_BORROWER_SUBTRACTOR OF RIPPLE_BORROWER_SUBTRACTOR IS

  SIGNAL S_BIN, S_BOUT: std_logic_vector (N-1 DOWNTO 0); 
  SIGNAL S_B: std_logic_vector (N-2 DOWNTO 0);
  
  BEGIN
	S_BIN (0) <= BIN;
      	C1_FULL_SUBTRACTOR: FULL_SUBTRACTOR
			PORT MAP ( 
		  		X1(0),                     
        			X2(0),                    
        			BIN,              
        			Y(0),                
        			S_B(0)

		 ); 
	S_BOUT(0)<= S_B(0);
    
    GEN_FULL_SUBTRACTOR: FOR i in 1 TO N-2 GENERATE
	S_BIN (i) <= S_BOUT(i-1);
      	C_FULL_SUBTRACTOR: FULL_SUBTRACTOR
			PORT MAP ( 
		  		X1(i),                     
        			X2(i),                    
        			S_BIN(i),              
        			Y(i),                
        			S_B(i)

		 ); 
	S_BOUT(i)<= S_B(i);
    END GENERATE; 
	
	S_BIN(N-1) <= S_BOUT(N-2);
      	C2_FULL_SUBTRACTOR: FULL_SUBTRACTOR
			PORT MAP ( 
		  		X1(N-1),                     
        			X2(N-1),                    
        			S_BIN(N-1),              
        			Y(N-1),                
        			S_BOUT(N-1)

		 );

	BOUT <= S_BOUT(N-1);

END ARCHITECTURE ARCH_RIPPLE_BORROWER_SUBTRACTOR;