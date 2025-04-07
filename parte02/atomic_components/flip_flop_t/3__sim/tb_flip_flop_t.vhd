-- Library declaration
LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

-- Entity declaration
ENTITY TB_FLIP_FLOP_T IS

END ENTITY TB_FLIP_FLOP_T;

-- Architecture declaration
ARCHITECTURE BEHAVIORAL OF TB_FLIP_FLOP_T IS

    -- Declare testing component
    COMPONENT FLIP_FLOP_T IS
      PORT (CLK, T, ENABLE, RESET : IN STD_LOGIC;
            Q: OUT STD_LOGIC;
            Qnot : OUT STD_LOGIC);
    END COMPONENT FLIP_FLOP_T;

    -- Support signals
    SIGNAL CLK_: STD_LOGIC;
    SIGNAL T_: STD_LOGIC;
    SIGNAL ENABLE_: STD_LOGIC;
    SIGNAL RESET_: STD_LOGIC;
    SIGNAL Q_: STD_LOGIC;
    SIGNAL Qnot_: STD_LOGIC;


BEGIN
    --INSTANTIATE COMPONENT
    
    FFT_0: FLIP_FLOP_T
    PORT MAP (
      CLK_, T_, ENABLE_, RESET_,
      Q_, Qnot_
    );

    
    -- Test process
    process
    begin
        -- Test Case 0: 
        CLK_ <= '1';
        T_ <= '1';
        ENABLE_ <= '1'; 
        RESET_ <= '1';

        wait for 10 ns;
        assert (Q_ = '1' AND Qnot_ = '0') report "Test Case 0 Failed" severity error;


        
        -- End of test
        report "All test cases passed!" severity note;
        wait;  -- Wait indefinitely
    end process;

END ARCHITECTURE BEHAVIORAL;