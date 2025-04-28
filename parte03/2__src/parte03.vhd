-- Library importing
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

LIBRARY ATOMIC_COMPONENTS;
USE ATOMIC_COMPONENTS.ATOMIC_COMPONENTS.ALL;

LIBRARY SUB_SYSTEMS;
USE SUB_SYSTEMS.SUB_SYSTEMS.ALL;

ENTITY PARTE03 IS
	PORT(
		SW: IN std_logic_vector(15 DOWNTO 0); --Entrada A
		KEY0: IN std_logic; -- Reset
        KEY1: IN std_logic; -- Clock
		HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7: OUT std_logic_vector(6 DOWNTO 0);
	
	);
	
END ENTITY PARTE03;


ARCHITECTURE ARCH_PARTE03 OF PARTE03 IS

    SIGNAL A: Std_logic_vector(7 DOWNTO 0);
    SIGNAL B: std_logic_vector(7 DOWNTO 0);
    SIGNAL MULT: std_logic_vector(7 DOWNTO 0);
	SIGNAL P: std_logic_vector(7 DOWNTO 0);


BEGIN

    -- Porting all components
    FFD_A: FLIP_FLOP_D
	GENERIC MAP(7)
        PORT MAP(
		KEY1,
		KEY0,
            	SW,
            	A
        );

    SUM: FULL_ADDER
 	GENERIC MAP(8)  
  	PORT MAP(
    		A, S2,
    		'0',
    		S1,
    		COUT(0)
    
  	);

    FFD_S: FLIP_FLOP_D
	GENERIC MAP(7)
        PORT MAP(
		KEY1,
		KEY0,
            	S1,
            	S2
        );

    FFD_COUT: FLIP_FLOP_D
	GENERIC MAP(0)
        PORT MAP(
		KEY1,
		KEY0,
            	COUT,
            	LEDG
        );

	LEDR <= S2;

END ARCHITECTURE ARCH_PARTE03;