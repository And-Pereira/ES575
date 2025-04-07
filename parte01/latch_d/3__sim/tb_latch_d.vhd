-- Library declaration
LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

-- Entity declaration
ENTITY TB_LATCH_D IS

END ENTITY TB_LATCH_D;

-- Architecture declaration
ARCHITECTURE BEHAVIORAL OF TB_LATCH_D IS

    -- Declare testing component
    COMPONENT LATCH_D IS
      PORT (
        D, Clk : IN STD_LOGIC ;
        Q : OUT STD_LOGIC
      );
    END COMPONENT LATCH_D;

    -- Support signals
    SIGNAL X1: STD_LOGIC;
    SIGNAL X2: STD_LOGIC;
    SIGNAL Y: STD_LOGIC;

BEGIN
    --INSTANTIATE COMPONENT
    LD: LATCH_D
    PORT MAP (
      X1, X2,
      Y
    );
    
    -- Test process
    process
    begin
        -- Test Case 0: 
        X1 <= '1';
        X2 <= '1';
        wait for 10 ns;
        assert (Y = '1') report "Test Case 0 Failed" severity error;

        -- Test Case 1: 
        X1 <= '0';
        X2 <= '1';
        wait for 10 ns;
        assert (Y = '0') report "Test Case 1 Failed" severity error;

        -- Test Case 2: 
        X1 <= '0';
        X2 <= '0';
        wait for 10 ns;
        assert (Y = '0') report "Test Case 2 Failed" severity error;

        -- Test Case 15: 
        X1 <= '1';
        X2 <= '0';
        wait for 10 ns;
        assert (Y = '0') report "Test Case 3 Failed" severity error;


        -- End of test
        report "All test cases passed!" severity note;
        wait;  -- Wait indefinitely
    end process;

END ARCHITECTURE BEHAVIORAL;