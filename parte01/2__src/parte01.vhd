-- Library importing
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

LIBRARY ATOMIC_COMPONENTS;
USE ATOMIC_COMPONENTS.ATOMIC_COMPONENTS.ALL;

ENTITY PARTE01 IS
	PORT(
    RST: IN STD_LOGIC;
    CLOCK_50: IN STD_LOGIC;
    Y_P_Vd, Y_P_Am, Y_P_Vm: OUT STD_LOGIC;
    Y_S_Vd, Y_S_Am, Y_S_Vm: OUT STD_LOGIC;
    Vs: IN STD_LOGIC
	);
	
END ENTITY PARTE01;

ARCHITECTURE ARCH_PARTE01 OF PARTE01 IS

	TYPE STATE_TYPES IS (Vd_Vm, Am_Vm, Vm_Vd, Vm_Am);
	SIGNAL Y_Q, Y_D: STATE_TYPES; -- Y_Q: FUTURE, Y_D: CURRENT
  SIGNAL Tmin, Tmax, Tam: std_logic;
  SIGNAL EN_Tam, EN_Tmin, EN_Tmax: std_logic;

BEGIN

	-- State's table
	PROCESS(Tmin, Tmax, Tam, Vs, Y_D)
	BEGIN
		CASE Y_D IS
			-- Case 1
			WHEN Vd_Vm=>
				IF (Tmin = '1' and Vs = '1') THEN Y_Q <= Am_Vm;
				ELSE Y_Q <= Vd_Vm;
				END IF;

			-- Case 2
			WHEN Am_Vm=>
				IF (Tam = '1') THEN Y_Q <= Vm_Vd;
				ELSE Y_Q <= Am_Vm;
				END IF;

      -- Case 3
			WHEN Vm_Vd=>
				IF (Tmax = '1' or Vs = '0') THEN Y_Q <= Vm_Am;
				ELSE Y_Q <= Vm_Vd;
				END IF;

      -- Case 4
			WHEN Vm_Am=>
				IF (Tam = '1') THEN Y_Q <= Vd_Vm;
				ELSE Y_Q <= Vm_Am;
				END IF;

		END CASE;
	END PROCESS;

	-- How FFs will behave
	PROCESS(CLOCK_50, RST)
	BEGIN
		IF(RST = '1') THEN
			Y_D <= Vd_Vm;

		ELSIF (rising_edge(CLOCK_50)) THEN
			Y_D <= Y_Q;

		END IF;
	END PROCESS;

  -- Input definition

  EN_Tam <= (Tmin = '1' and Vs = '1') OR (Tmax = '1' or Vs = '0');
  -- For AM T = 1s
  CONT_AM: TEMPORIZADOR_NBIT
    GENERIC MAP(
      4, 1

    )
    PORT MAP(
      CLOCK_50, RST, EN_Tam, 
      Tam

    );

  EN_Tmin <= Tam;
  -- For AM T = 3s
  CONT_MIN: TEMPORIZADOR_NBIT
    GENERIC MAP(
      4, 3

    )
    PORT MAP(
      CLOCK_50, RST, EN_Tmin, 
      Tmin

    );

  EN_Tmax <= Tam;
  -- For MAX T = 5s
  CONT_MAX: TEMPORIZADOR_NBIT
    GENERIC MAP(
      4, 5

    )
    PORT MAP(
      CLOCK_50, RST, EN_Tmax, 
      Tmax

    );
  

	-- Output definition
  Y_P_Vd <= '1' WHEN (Y_D = Vd_Vm) ELSE '0';
  Y_P_Am <= '1' WHEN (Y_D = Am_Vm) ELSE '0';
  Y_P_Vm <= '1' WHEN (Y_D = Vm_Vd OR Y_D = Vm_Am) ELSE '0';
  Y_S_Vd <= '1' WHEN (Y_D = Vm_Vd) ELSE '0';
  Y_S_Am <= '1' WHEN (Y_D = Vm_Am) ELSE '0';
  Y_S_Vm <= '1' WHEN (Y_D = Vd_Vm OR Y_D = Am_Vm) ELSE '0';

END ARCHITECTURE ARCH_PARTE01;