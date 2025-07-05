LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY DECODERN2 IS
    GENERIC(
        N: INTEGER := 4 

    );
    PORT(
        X: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
        Y: OUT STD_LOGIC_VECTOR(2**(N)-1 DOWNTO 0)

    );

END ENTITY DECODERN2;

ARCHITECTURE ARCH_DECODERN2 OF DECODERN2 IS
    SIGNAL DEC: STD_LOGIC_VECTOR(2**(N)-1 DOWNTO 0);
    TYPE ARRAY_MUX IS ARRAY (0 to 2**N-1) of std_logic_vector(2**(N)-1 downto 0);
    SIGNAL MUX_ANS: ARRAY_MUX;


    BEGIN
    DEC(2**N-1) <= '1';
    DEC(2**N-2 DOWNTO 0) <= (others =>'0');
    MUX_ANS(0) <= DEC;

    GEN_DECODER: FOR i IN 1 TO 2**N-1 GENERATE
        MUX_ANS(i) <= std_logic_vector(shift_right(unsigned(DEC), i));

    END GENERATE;

   Y <= MUX_ANS(TO_INTEGER(unsigned(X)));

END ARCH_DECODERN2;

