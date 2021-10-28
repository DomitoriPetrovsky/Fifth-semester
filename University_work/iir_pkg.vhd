library IEEE;


package iir_config is

    constant IIR_ORDER : natural := 7;

    constant IN_IWL : natural := 16;

    constant IIR_CWL: natural := 20;
    

    type VECTOR_OF_STD_L_V is array (natural range <>) of std_logic_vector(IIR_CWL - 1 downto 0);

    constant COEFFS_B : VECTOR_OF_STD_L_V := COEFFS_B_L;
    constant COEFFS_A : VECTOR_OF_STD_L_V := COEFFS_A_L;
    
    --Butter
    constant COEFFS_A_L : VECTOR_OF_STD_L_V :=
    ( 
    "00001000000000000000",
    "11010110000110110010",
    "01011111011010110000",
    "10000101101110100101",
    "01011111000011111110",
    "11010011001101101001",
    "00001011110101000000",
    "11111110101001100111"
    );

    constant COEFFS_B_L : VECTOR_OF_STD_L_V :=
    (
    "00000000000000000000",
    "00000000000000000001",
    "00000000000000000011",
    "00000000000000000110",
    "00000000000000000110",
    "00000000000000000011",
    "00000000000000000001",
    "00000000000000000000",
    );
end iir_config;