-- Library importing
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

LIBRARY ATOMIC_COMPONENTS;
USE ATOMIC_COMPONENTS.ATOMIC_COMPONENTS.ALL;

ENTITY TB_PARTE02 IS

	
END ENTITY TB_PARTE02;


ARCHITECTURE BEHAVIORAL OF TB_PARTE02 IS

    -- Declare testing component
    COMPONENT PARTE02 IS
    	PORT(
		SW: IN std_logic_vector(3 DOWNTO 0);
		HEX1, HEX0: OUT std_logic_vector(6 DOWNTO 0)
	
	    );
    END COMPONENT PARTE02;

    -- Support signals
    SIGNAL X: Std_logic_vector(3 DOWNTO 0);
    SIGNAL Y0: Std_logic_vector(6 DOWNTO 0);
    SIGNAL Y1: Std_logic_vector(6 DOWNTO 0);

BEGIN
    --INSTANTIATE COMPONENT
    PT2: PARTE02
    PORT MAP (
      X,
      Y1, Y0
    );
    
    -- Test process
    process
    begin
        -- Test Case 0: 
        X <= "0000";
        wait for 10 ns;
        assert (Y1 = "1000000" and Y0 = "1000000") report "Test Case 0 Failed" severity error;

        -- Test Case 9: 
        X <= "1001";
        wait for 10 ns;
        assert (Y1 = "1000000" and Y0 = "0010000") report "Test Case 9 Failed" severity error;

        -- Test Case 10: 
        X <= "1010";
        wait for 10 ns;
        assert (Y1 = "1111001" and Y0 = "1000000") report "Test Case 10 Failed" severity error;

        -- Test Case 15: 
        X <= "1111";
        wait for 10 ns;
        assert (Y1 = "1111001" and Y0 = "0010010") report "Test Case 15 Failed" severity error;


        -- End of test
        report "All test cases passed!" severity note;
        wait;  -- Wait indefinitely
    end process;

END ARCHITECTURE BEHAVIORAL;