-- Library importing
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

-- Entity declaration
ENTITY LATCH IS
    PORT(
        CLK, D: IN  std_logic_1164;
        Q: OUT std_logic_1164
    );


END ENTITY LATCH;


-- Architecture definition
ARCHITECTURE BEHAVIOR OF LATCH IS

BEGIN
    PROCESS ( D, CLK )
    BEGIN
        IF Clk = ’1’ THEN
            Q <= D ;
        END IF ;
    END PROCESS ;


END ARCHITECTURE BEHAVIOR;