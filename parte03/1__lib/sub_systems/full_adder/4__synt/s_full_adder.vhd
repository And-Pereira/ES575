-- Library declaration
LIBRARY ieee ;
USE ieee.std_logic_1164.all;

-- Entity declaration
ENTITY S_FULL_ADDER IS  
  PORT (
    SW: IN std_logic_vector(8 DOWNTO 0); -- A(7-4), B(3-0) CIN(8)
    LEDR: OUT std_logic_vector(7 DOWNTO 0);
    LEDG : OUT std_logic_vector(4 DOWNTO 0) -- S(3-0), COUT(4)
    
  );
END ENTITY S_FULL_ADDER;


-- Architecture declaration
ARCHITECTURE ARCH_S_FULL_ADDER OF S_FULL_ADDER IS
  --DEFINE INTERMEDIATE SIGNALS
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

  BEGIN
    COMP_FULL_ADDER_4: FULL_ADDER
      GENERIC MAP (4)
      PORT MAP(
        SW(7 DOWNTO 4), SW(3 DOWNTO 0), SW(8),
        LEDG(3 DOWNTO 0), LEDG(4)
      );
      
   LEDR <= SW(7 DOWNTO 0);  
    
END ARCH_S_FULL_ADDER;
