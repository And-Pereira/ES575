-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "04/14/2025 20:00:46"

-- 
-- Device: Altera EP4CGX150DF31C7 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	S_FULL_ADDER IS
    PORT (
	SW : IN std_logic_vector(8 DOWNTO 0);
	LEDR : OUT std_logic_vector(7 DOWNTO 0);
	LEDG : OUT std_logic_vector(4 DOWNTO 0)
	);
END S_FULL_ADDER;

-- Design Ports Information
-- LEDR[0]	=>  Location: PIN_T23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[1]	=>  Location: PIN_T24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[2]	=>  Location: PIN_V27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[3]	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[4]	=>  Location: PIN_T21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[5]	=>  Location: PIN_T26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[6]	=>  Location: PIN_R25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[7]	=>  Location: PIN_T27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[0]	=>  Location: PIN_AA25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[1]	=>  Location: PIN_AB25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[2]	=>  Location: PIN_F27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[3]	=>  Location: PIN_F26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[4]	=>  Location: PIN_W26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_V28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_U30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_V21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[4]	=>  Location: PIN_AB30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[5]	=>  Location: PIN_U21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[6]	=>  Location: PIN_T28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[7]	=>  Location: PIN_R30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[8]	=>  Location: PIN_P30,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF S_FULL_ADDER IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_SW : std_logic_vector(8 DOWNTO 0);
SIGNAL ww_LEDR : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_LEDG : std_logic_vector(4 DOWNTO 0);
SIGNAL \LEDR[0]~output_o\ : std_logic;
SIGNAL \LEDR[1]~output_o\ : std_logic;
SIGNAL \LEDR[2]~output_o\ : std_logic;
SIGNAL \LEDR[3]~output_o\ : std_logic;
SIGNAL \LEDR[4]~output_o\ : std_logic;
SIGNAL \LEDR[5]~output_o\ : std_logic;
SIGNAL \LEDR[6]~output_o\ : std_logic;
SIGNAL \LEDR[7]~output_o\ : std_logic;
SIGNAL \LEDG[0]~output_o\ : std_logic;
SIGNAL \LEDG[1]~output_o\ : std_logic;
SIGNAL \LEDG[2]~output_o\ : std_logic;
SIGNAL \LEDG[3]~output_o\ : std_logic;
SIGNAL \LEDG[4]~output_o\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \SW[5]~input_o\ : std_logic;
SIGNAL \SW[6]~input_o\ : std_logic;
SIGNAL \SW[7]~input_o\ : std_logic;
SIGNAL \SW[8]~input_o\ : std_logic;
SIGNAL \COMP_FULL_ADDER_4|C[1]~2_combout\ : std_logic;
SIGNAL \COMP_FULL_ADDER_4|C~3_combout\ : std_logic;
SIGNAL \COMP_FULL_ADDER_4|C[3]~4_combout\ : std_logic;
SIGNAL \COMP_FULL_ADDER_4|C[3]~5_combout\ : std_logic;
SIGNAL \COMP_FULL_ADDER_4|COUT~0_combout\ : std_logic;
SIGNAL \COMP_FULL_ADDER_4|SUM\ : std_logic_vector(3 DOWNTO 0);

BEGIN

ww_SW <= SW;
LEDR <= ww_LEDR;
LEDG <= ww_LEDG;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X117_Y43_N2
\LEDR[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SW[0]~input_o\,
	devoe => ww_devoe,
	o => \LEDR[0]~output_o\);

-- Location: IOOBUF_X117_Y43_N9
\LEDR[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SW[1]~input_o\,
	devoe => ww_devoe,
	o => \LEDR[1]~output_o\);

-- Location: IOOBUF_X117_Y41_N9
\LEDR[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SW[2]~input_o\,
	devoe => ww_devoe,
	o => \LEDR[2]~output_o\);

-- Location: IOOBUF_X117_Y36_N9
\LEDR[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SW[3]~input_o\,
	devoe => ww_devoe,
	o => \LEDR[3]~output_o\);

-- Location: IOOBUF_X117_Y32_N2
\LEDR[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SW[4]~input_o\,
	devoe => ww_devoe,
	o => \LEDR[4]~output_o\);

-- Location: IOOBUF_X117_Y44_N2
\LEDR[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SW[5]~input_o\,
	devoe => ww_devoe,
	o => \LEDR[5]~output_o\);

