-- Libraries
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.ALL;

LIBRARY ATOMIC_COMPONENTS;
USE ATOMIC_COMPONENTS.ATOMIC_COMPONENTS.ALL;

LIBRARY SUB_SYSTEMS;
USE SUB_SYSTEMS.SUB_SYSTEMS.ALL;

ENTITY CPU_X IS
    PORT(
        INSTRUCTION: IN STD_LOGIC_VECTOR(8 DOWNTO 0);
        RST, RUN, CLK: IN STD_LOGIC;
        EN_CONTROL: OUT STD_LOGIC_VECTOR(11 DOWNTO 0); --R0..R7, A, G, IR, addSub
        MUX_CONTROL: OUT STD_LOGIC_VECTOR(9 DOWNTO 0); -- R0 .. R7, G, DIN
        DONE: OUT STD_LOGIC

    );
END ENTITY CPU_X;

ARCHITECTURE ARCH_CPU OF CPU_X IS
    SIGNAL REG_MUX: STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL REG_EN: STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL RA, RB: STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL INST: STD_LOGIC_VECTOR(2 DOWNTO 0);

    SIGNAL RA_DECODE, RB_DECODE: STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL RA_DECODE_INV, RB_DECODE_INV: STD_LOGIC_VECTOR(7 DOWNTO 0);


    TYPE STATE_TYPES IS (WAIT_RUN, MV, MVI, ADD1, ADD2, ADD3, SUB1, SUB2, SUB3);
    SIGNAL Y_Q, Y_D: STATE_TYPES; -- Y_Q: FUTURE, Y_D: CURRENT

-- ISA: 
BEGIN
    
    -- Breaking the IR into its parts
    RA <= INSTRUCTION(5 DOWNTO 3);
    RB <= INSTRUCTION(2 DOWNTO 0);
    INST <= INSTRUCTION (8 DOWNTO 6);

    -- Table of state's transitions
    PROCESS (RUN, Y_D)
    BEGIN
        CASE Y_D IS
            --Case 1 - Waiting
            WHEN WAIT_RUN =>
                IF RUN = '1' THEN 
			IF INST = "000" THEN
				Y_Q <= MV;
			ELSIF INST = "001" THEN
				Y_Q <= MVI;
			ELSIF INST = "010" THEN
				Y_Q <= ADD1;
			ELSIF INST = "011" THEN
				Y_Q <= SUB1;
			ELSE Y_Q <= WAIT_RUN;
			END IF;

                ELSE Y_Q <= WAIT_RUN;
                END IF;
            
            -- Case 2 - MV
            WHEN MV =>
                Y_Q <= WAIT_RUN;

            -- Case 3 - MVI
            WHEN MVI =>
                Y_Q <= WAIT_RUN;

            -- Case 4 - ADD
            WHEN ADD1 =>
                Y_Q <= ADD2;

            -- Case 5 - ADD
            WHEN ADD2 =>
                Y_Q <= ADD3;

            -- Case 6 - ADD
            WHEN ADD3 =>
                Y_Q <= WAIT_RUN;

            -- Case 7 - SUB
            WHEN SUB1 =>
                Y_Q <= SUB2;

            -- Case 8 - SUB
            WHEN SUB2 =>
                Y_Q <= SUB3;

            -- Case 9 - SUB
            WHEN SUB3 =>
                Y_Q <= WAIT_RUN;
                         
        END CASE;
    END PROCESS;

    -- How FFs work
    PROCESS (CLK, RST)
    BEGIN
        IF (RST = '1') THEN
            Y_D <= WAIT_RUN;

        ELSIF (rising_edge(CLK)) THEN
            Y_D <= Y_Q; --Current state receives next one

        END IF;
    END PROCESS;

    --Input definition
    REG_A_DEC: DECODERN2
        GENERIC MAP (3)
        PORT MAP(
            RA,
            RA_DECODE_INV

        );

    REG_B_DEC: DECODERN2
        GENERIC MAP (3)
        PORT MAP(
            RB,
            RB_DECODE_INV

        );

    GEN_INV: FOR i in 0 to 7 GENERATE
	RA_DECODE(i) <= RA_DECODE_INV(7 - i);
	RB_DECODE(i) <= RB_DECODE_INV(7 - i);
    END GENERATE;

    -- Output definition
    WITH Y_D SELECT
        DONE <=
            '1' WHEN WAIT_RUN,
            '0' WHEN OTHERS;

    WITH Y_D SELECT  
        EN_CONTROL <=
            "010000000000" WHEN WAIT_RUN,
            "0000"& RA_DECODE WHEN MV, 
            "0000" & RA_DECODE WHEN MVI, 
            "000100000000" WHEN ADD1, 
            "001000000000" WHEN ADD2, 
            "0000" & RA_DECODE WHEN ADD3, 
            "000100000000" WHEN SUB1, 
            "101000000000" WHEN SUB2, 
            "0000" & RA_DECODE WHEN SUB3,
            "000000000000" WHEN OTHERS;

    WITH Y_D SELECT
        MUX_CONTROL <=
            "1000000000" WHEN WAIT_RUN,
            "00" & RB_DECODE WHEN MV, 
            "1000000000" WHEN MVI, 
            "00" & RA_DECODE WHEN ADD1, 
            "00" & RB_DECODE WHEN ADD2, 
            "0100000000" WHEN ADD3, 
            "00" & RA_DECODE WHEN SUB1, 
            "00" & RB_DECODE WHEN SUB2, 
            "0100000000" WHEN SUB3, 
            "0000000000" WHEN OTHERS;    




END ARCHITECTURE ARCH_CPU;