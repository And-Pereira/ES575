-- Library declaration
LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

-- Entity declaration
ENTITY LATCH_D IS
  PORT (
    D, Clk : IN STD_LOGIC ;
    Q : OUT STD_LOGIC
  );
END ENTITY LATCH_D;


-- Architecture declaration
ARCHITECTURE BEHAVIOR OF LATCH_D IS
BEGIN
PROCESS ( D, Clk )
BEGIN
  IF Clk = '1' THEN
    Q <= D;
  END IF;
END PROCESS;
END BEHAVIOR;