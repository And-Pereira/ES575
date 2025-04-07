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
		KEY0: IN std_logic; -- Clock
		SW0: IN std_logic; -- Clear
		SW1: IN std_logic; -- Enable
		HEX0: OUT std_logic_vector(6 DOWNTO 0) -- Contador

	    );
    END COMPONENT PARTE02;

    -- Support signals
    SIGNAL KEY0_1: std_logic;
    SIGNAL SW0_1: std_logic;
    SIGNAL SW1_1: std_logic;
    SIGNAL HEX0_1: Std_logic_vector(6 DOWNTO 0);

BEGIN
    --INSTANTIATE COMPONENT
    PT2: PARTE02
    PORT MAP (
      KEY0_1, SW0_1, SW1_1,
      HEX0_1
    );
    
    -- Test process
    process
    begin
        -- Test Case 0:
	KEY0_1 <= '0';
    	wait for 2 ns;
    	KEY0_1 <= '1';
    	wait for 2 ns; 

        SW0_1 <= '0';
	SW1_1 <= '1';

        wait for 10 ns;
        assert (HEX0_1 = "1000000") report "Test Case 0 Failed" severity error;

        -- Test Case 1:
	KEY0_1 <= '0';
    	wait for 2 ns;
    	KEY0_1 <= '1';
    	wait for 2 ns; 

        SW0_1 <= '0';
	SW1_1 <= '1';

        wait for 10 ns;
        assert (HEX0_1 = "1111001") report "Test Case 1 Failed" severity error;

        -- Test Case 2:
	KEY0_1 <= '0';
    	wait for 2 ns;
    	KEY0_1 <= '1';
    	wait for 2 ns; 

        SW0_1 <= '0';
	SW1_1 <= '1';

        wait for 10 ns;
        assert (HEX0_1 = "0100100") report "Test Case 2 Failed" severity error;

        -- Test Case 3:
	KEY0_1 <= '0';
    	wait for 2 ns;
    	KEY0_1 <= '1';
    	wait for 2 ns; 

        SW0_1 <= '0';
	SW1_1 <= '1';

        wait for 10 ns;
        assert (HEX0_1 = "0110000") report "Test Case 3 Failed" severity error;

        -- Test Case 4:
	KEY0_1 <= '0';
    	wait for 2 ns;
    	KEY0_1 <= '1';
    	wait for 2 ns; 

        SW0_1 <= '0';
	SW1_1 <= '1';

        wait for 10 ns;
        assert (HEX0_1 = "0011001") report "Test Case 4 Failed" severity error;

        -- Test Case 5:
	KEY0_1 <= '0';
    	wait for 2 ns;
    	KEY0_1 <= '1';
    	wait for 2 ns; 

        SW0_1 <= '0';
	SW1_1 <= '1';

        wait for 10 ns;
        assert (HEX0_1 = "0010010") report "Test Case 5 Failed" severity error;

        -- Test Case 6:
	KEY0_1 <= '0';
    	wait for 2 ns;
    	KEY0_1 <= '1';
    	wait for 2 ns; 

        SW0_1 <= '0';
	SW1_1 <= '1';

        wait for 10 ns;
        assert (HEX0_1 = "0000010") report "Test Case 6 Failed" severity error;

        -- Test Case 7:
	KEY0_1 <= '0';
    	wait for 2 ns;
    	KEY0_1 <= '1';
    	wait for 2 ns; 

        SW0_1 <= '0';
	SW1_1 <= '1';

        wait for 10 ns;
        assert (HEX0_1 = "1111000") report "Test Case 7 Failed" severity error;

        -- Test Case 8:
	KEY0_1 <= '0';
    	wait for 2 ns;
    	KEY0_1 <= '1';
    	wait for 2 ns; 

        SW0_1 <= '0';
	SW1_1 <= '1';

        wait for 10 ns;
        assert (HEX0_1 = "0000000") report "Test Case 8 Failed" severity error;

        -- Test Case 9:
	KEY0_1 <= '0';
    	wait for 2 ns;
    	KEY0_1 <= '1';
    	wait for 2 ns; 

        SW0_1 <= '0';
	SW1_1 <= '1';

        wait for 10 ns;
        assert (HEX0_1 = "0010000") report "Test Case 9 Failed" severity error;

        -- Test Case 10:
	KEY0_1 <= '0';
    	wait for 2 ns;
    	KEY0_1 <= '1';
    	wait for 2 ns; 

        SW0_1 <= '0';
	SW1_1 <= '1';

        wait for 10 ns;
        assert (HEX0_1 = "0001000") report "Test Case 10 Failed" severity error;

        -- Test Case 11:
	KEY0_1 <= '0';
    	wait for 2 ns;
    	KEY0_1 <= '1';
    	wait for 2 ns; 

        SW0_1 <= '0';
	SW1_1 <= '1';

        wait for 10 ns;
        assert (HEX0_1 = "0000011") report "Test Case 11 Failed" severity error;

        -- Test Case 12:
	KEY0_1 <= '0';
    	wait for 2 ns;
    	KEY0_1 <= '1';
    	wait for 2 ns; 

        SW0_1 <= '0';
	SW1_1 <= '1';

        wait for 10 ns;
        assert (HEX0_1 = "1000110") report "Test Case 12 Failed" severity error;

        -- Test Case 13:
	KEY0_1 <= '0';
    	wait for 2 ns;
    	KEY0_1 <= '1';
    	wait for 2 ns; 

        SW0_1 <= '0';
	SW1_1 <= '1';

        wait for 10 ns;
        assert (HEX0_1 = "0100001") report "Test Case 13 Failed" severity error;

        -- Test Case 14:
	KEY0_1 <= '0';
    	wait for 2 ns;
    	KEY0_1 <= '1';
    	wait for 2 ns; 

        SW0_1 <= '0';
	SW1_1 <= '1';

        wait for 10 ns;
        assert (HEX0_1 = "0000110") report "Test Case 14 Failed" severity error;

        -- Test Case 15:
	KEY0_1 <= '0';
    	wait for 2 ns;
    	KEY0_1 <= '1';
    	wait for 2 ns; 

        SW0_1 <= '0';
	SW1_1 <= '1';

        wait for 10 ns;
        assert (HEX0_1 = "0001110") report "Test Case 15 Failed" severity error;

        -- Test Case 16:
	KEY0_1 <= '0';
    	wait for 2 ns;
    	KEY0_1 <= '1';
    	wait for 2 ns; 

        SW0_1 <= '1';
	SW1_1 <= '0';

        wait for 10 ns;
        assert (HEX0_1 = "1000000") report "Test Case 16 Failed" severity error;

        -- Test Case 17:
	KEY0_1 <= '0';
    	wait for 2 ns;
    	KEY0_1 <= '1';
    	wait for 2 ns; 

        SW0_1 <= '1';
	SW1_1 <= '1';

        wait for 10 ns;
        assert (HEX0_1 = "1000000") report "Test Case 17 Failed" severity error;

        -- End of test
        report "All test cases passed!" severity note;
        wait;  -- Wait indefinitely
    end process;

END ARCHITECTURE BEHAVIORAL;