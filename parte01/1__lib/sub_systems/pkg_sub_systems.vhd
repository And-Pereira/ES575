-- Library importing
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Package definition
PACKAGE SUB_SYSTEMS IS

  -- full adder A+B= SUM
  COMPONENT FULL_ADDER IS
  GENERIC(
    N : natural :=4
    
  );
  
  PORT (
    A, B: IN std_logic_vector(N-1 DOWNTO 0);
    CIN: IN std_logic;
    SUM : OUT std_logic_vector(N-1 DOWNTO 0);
    COUT: OUT std_logic
    
  );
  END COMPONENT FULL_ADDER; 

  COMPONENT FULL_SUBTRACTOR IS 
    PORT(
      X1, X2, BIN : IN std_logic;
      Y : OUT std_logic;
      BOUT : OUT std_logic
      
    );
  END COMPONENT FULL_SUBTRACTOR;

  COMPONENT RIPPLE_BORROWER_SUBTRACTOR IS
    
    GENERIC (
      N: INTEGER := 8
    );
    
    PORT(
        X1, X2: IN std_logic_vector(N-1 DOWNTO 0);
        BIN: IN std_logic;
        Y: OUT std_logic_vector(N-1 DOWNTO 0);
        BOUT: OUT std_logic
      );
      
  END COMPONENT RIPPLE_BORROWER_SUBTRACTOR;

END PACKAGE SUB_SYSTEMS;