-- Library declaration
LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

-- Entity declaration
ENTITY FLIP_FLOP_D_RISING IS
  PORT (
    D, Clk : IN STD_LOGIC;
    Q : OUT STD_LOGIC
  );
END ENTITY FLIP_FLOP_D_RISING;


-- Architecture declaration
ARCHITECTURE BEHAVIOR OF FLIP_FLOP_D_RISING IS
BEGIN
PROCESS (D, Clk )
  BEGIN
    -- Rising edge
      IF rising_edge(Clk) THEN
        Q <= D;
      END IF;
    
END PROCESS;
END BEHAVIOR;