-- Library declaration
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

-- Entity declaration
ENTITY CONTADOR_NBIT IS
  GENERIC(
    N : natural :=4;
    valMax : natural := 10

  );
  PORT (
    Clk, reset_n, enable : IN STD_LOGIC;
    rollover : OUT STD_LOGIC;
    Q : OUT std_logic_vector(N-1 DOWNTO 0)
  );
END ENTITY CONTADOR_NBIT;


-- Architecture declaration
ARCHITECTURE RLT OF CONTADOR_NBIT IS
SIGNAL VALUE : unsigned(N-1 DOWNTO 0);
BEGIN
PROCESS (Clk, reset_n )
  BEGIN
    -- Falling edge
      IF (reset_n = '0' OR VALUE = valMax - 1) THEN
        VALUE <=(OTHERS => '0');
        rollover <= '1';
      
      ELSIF falling_edge(Clk) THEN
        IF enable = '1' THEN
          VALUE <= VALUE + 1;
          rollover <= '0';
        END IF;

      END IF;
    
END PROCESS;
Q <= std_logic_vector(VALUE);
END RLT;