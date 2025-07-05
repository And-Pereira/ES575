-- Library definition
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

-- Entity Definition
ENTITY TB_CONV_4_TO_7_HEX IS

		
END ENTITY TB_CONV_4_TO_7_HEX;

-- Architecture definition
ARCHITECTURE BEHAVIORAL OF TB_CONV_4_TO_7_HEX IS
	COMPONENT CONV_4_TO_7_HEX IS
		PORT(
			X: IN std_logic_vector(3 DOWNTO 0);
			Y: OUT std_logic_vector (6 DOWNTO 0)
		);
		
	END COMPONENT CONV_4_TO_7_HEX;

	SIGNAL X: std_logic_vector(3 DOWNTO 0);
	SIGNAL Y: std_logic_vector(6 DOWNTO 0);

BEGIN
	C47: CONV_4_TO_7_HEX
		PORT MAP(X, Y);

PROCESS
BEGIN
	--Test 0
	X<= "0000";
	wait for 10 ns;
	assert (Y = "1000000") report "Test Case 0 Failed" severity error;

	--Test 1
	X<= "0001";
	wait for 10 ns;
	assert (Y = "1111001") report "Test Case 1 Failed" severity error;

	--Test 2
	X<= "0010";
	wait for 10 ns;
	assert (Y = "0100100") report "Test Case 2 Failed" severity error;

	--Test 3
	X<= "0011";
	wait for 10 ns;
	assert (Y = "0110000") report "Test Case 3 Failed" severity error;

	--Test 4
	X<= "0100";
	wait for 10 ns;
	assert (Y = "0011001") report "Test Case 4 Failed" severity error;

	--Test 5
	X<= "0101";
	wait for 10 ns;
	assert (Y = "0010010") report "Test Case 5 Failed" severity error;

	--Test 6
	X<= "0110";
	wait for 10 ns;
	assert (Y = "0000010") report "Test Case 6 Failed" severity error;

	--Test 7
	X<= "0111";
	wait for 10 ns;
	assert (Y = "1111000") report "Test Case 7 Failed" severity error;

	--Test 8
	X<= "1000";
	wait for 10 ns;
	assert (Y = "0000000") report "Test Case 8 Failed" severity error;

	--Test 9
	X<= "1001";
	wait for 10 ns;
	assert (Y = "0010000") report "Test Case 9 Failed" severity error;

	--Test 10 A else
	X<= "1010";
	wait for 10 ns;
	assert (Y = "0001000") report "Test Case 10 Failed" severity error;

	--Test 11 b else
	X<= "1011";
	wait for 10 ns;
	assert (Y = "0000011") report "Test Case 11 Failed" severity error;

	--Test 12 C else
	X<= "1100";
	wait for 10 ns;
	assert (Y = "1000110") report "Test Case 12 Failed" severity error;

	--Test 13 d else
	X<= "1101";
	wait for 10 ns;
	assert (Y = "0100001") report "Test Case 13 Failed" severity error;

	--Test 14 E else
	X<= "1110";
	wait for 10 ns;
	assert (Y = "0000110") report "Test Case 14 Failed" severity error;

	--Test 15 F else
	X<= "1111";
	wait for 10 ns;
	assert (Y = "0001110") report "Test Case 15 Failed" severity error;

        -- End of test
        report "All test cases passed!" severity note;
        wait;  -- Wait indefinitely
	


END PROCESS;
	

	

END ARCHITECTURE BEHAVIORAL;
