-- Library importing
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

-- Entity declaration
ENTITY CIRCUITA IS

    --Define I/O
    PORT(
        X: IN std_logic_vector(2 DOWNTO 0);
        Y: OUT std_logic_vector(2 DOWNTO 0)

    );

END ENTITY CIRCUITA;


-- Architecture declaration
ARCHITECTURE ARCH_CIRCUITA OF CIRCUITA IS


BEGIN
    -- Base case
    Y(2) <= X(2) AND X(1);
    Y(1) <= X(2) AND NOT(X(1));
    Y(0) <= X(0);
            
END ARCHITECTURE ARCH_CIRCUITA;



