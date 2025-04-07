-- Library declaration
LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

-- Entity declaration
ENTITY FLIP_FLOP_D IS
  PORT (
    D, Clk : IN STD_LOGIC;
    Q : OUT STD_LOGIC
  );
END ENTITY FLIP_FLOP_D;


-- Architecture declaration
ARCHITECTURE BEHAVIOR OF FLIP_FLOP_D IS
BEGIN
PROCESS (D, Clk )
  BEGIN
    -- Falling edge
      IF falling_edge(Clk) THEN
        Q <= D;
      END IF;
    
END PROCESS;
END BEHAVIOR;