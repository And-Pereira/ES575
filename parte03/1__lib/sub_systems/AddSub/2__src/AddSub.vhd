-- Libraries
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.ALL;

LIBRARY ATOMIC_COMPONENTS;
USE ATOMIC_COMPONENTS.ATOMIC_COMPONENTS.ALL;

LIBRARY SUB_SYSTEMS;
USE SUB_SYSTEMS.SUB_SYSTEMS.ALL;


-- Entity
ENTITY ADDSUB IS
    GENERIC(
        N: INTEGER :=8
    );

    PORT(
        addSub_Control: IN STD_LOGIC;
        X1, X2: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
        CBIN: IN STD_LOGIC;
        RES: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
        CBOUT: OUT STD_LOGIC

    );

END ENTITY ADDSUB;


-- Architecture
ARCHITECTURE ARCH_ADDSUB OF ADDSUB IS
    SIGNAL RES_ADD, RES_SUB: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
    SIGNAL COUT, BOUT: STD_LOGIC;

    BEGIN
        --Instantiating components
        ADDER: FULL_ADDER
            GENERIC MAP(
                N
            ),
            PORT MAP(
                X1, X2,
                CBIN,
                RES_ADD,
                COUT
            );

        SUB: RIPPLE_BORROWER_SUBTRACTOR
            GENERIC MAP(
                N
            ),
            PORT MAP(
                X1, X2,
                CBIN,
                RES_SUB,
                BOUT
            )

        WITH addSub_Control:
            RES <=
                RES_ADD WHEN '0';
                RES_SUB WHEN '1';
        
        WITH addSub_Control
            CBOUT <= 
                COUT WHEN '0';
                BOUT WHEN '1';



END ARCHITECTURE ARCH_ADDSUB;