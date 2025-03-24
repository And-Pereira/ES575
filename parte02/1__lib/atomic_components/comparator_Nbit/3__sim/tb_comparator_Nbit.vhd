-- Library importing
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;


ENTITY TB_COMPARATOR_NBIT IS
  --TEST BENCH DOES NOT NEED AN ENTITY
    
END ENTITY TB_COMPARATOR_NBIT;

ARCHITECTURE BEHAVIORAL OF TB_COMPARATOR_NBIT IS
  --DEFINE MY TESTING COMPONENTS
  COMPONENT COMPARATOR_NBIT
    GENERIC (
      N: INTEGER -- NO DEFAULT VALUE
    );
  
      -- DEFINE INPUT/OUTPUT
    PORT(
        A, B: IN std_logic_vector(N-1 DOWNTO 0);
        RES: OUT std_logic

    );
  
  END COMPONENT;
  
  --DEFINE MY TESTING SIGNALS
  SIGNAL X1     : std_logic_vector(3 DOWNTO 0);
  SIGNAL X2     : std_logic_vector(3 DOWNTO 0);
  SIGNAL R   : std_logic;
    
  BEGIN
    --INSTANTIATE COMPONENT
    FA: RIPPLE_CARRY_ADDER
    GENERIC MAP(
      N => 4
    )
    PORT MAP (
      X1,
      X2,
      R
    );
    
    -- Test process
    process
    begin
        -- Test Case 0: A = 0000, B = 1010
        A <= "0000"; B <= "1010";
        wait for 10 ns;
        assert (COMP = '0') report "Test Case 1 Failed" severity error;

        -- Test Case 1: A = 0001, B = 1010
        A <= "0001"; B <= "1010";
        wait for 10 ns;
        assert (COMP = '0') report "Test Case 1 Failed" severity error;

        -- Test Case 2: A = 0010, B = 1010
        A <= "0010"; B <= "1010";
        wait for 10 ns;
        assert (COMP = '0') report "Test Case 1 Failed" severity error;

        -- Test Case 3: A = 0011, B = 1010
        A <= "0011"; B <= "1010";
        wait for 10 ns;
        assert (COMP = '0') report "Test Case 1 Failed" severity error;

        -- Test Case 4: A = 0100, B = 1010
        A <= "0100"; B <= "1010";
        wait for 10 ns;
        assert (COMP = '0') report "Test Case 1 Failed" severity error;

        -- Test Case 5: A = 0101, B = 1010
        A <= "0101"; B <= "1010";
        wait for 10 ns;
        assert (COMP = '0') report "Test Case 1 Failed" severity error;

        -- Test Case 6: A = 0110, B = 1010
        A <= "0110"; B <= "1010";
        wait for 10 ns;
        assert (COMP = '0') report "Test Case 1 Failed" severity error;

        -- Test Case 7: A = 0111, B = 1010
        A <= "0111"; B <= "1010";
        wait for 10 ns;
        assert (COMP = '0') report "Test Case 1 Failed" severity error;

        -- Test Case 8: A = 1000, B = 1010
        A <= "1000"; B <= "1010";
        wait for 10 ns;
        assert (COMP = '0') report "Test Case 1 Failed" severity error;

        -- Test Case 9: A = 1001, B = 1010
        A <= "1001"; B <= "1010";
        wait for 10 ns;
        assert (COMP = '0') report "Test Case 1 Failed" severity error;

        -- Test Case 10: A = 1010, B = 1010
        A <= "1010"; B <= "1010";
        wait for 10 ns;
        assert (COMP = '0') report "Test Case 1 Failed" severity error;

        -- Test Case 11: A = 1011, B = 1010
        A <= "1011"; B <= "1010";
        wait for 10 ns;
        assert (COMP = '1') report "Test Case 1 Failed" severity error;

        -- Test Case 12: A = 1100, B = 1010
        A <= "1100"; B <= "1010";
        wait for 10 ns;
        assert (COMP = '1') report "Test Case 1 Failed" severity error;

        -- Test Case 13: A = 1101, B = 1010
        A <= "1101"; B <= "1010";
        wait for 10 ns;
        assert (COMP = '1') report "Test Case 1 Failed" severity error;

        -- Test Case 14: A = 1110, B = 1010
        A <= "1110"; B <= "1010";
        wait for 10 ns;
        assert (COMP = '1') report "Test Case 1 Failed" severity error;

        -- Test Case 15: A = 1111, B = 1010
        A <= "1111"; B <= "1010";
        wait for 10 ns;
        assert (COMP = '1') report "Test Case 1 Failed" severity error;

        -- End of test
        report "All test cases passed!" severity note;
        wait;  -- Wait indefinitely
    end process;

END ARCHITECTURE BEHAVIORAL;