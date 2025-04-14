-- Library declaration
LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

-- Entity declaration
ENTITY TB_CONTADOR_NBIT IS

END ENTITY TB_CONTADOR_NBIT;

-- Architecture declaration
ARCHITECTURE BEHAVIORAL OF TB_CONTADOR_NBIT IS

    -- Declare testing component
    COMPONENT CONTADOR_NBIT IS
      GENERIC(
        N : natural :=4;
        valMax : natural := 10

      );
      PORT (
        Clk, reset_n : IN STD_LOGIC;
        Q : OUT std_logic_vector(N-1 DOWNTO 0)
      );
    END COMPONENT CONTADOR_NBIT;

    -- Support signals
    SIGNAL X10: STD_LOGIC;
    SIGNAL X20: STD_LOGIC;
    SIGNAL Y0: STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN
    --INSTANTIATE COMPONENT
    
    CONT_0: CONTADOR_NBIT
    GENERIC MAP(8, 11)
    PORT MAP (
      X10, X20,
      Y0
    );

    
    -- Test process
    process
    begin
        -- Test Case 0: 
        X10 <= '1';
        X20 <= '1';
        wait for 10 ns;
        assert (Y0 = '1') report "Test Case 0 Failed" severity error;

        -- Test Case 1: 
        X10 <= '0';
        X20 <= '1';
        wait for 10 ns;
        assert (Y0 = '0') report "Test Case 1 Failed" severity error;

        -- Test Case 2: 
        X10 <= '0';
        X20 <= '0';
        wait for 10 ns;
        assert (Y0 = '0') report "Test Case 2 Failed" severity error;

        -- Test Case 3: 
        X10 <= '1';
        X20 <= '0';
        wait for 10 ns;
        assert (Y0 = '0') report "Test Case 3 Failed" severity error;

        
        -- End of test
        report "All test cases passed!" severity note;
        wait;  -- Wait indefinitely
    end process;

END ARCHITECTURE BEHAVIORAL;