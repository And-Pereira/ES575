-- Library importing
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

-- Entity declaration
ENTITY COMPARATOR_NBIT IS
    -- Define generic parameters
    GENERIC (
        N: INTEGER :=4 -- 4 AS DEFAULT VALUE
    );

    --Define I/O
    PORT(
        A, B: IN std_logic_vector(N-1 DOWNTO 0);
        RES: OUT std_logic

    );

END ENTITY COMPARATOR_NBIT;


-- Architecture declaration
ARCHITECTURE ARCH_COMPARATOR_NBIT OF COMPARATOR_NBIT IS

    --Define intermediate signals
    SIGNAL EQ: std_logic_vector(N-1 DOWNTO 0); --Ai = Bi
    SIGNAL GT: std_logic_vector(N-1 DOWNTO 0); --Ai > Bi
    SIGNAL TERM: std_logic_vector(N-1 DOWNTO 0); -- (Aj=Bj) AND ...(Aj=Bj)
    SIGNAL TERM_COMP: std_logic_vector(N-1 DOWNTO 0); -- (Ai > Bi) AND ...(Aj=Bj)
    SIGNAL TERM_UNION: std_logic_vector(N-1 DOWNTO 0); -- OR of all TERM_COMP


BEGIN
    -- Base case 
    EQ(0) <= NOT(A(N-1) XOR B(N-1));
    GT (0) <= A(N-1) AND NOT(B(N-1));
    TERM(0) <= '1';
    TERM_COMP(0) <= TERM(0) AND GT(0);
    TERM_UNION(0) <= TERM_COMP(0);


	 GEN_TERMS: FOR i in 1 TO N-1 GENERATE
		 EQ(i) <= NOT(A(N-1 - i) XOR B(N-1 - i));
		 GT (i) <= A(N-1 - i) AND NOT(B(N-1 - i));
		 TERM(i) <= TERM(i-1) AND EQ(i-1);
		 TERM_COMP(i) <= TERM(i) AND GT(i);
		 TERM_UNION(i) <= TERM_UNION(i-1) OR TERM_COMP(i);
		 
	END GENERATE;
				
RES <= TERM_UNION(N-1);
            



END ARCHITECTURE ARCH_COMPARATOR_NBIT;



