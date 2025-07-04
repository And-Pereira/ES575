-- Library importing
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;


ENTITY tb_circuita IS
  --TEST BENCH DOES NOT NEED AN ENTITY
    
END ENTITY tb_circuita;

ARCHITECTURE BEHAVIORAL OF tb_circuita IS
  --DEFINE MY TESTING COMPONENTS
  COMPONENT CIRCUITA
  
      -- DEFINE INPUT/OUTPUT
    PORT(
        X: IN std_logic_vector(2 DOWNTO 0);
        Y: OUT std_logic_vector(2 DOWNTO 0);

    );
  
  END COMPONENT;
  
  --DEFINE MY TESTING SIGNALS
  SIGNAL X1     : std_logic_vector(2 DOWNTO 0);
  SIGNAL Y1     : std_logic_vector(2 DOWNTO 0);
    
  BEGIN
    --INSTANTIATE COMPONENT
    CA: CIRCUITA

    PORT MAP (
      X1,
      Y1
    );
    
    -- Test process
    process
    begin
        -- Test Case 0: X1 = "010"
        X1 <= "010";
        wait for 10 ns;
        assert (Y1 = "000") report "Test Case 1 Failed" severity error;

        -- Test Case 1: X1 = "001"
        X1 <= "001";
        wait for 10 ns;
        assert (Y1 = "001") report "Test Case 1 Failed" severity error;

        -- Test Case 2: X1 = "100"
        X1 <= "100";
        wait for 10 ns;
        assert (Y1 = "010") report "Test Case 1 Failed" severity error;

        -- Test Case 3: X1 = "101"
        X1 <= "101";
        wait for 10 ns;
        assert (Y1 = "011") report "Test Case 1 Failed" severity error;

        -- Test Case 4: X1 = "110"
        X1 <= "110";
        wait for 10 ns;
        assert (Y1 = "100") report "Test Case 1 Failed" severity error;

        -- Test Case 5: X1 = "111"
        X1 <= "111";
        wait for 10 ns;
        assert (Y1 = "101") report "Test Case 1 Failed" severity error;


        -- End of test
        report "All test cases passed!" severity note;
        wait;  -- Wait indefinitely
    end process;

END ARCHITECTURE BEHAVIORAL;