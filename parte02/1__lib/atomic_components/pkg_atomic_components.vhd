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

    -- Entity Definition
    COMPONENT CONV_4_TO_7_HEX IS
        PORT(
            X: IN std_logic_vector(3 DOWNTO 0);
            Y: OUT std_logic_vector (6 DOWNTO 0)
        );
            
    END COMPONENT CONV_4_TO_7_HEX;

    -- Entity Definition
    COMPONENT FLIP_FLOP_T IS
        PORT (CLK, T, ENABLE, RESET : IN STD_LOGIC;
                Q: OUT STD_LOGIC;
                Qnot : OUT STD_LOGIC);
    END COMPONENT FLIP_FLOP_T;

    COMPONENT FLIP_FLOP_D IS
        GENERIC(
            N: NATURAL:=4
        );
    	PORT (
		    Clk : IN STD_LOGIC;
            RST: IN STD_LOGIC;
            EN: IN STD_LOGIC;
        	D: IN STD_LOGIC_VECTOR(N DOWNTO 0); 
        	Q : OUT STD_LOGIC_VECTOR(N DOWNTO 0)
    	);
    END COMPONENT FLIP_FLOP_D;

    COMPONENT CONTADOR_NBIT IS
        GENERIC(
            N : natural :=4;
            valMax : natural := 10
        );
        PORT (
            Clk, reset_n, enable : IN STD_LOGIC;
            rollover : OUT STD_LOGIC;
            Q : OUT std_logic_vector(N-1 DOWNTO 0)
        );
        END COMPONENT CONTADOR_NBIT;

    COMPONENT TEMPORIZADOR_NBIT IS
        GENERIC(
            N : natural :=4;
            valMax : natural := 10
        );
        PORT (
            Clk, reset_n, enable : IN STD_LOGIC;
            itsover : OUT STD_LOGIC
        );
        END COMPONENT TEMPORIZADOR_NBIT;

    COMPONENT RAM_32x8 IS
        PORT(
            ADD: IN STD_LOGIC_VECTOR (3 DOWNTO 0); -- Memory Address
            DATA_IN: IN STD_LOGIC_VECTOR (7 DOWNTO 0); -- Input Data
            WR: IN STD_LOGIC; -- Control signal
            CLK: IN STD_LOGIC; -- Clock signal
            DATA_OUT: OUT STD_LOGIC_VECTOR (7 DOWNTO 0) -- Output Data
        );
    END COMPONENT RAM_32x8;

    COMPONENT RAM_128x16 IS
        PORT(
            ADD: IN STD_LOGIC_VECTOR (6 DOWNTO 0); -- Memory Address
            DATA_IN: IN STD_LOGIC_VECTOR (15 DOWNTO 0); -- Input Data
            WR: IN STD_LOGIC; -- Control signal
            CLK: IN STD_LOGIC; -- Clock signal
            DATA_OUT: OUT STD_LOGIC_VECTOR (15 DOWNTO 0) -- Output Data
        );
    END COMPONENT RAM_128x16;

    COMPONENT BIN2BCD IS 
        PORT(
            A: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            BCD: OUT STD_LOGIC_VECTOR (11 DOWNTO 0)
        
    );

    END COMPONENT BIN2BCD;

    COMPONENT DECODERN2 IS
        GENERIC(
            N: INTEGER := 4 

        );
        PORT(
            X: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
            Y: OUT STD_LOGIC_VECTOR(2**(N)-1 DOWNTO 0)

        );

    END COMPONENT DECODERN2;
    
END PACKAGE ATOMIC_COMPONENTS;