-- Location: IOOBUF_X117_Y49_N2
\LEDR[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SW[6]~input_o\,
	devoe => ww_devoe,
	o => \LEDR[6]~output_o\);

-- Location: IOOBUF_X117_Y44_N9
\LEDR[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SW[7]~input_o\,
	devoe => ww_devoe,
	o => \LEDR[7]~output_o\);

-- Location: IOOBUF_X117_Y7_N9
\LEDG[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_FULL_ADDER_4|SUM\(0),
	devoe => ww_devoe,
	o => \LEDG[0]~output_o\);

-- Location: IOOBUF_X117_Y7_N2
\LEDG[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_FULL_ADDER_4|SUM\(1),
	devoe => ww_devoe,
	o => \LEDG[1]~output_o\);

-- Location: IOOBUF_X117_Y86_N9
\LEDG[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_FULL_ADDER_4|SUM\(2),
	devoe => ww_devoe,
	o => \LEDG[2]~output_o\);

-- Location: IOOBUF_X117_Y86_N2
\LEDG[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_FULL_ADDER_4|SUM\(3),
	devoe => ww_devoe,
	o => \LEDG[3]~output_o\);

-- Location: IOOBUF_X117_Y35_N2
\LEDG[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \COMP_FULL_ADDER_4|COUT~0_combout\,
	devoe => ww_devoe,
	o => \LEDG[4]~output_o\);

