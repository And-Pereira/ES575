-- Library importing
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

LIBRARY ATOMIC_COMPONENTS;
USE ATOMIC_COMPONENTS.ATOMIC_COMPONENTS.ALL;

ENTITY PARTE01 IS
	PORT(
    KEY: IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- CLKZ, CLKM, CLKR, ClearRegs
    SW: IN STD_LOGIC_VECTOR(17 DOWNTO 0); -- TecD, TecE, WrEn, SelM2, SelM1, SelRB, SelRA, AddSubR
    HEX: OUT STD_LOGIC_VECTOR(1 DOWNTO 0); -- Data
    HEX: OUT STD_LOGIC_VECTOR(7 DOWNTO 6); -- Address
    LEDG: OUT STD_LOGIC_VECTOR(0); -- WrEn

	);
	
END ENTITY PARTE01;

ARCHITECTURE ARCH_PARTE01 OF PARTE01 IS

	SIGNAL CLKZ, CLKM, CLKR, ClearRegs, WrEn, SelM2, SelM1, SelRB, SelRA, AddSubR: STD_LOGIC;
  SIGNAL TecD: STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL TecE: STD_LOGIC_VECTOR(3 DOWNTO 0);

  SIGNAL ADD: STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL DATA_IN: STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL DATA_OUT: STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL WR: STD_LOGIC;

BEGIN
  CLKZ <= KEY(0);
  CLKM <= KEY(1);
  CLKR <= KEY(2);

  ClearRegs <= KEY(3);

  TecD <= SW(7 DOWNTO 0);
  TecE <= SW(11 DOWNTO 8);

  WrEn <= SW(12);

  SelM2 <= SW(13);
  SelM1 <= SW(14);
  SelRB <= SW(15);
  SelRA <= SW(16);
  AddSubR <= SW(17);

  FF_END: FLIP_FLOP_D
    GENERIC MAP(
        4
    );
    PORT MAP(
        CLKR,
        ClearRegs,
        TecE,
        ADD
    );

  FF_ENT_DADO: FLIP_FLOP_D
    GENERIC MAP(
        8
    );
    PORT MAP(
        CLKR,
        ClearRegs,
        TecD,
        DATA_IN
    );

  FF_ENT_DADO: FLIP_FLOP_D
    GENERIC MAP(
        1
    );
    PORT MAP(
        CLKR,
        ClearRegs,
        WrEn,
        WR
    );


  RAM_16: RAM_32x8
      PORT(
          ADD,
          DATA_IN,
          WR,
          CLKM,
          DATA_OUT
      );
  

	-- State's table
	PROCESS(CLKR, CLKM, CLKZ) BEGIN
    



  -- Output definition
  Y_P_Vd <= '1' WHEN (Y_D = Vd_Vm) ELSE '0';
  Y_P_Am <= '1' WHEN (Y_D = Am_Vm) ELSE '0';
  Y_P_Vm <= '1' WHEN (Y_D = Vm_Vd OR Y_D = Vm_Am) ELSE '0';
  Y_S_Vd <= '1' WHEN (Y_D = Vm_Vd) ELSE '0';
  Y_S_Am <= '1' WHEN (Y_D = Vm_Am) ELSE '0';
  Y_S_Vm <= '1' WHEN (Y_D = Vd_Vm OR Y_D = Am_Vm) ELSE '0';

END ARCHITECTURE ARCH_PARTE01;