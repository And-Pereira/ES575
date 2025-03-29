-- Library importing
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Package definition
PACKAGE ATOMIC_COMPONENTS IS

    -- Component Circuit A
    COMPONENT CIRCUITA IS
        PORT(
            X: IN std_logic_vector(2 DOWNTO 0);
            Y: OUT std_logic_vector(2 DOWNTO 0)

        );
    END COMPONENT CIRCUITA;


    -- Component Circuit B
    COMPONENT CIRCUITB IS
        PORT(
            X: IN std_logic;
            Y: OUT std_logic_vector( 3 DOWNTO 0)

        );
    END COMPONENT CIRCUITB;


    -- Component Full 1 bit adder
    COMPONENT COMPARATOR_NBIT IS
        -- Define generic parameters
        GENERIC (
            N: INTEGER :=4 -- 4 AS DEFAULT VALUE
        );

        --Define I/O
        PORT(
            A, B: IN std_logic_vector(N-1 DOWNTO 0);
            RES: OUT std_logic

        );
    END COMPONENT COMPARATOR_NBIT;


    -- Entity Definition
    COMPONENT CONV_4_TO_7 IS
        PORT(
            X: IN std_logic_vector(3 DOWNTO 0);
            Y: OUT std_logic_vector (6 DOWNTO 0)
        );
            
    END COMPONENT CONV_4_TO_7;

END PACKAGE ATOMIC_COMPONENTS;