-- Location: IOIBUF_X117_Y39_N1
\SW[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: IOIBUF_X117_Y42_N1
\SW[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: IOIBUF_X117_Y28_N8
\SW[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(2),
	o => \SW[2]~input_o\);

-- Location: IOIBUF_X15_Y91_N15
\SW[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(3),
	o => \SW[3]~input_o\);

-- Location: IOIBUF_X117_Y27_N8
\SW[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(4),
	o => \SW[4]~input_o\);

-- Location: IOIBUF_X117_Y33_N8
\SW[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(5),
	o => \SW[5]~input_o\);

-- Location: IOIBUF_X117_Y48_N1
\SW[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(6),
	o => \SW[6]~input_o\);

-- Location: IOIBUF_X117_Y51_N1
\SW[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(7),
	o => \SW[7]~input_o\);

-- Location: IOIBUF_X117_Y51_N8
\SW[8]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(8),
	o => \SW[8]~input_o\);

-- Location: LCCOMB_X116_Y43_N0
\COMP_FULL_ADDER_4|SUM[0]\ : cycloneiv_lcell_comb
-- Equation(s):
-- \COMP_FULL_ADDER_4|SUM\(0) = \SW[0]~input_o\ $ (\SW[8]~input_o\ $ (\SW[4]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \SW[8]~input_o\,
	datac => \SW[4]~input_o\,
	combout => \COMP_FULL_ADDER_4|SUM\(0));

-- Location: LCCOMB_X116_Y43_N26
\COMP_FULL_ADDER_4|C[1]~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \COMP_FULL_ADDER_4|C[1]~2_combout\ = (\SW[0]~input_o\ & ((\SW[8]~input_o\) # (\SW[4]~input_o\))) # (!\SW[0]~input_o\ & (\SW[8]~input_o\ & \SW[4]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \SW[8]~input_o\,
	datac => \SW[4]~input_o\,
	combout => \COMP_FULL_ADDER_4|C[1]~2_combout\);

-- Location: LCCOMB_X116_Y43_N12
\COMP_FULL_ADDER_4|SUM[1]\ : cycloneiv_lcell_comb
-- Equation(s):
-- \COMP_FULL_ADDER_4|SUM\(1) = \SW[5]~input_o\ $ (\COMP_FULL_ADDER_4|C[1]~2_combout\ $ (\SW[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SW[5]~input_o\,
	datac => \COMP_FULL_ADDER_4|C[1]~2_combout\,
	datad => \SW[1]~input_o\,
	combout => \COMP_FULL_ADDER_4|SUM\(1));

-- Location: LCCOMB_X116_Y43_N22
\COMP_FULL_ADDER_4|C~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \COMP_FULL_ADDER_4|C~3_combout\ = \SW[6]~input_o\ $ (\SW[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[6]~input_o\,
	datac => \SW[2]~input_o\,
	combout => \COMP_FULL_ADDER_4|C~3_combout\);

-- Location: LCCOMB_X116_Y43_N8
\COMP_FULL_ADDER_4|SUM[2]\ : cycloneiv_lcell_comb
-- Equation(s):
-- \COMP_FULL_ADDER_4|SUM\(2) = \COMP_FULL_ADDER_4|C~3_combout\ $ (((\COMP_FULL_ADDER_4|C[1]~2_combout\ & ((\SW[5]~input_o\) # (\SW[1]~input_o\))) # (!\COMP_FULL_ADDER_4|C[1]~2_combout\ & (\SW[5]~input_o\ & \SW[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_FULL_ADDER_4|C[1]~2_combout\,
	datab => \SW[5]~input_o\,
	datac => \COMP_FULL_ADDER_4|C~3_combout\,
	datad => \SW[1]~input_o\,
	combout => \COMP_FULL_ADDER_4|SUM\(2));

-- Location: LCCOMB_X116_Y43_N2
\COMP_FULL_ADDER_4|C[3]~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \COMP_FULL_ADDER_4|C[3]~4_combout\ = (\COMP_FULL_ADDER_4|C~3_combout\ & ((\COMP_FULL_ADDER_4|C[1]~2_combout\ & ((\SW[5]~input_o\) # (\SW[1]~input_o\))) # (!\COMP_FULL_ADDER_4|C[1]~2_combout\ & (\SW[5]~input_o\ & \SW[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \COMP_FULL_ADDER_4|C[1]~2_combout\,
	datab => \SW[5]~input_o\,
	datac => \COMP_FULL_ADDER_4|C~3_combout\,
	datad => \SW[1]~input_o\,
	combout => \COMP_FULL_ADDER_4|C[3]~4_combout\);

-- Location: LCCOMB_X116_Y43_N24
\COMP_FULL_ADDER_4|C[3]~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \COMP_FULL_ADDER_4|C[3]~5_combout\ = (\COMP_FULL_ADDER_4|C[3]~4_combout\) # ((\SW[6]~input_o\ & \SW[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[6]~input_o\,
	datab => \COMP_FULL_ADDER_4|C[3]~4_combout\,
	datac => \SW[2]~input_o\,
	combout => \COMP_FULL_ADDER_4|C[3]~5_combout\);

-- Location: LCCOMB_X116_Y43_N4
\COMP_FULL_ADDER_4|SUM[3]\ : cycloneiv_lcell_comb
-- Equation(s):
-- \COMP_FULL_ADDER_4|SUM\(3) = \COMP_FULL_ADDER_4|C[3]~5_combout\ $ (\SW[3]~input_o\ $ (\SW[7]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \COMP_FULL_ADDER_4|C[3]~5_combout\,
	datac => \SW[3]~input_o\,
	datad => \SW[7]~input_o\,
	combout => \COMP_FULL_ADDER_4|SUM\(3));

-- Location: LCCOMB_X116_Y43_N6
\COMP_FULL_ADDER_4|COUT~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \COMP_FULL_ADDER_4|COUT~0_combout\ = (\COMP_FULL_ADDER_4|C[3]~5_combout\ & ((\SW[3]~input_o\) # (\SW[7]~input_o\))) # (!\COMP_FULL_ADDER_4|C[3]~5_combout\ & (\SW[3]~input_o\ & \SW[7]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \COMP_FULL_ADDER_4|C[3]~5_combout\,
	datac => \SW[3]~input_o\,
	datad => \SW[7]~input_o\,
	combout => \COMP_FULL_ADDER_4|COUT~0_combout\);

ww_LEDR(0) <= \LEDR[0]~output_o\;

ww_LEDR(1) <= \LEDR[1]~output_o\;

ww_LEDR(2) <= \LEDR[2]~output_o\;

ww_LEDR(3) <= \LEDR[3]~output_o\;

ww_LEDR(4) <= \LEDR[4]~output_o\;

ww_LEDR(5) <= \LEDR[5]~output_o\;

ww_LEDR(6) <= \LEDR[6]~output_o\;

ww_LEDR(7) <= \LEDR[7]~output_o\;

ww_LEDG(0) <= \LEDG[0]~output_o\;

ww_LEDG(1) <= \LEDG[1]~output_o\;

ww_LEDG(2) <= \LEDG[2]~output_o\;

ww_LEDG(3) <= \LEDG[3]~output_o\;

ww_LEDG(4) <= \LEDG[4]~output_o\;
END structure;


