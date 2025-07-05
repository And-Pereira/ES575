-- Library importing
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.ALL;

LIBRARY ATOMIC_COMPONENTS;
USE ATOMIC_COMPONENTS.ATOMIC_COMPONENTS.ALL;

ENTITY PARTE02 IS
	PORT(
    KEY: IN STD_LOGIC_VECTOR(2 DOWNTO 0); -- reset, Mclk, Pclk
    SW17: IN STD_LOGIC; --run
    --SW: IN STD_LOGIC_VECTOR(15 DOWNTO 0); -- DIN
    LEDR: OUT STD_LOGIC_VECTOR(15 DOWNTO 0); --Saída do processador
    LEDR17: OUT STD_LOGIC -- Done

	);
	
END ENTITY PARTE02;

ARCHITECTURE ARCH_PARTE02 OF PARTE02 IS

  TYPE REG_LIST IS ARRAY (0 TO 9) OF STD_LOGIC_VECTOR(15 DOWNTO 0); -- R0 .. R7, A, G
  SIGNAL REG_OUTPUT: REG_LIST;
  SIGNAL MUX_INPUT: REG_LIST;

  SIGNAL IR: STD_LOGIC_VECTOR(8 DOWNTO 0); -- Imposto de renda
  SIGNAL IR_OUT: STD_LOGIC_VECTOR(8 DOWNTO 0); -- Imposto de renda

  SIGNAL PCLK, MCLK, RST, RUN: STD_LOGIC;
  SIGNAL DIN: STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL EN_CONTROL: STD_LOGIC_VECTOR(11 DOWNTO 0); --R0..R7, A, G, IR, addSub
  SIGNAL MUX_CONTROL: STD_LOGIC_VECTOR(9 DOWNTO 0); -- R0 .. R7, G, DIN
  SIGNAL DATA_PATH: STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL RES: STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL CBOUT: STD_LOGIC;

  SIGNAL ROLL_OVER: STD_LOGIC;
  SIGNAL CONT: STD_LOGIC_VECTOR(6 DOWNTO 0);

  SIGNAL NRST: STD_LOGIC;

-- Components
    COMPONENT AddSub IS
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
            
    END COMPONENT AddSub;

    COMPONENT CPU_X IS
      PORT(
          INSTRUCTION: IN STD_LOGIC_VECTOR(8 DOWNTO 0);
          RST, RUN, CLK: IN STD_LOGIC;
          EN_CONTROL: OUT STD_LOGIC_VECTOR(11 DOWNTO 0); --R0..R7, A, G, IR, addSub
          MUX_CONTROL: OUT STD_LOGIC_VECTOR(9 DOWNTO 0); -- R0 .. R7, G, DIN
          DONE: OUT STD_LOGIC

      );
            
    END COMPONENT CPU_X;

BEGIN
  PCLK <= KEY(2);
  MCLK <= KEY(1);
  NRST <= NOT(KEY(0));
  RST <= KEY(0);
  RUN <= SW17;
  --DIN <= SW(15 DOWNTO 0);
  IR <= DIN(8 DOWNTO 0);
  -- =================================TESTE=========================
  -- Registers
  GEN_REGS: FOR i IN 0 TO 8 GENERATE
    Reg: FLIP_FLOP_D
      GENERIC MAP(
          15
      )
      PORT MAP(
          PCLK,
          RST,
          EN_CONTROL(i),
          DATA_PATH,
          REG_OUTPUT(i)
      );
    END GENERATE;

    Reg_G: FLIP_FLOP_D
      GENERIC MAP(
          15
      )
      PORT MAP(
          PCLK,
          RST,
          EN_CONTROL(9),
          RES,
          REG_OUTPUT(9)
      );

    Reg_IR: FLIP_FLOP_D
      GENERIC MAP(
          8
      )
      PORT MAP(
          PCLK,
          RST,
          EN_CONTROL(10),
          IR,
          IR_OUT
      );



  
  -- MUX Declaration
  GEN_MUX: FOR i IN 0 TO 8 GENERATE
    MUX_INPUT(i) <= REG_OUTPUT(i);

  END GENERATE;

  MUX_INPUT(9) <= DIN;

  WITH MUX_CONTROL SELECT
    DATA_PATH <= 
      MUX_INPUT(0) WHEN "0000000001",
      MUX_INPUT(1) WHEN "0000000010",
      MUX_INPUT(2) WHEN "0000000100",
      MUX_INPUT(3) WHEN "0000001000",
      MUX_INPUT(4) WHEN "0000010000",
      MUX_INPUT(5) WHEN "0000100000",
      MUX_INPUT(6) WHEN "0001000000",
      MUX_INPUT(7) WHEN "0010000000",
      MUX_INPUT(8) WHEN "0100000000",
      MUX_INPUT(9) WHEN "1000000000",
      "0000000000000000" WHEN OTHERS;

  --AddSub
  arithmetic: AddSub
    GENERIC MAP (16)
    PORT MAP(
      EN_CONTROL(11), -- AddSub
      REG_OUTPUT(8), DATA_PATH, -- A, X
      '0',
      RES,
      CBOUT
    );

  -- Control unit
    MY_CPU: CPU_X
      PORT MAP(
          IR_OUT,
          RST, SW17, PCLK, -- reset, run, Pclk
          EN_CONTROL, --R0..R7, A, G, IR, addSub
          MUX_CONTROL, -- R0 .. R7, G, DIN
          LEDR17 --Done

      );

    LEDR(15 DOWNTO 0) <= DATA_PATH;

    MY_COUNTER: CONTADOR_NBIT
        GENERIC MAP(
            7, -- bits
            127 --max val
        )
        PORT MAP(
            MCLK, NRST, '1', --Clk, reset_n, enable
            ROLL_OVER,
            CONT -- result
        );

    MY_MEM: RAM_128x16
      PORT MAP(
        CONT, --Mem address
        (others =>  '0'), -- Input Data
        '0', -- Control signal
        MCLK, -- Clock signal MCLK
        DIN -- Output Data

      );

  

END ARCHITECTURE ARCH_PARTE02;