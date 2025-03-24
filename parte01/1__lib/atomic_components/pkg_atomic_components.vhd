-- Library importing
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Package definition
PACKAGE ATOMIC_COMPONENTS IS

    -- Component Full 1 bit adder
    COMPONENT CONV_4_TO_7 IS
        PORT(
            X: IN std_logic_vector (3 DOWNTO 0);
            Y: OUT std_logic_vector (6 DOWNTO 0)
        );
    END COMPONENT CONV_4_TO_7;

END PACKAGE ATOMIC_COMPONENTS;