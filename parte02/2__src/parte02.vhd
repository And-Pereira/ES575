-- Library importing
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

LIBRARY ATOMIC_COMPONENTS;
USE ATOMIC_COMPONENTS.ATOMIC_COMPONENTS.ALL;

ENTITY PARTE02 IS
	PORT(
	X: IN STD_LOGIC;
	RST: IN STD_LOGIC;
	CLK: IN STD_LOGIC;
	Y: OUT STD_LOGIC  
	);
	
END ENTITY PARTE02;

ARCHITECTURE ARCH_PARTE02 OF PARTE02 IS

	TYPE STATE_TYPES IS (A, B, C, D, E, F, G, H, I);
	SIGNAL Y_Q, Y_D: STATE_TYPES; -- Y_Q: FUTURE, Y_D: CURRENT

BEGIN

	-- State's table
	PROCESS(X, Y_D)
	BEGIN
		CASE Y_D IS
			-- Begining Node
			WHEN A=>
				IF (X = '0') THEN Y_Q <= B;
				ELSE Y_Q <= F;
				END IF;

			-- 0 Branch
			WHEN B=>
				IF (X = '0') THEN Y_Q <= C;
				ELSE Y_Q <= F;
				END IF;
			WHEN C=>
				IF (X = '0') THEN Y_Q <= D;
				ELSE Y_Q <= F;
				END IF;
			WHEN D=>
				IF (X = '0') THEN Y_Q <= E;
				ELSE Y_Q <= F;
				END IF;
			WHEN E=>
				IF (X = '0') THEN Y_Q <= E;
				ELSE Y_Q <= F;
				END IF;

			-- 1 Branch
			WHEN F=>
				IF (X = '1') THEN Y_Q <= G;
				ELSE Y_Q <= B;
				END IF;
			WHEN G=>
				IF (X = '1') THEN Y_Q <= H;
				ELSE Y_Q <= B;
				END IF;
			WHEN H=>
				IF (X = '1') THEN Y_Q <= I;
				ELSE Y_Q <= B;
				END IF;
			WHEN I=>
				IF (X = '1') THEN Y_Q <= I;
				ELSE Y_Q <= B;
				END IF;

		END CASE;
	END PROCESS;

	-- How FFs will behave
	PROCESS(CLK, RST)
	BEGIN
		IF(RST = '1') THEN
			Y_D <= A;
		ELSIF (rising_edge(CLK)) THEN
			Y_D <= Y_Q;
		END IF;
	END PROCESS;

	-- Output definition
	Y <= '1' WHEN (Y_D = E OR Y_D = I) ELSE '0';

END ARCHITECTURE ARCH_PARTE02;