-- Library declaration
LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

-- Entity declaration
ENTITY TB_FLIP_FLOP_D IS

END ENTITY TB_FLIP_FLOP_D;

-- Architecture declaration
ARCHITECTURE BEHAVIORAL OF TB_FLIP_FLOP_D IS

    -- Declare testing component
    COMPONENT FLIP_FLOP_D IS
      PORT (
        D, Clk : IN STD_LOGIC ;
        Q : OUT STD_LOGIC
      );
    END COMPONENT FLIP_FLOP_D;

    -- Support signals
    SIGNAL X10: STD_LOGIC;
    SIGNAL X20: STD_LOGIC;
    SIGNAL Y0: STD_LOGIC;


BEGIN
    --INSTANTIATE COMPONENT
    
    FFD_0: FLIP_FLOP_D
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