-- Library declaration
LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

-- Entity declaration
ENTITY FLIP_FLOP_T IS
  PORT (CLK, T, ENABLE, RESET : IN STD_LOGIC;
        Q: OUT STD_LOGIC;
        Qnot : OUT STD_LOGIC);
END ENTITY FLIP_FLOP_T;


-- Architecture declaration
ARCHITECTURE BEHAVIOR OF FLIP_FLOP_T IS

SIGNAL OP: STD_LOGIC := '0';

BEGIN

PROCESS (CLK, RESET)
  BEGIN
    -- Rising edge
      IF ENABLE = '0' THEN
        OP <= '0';

      ELSIF (ENABLE ='1' AND RESET = '1') THEN
        OP <= '0';

      ELSIF (rising_edge(CLK) AND ENABLE = '1') THEN
        IF (T = '1') THEN 
          OP <= NOT(OP);

        ELSE 
          OP <= OP;

        END IF;
      END IF;
    
END PROCESS;
  Q <= OP;
  Qnot <= NOT (OP);
END BEHAVIOR;