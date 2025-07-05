-- Copyright (C) 1991-2014 Altera Corporation
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
-- VERSION "Version 13.1.4 Build 182 03/12/2014 SJ Web Edition"

-- DATE "03/17/2025 20:58:14"

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

ENTITY 	CONV_4_TO_7 IS
    PORT (
	X : IN std_logic_vector(3 DOWNTO 0);
	Y : OUT std_logic_vector(6 DOWNTO 0)
	);
END CONV_4_TO_7;

-- Design Ports Information
-- Y[0]	=>  Location: PIN_AE13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[1]	=>  Location: PIN_AJ6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[2]	=>  Location: PIN_AF12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[3]	=>  Location: PIN_AE12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[4]	=>  Location: PIN_AF13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[5]	=>  Location: PIN_AG9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[6]	=>  Location: PIN_AK6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- X[3]	=>  Location: PIN_AH10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- X[2]	=>  Location: PIN_AK5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- X[1]	=>  Location: PIN_AG10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- X[0]	=>  Location: PIN_AH9,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF CONV_4_TO_7 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_X : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_Y : std_logic_vector(6 DOWNTO 0);
SIGNAL \Y[0]~output_o\ : std_logic;
SIGNAL \Y[1]~output_o\ : std_logic;
SIGNAL \Y[2]~output_o\ : std_logic;
SIGNAL \Y[3]~output_o\ : std_logic;
SIGNAL \Y[4]~output_o\ : std_logic;
SIGNAL \Y[5]~output_o\ : std_logic;
SIGNAL \Y[6]~output_o\ : std_logic;
SIGNAL \X[2]~input_o\ : std_logic;
SIGNAL \X[0]~input_o\ : std_logic;
SIGNAL \X[3]~input_o\ : std_logic;
SIGNAL \X[1]~input_o\ : std_logic;
SIGNAL \Y~0_combout\ : std_logic;
SIGNAL \Y~1_combout\ : std_logic;
SIGNAL \Y~2_combout\ : std_logic;
SIGNAL \Y~3_combout\ : std_logic;
SIGNAL \Y~4_combout\ : std_logic;
SIGNAL \Y~5_combout\ : std_logic;
SIGNAL \Y~6_combout\ : std_logic;
SIGNAL \ALT_INV_Y~6_combout\ : std_logic;

BEGIN

ww_X <= X;
Y <= ww_Y;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_Y~6_combout\ <= NOT \Y~6_combout\;

-- Location: IOOBUF_X28_Y0_N23
\Y[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Y~0_combout\,
	devoe => ww_devoe,
	o => \Y[0]~output_o\);

-- Location: IOOBUF_X24_Y0_N16
\Y[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Y~1_combout\,
	devoe => ww_devoe,
	o => \Y[1]~output_o\);

-- Location: IOOBUF_X26_Y0_N16
\Y[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Y~2_combout\,
	devoe => ww_devoe,
	o => \Y[2]~output_o\);

-- Location: IOOBUF_X26_Y0_N23
\Y[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Y~3_combout\,
	devoe => ww_devoe,
	o => \Y[3]~output_o\);

-- Location: IOOBUF_X28_Y0_N16
\Y[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Y~4_combout\,
	devoe => ww_devoe,
	o => \Y[4]~output_o\);

-- Location: IOOBUF_X26_Y0_N9
\Y[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Y~5_combout\,
	devoe => ww_devoe,
	o => \Y[5]~output_o\);

-- Location: IOOBUF_X24_Y0_N2
\Y[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Y~6_combout\,
	devoe => ww_devoe,
	o => \Y[6]~output_o\);

-- Location: IOIBUF_X24_Y0_N8
\X[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X(2),
	o => \X[2]~input_o\);

-- Location: IOIBUF_X26_Y0_N1
\X[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X(0),
	o => \X[0]~input_o\);

-- Location: IOIBUF_X28_Y0_N1
\X[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X(3),
	o => \X[3]~input_o\);

-- Location: IOIBUF_X28_Y0_N8
\X[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X(1),
	o => \X[1]~input_o\);

-- Location: LCCOMB_X27_Y1_N24
\Y~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Y~0_combout\ = (\X[1]~input_o\ & ((\X[3]~input_o\) # ((\X[2]~input_o\ & \X[0]~input_o\)))) # (!\X[1]~input_o\ & (\X[2]~input_o\ $ (((\X[0]~input_o\ & !\X[3]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \X[2]~input_o\,
	datab => \X[0]~input_o\,
	datac => \X[3]~input_o\,
	datad => \X[1]~input_o\,
	combout => \Y~0_combout\);

-- Location: LCCOMB_X27_Y1_N2
\Y~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Y~1_combout\ = (\X[2]~input_o\ & ((\X[0]~input_o\) # ((\X[3]~input_o\) # (\X[1]~input_o\)))) # (!\X[2]~input_o\ & (((\X[3]~input_o\ & \X[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \X[2]~input_o\,
	datab => \X[0]~input_o\,
	datac => \X[3]~input_o\,
	datad => \X[1]~input_o\,
	combout => \Y~1_combout\);

-- Location: LCCOMB_X27_Y1_N4
\Y~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Y~2_combout\ = (\X[3]~input_o\ & ((\X[2]~input_o\) # ((\X[1]~input_o\)))) # (!\X[3]~input_o\ & (\X[1]~input_o\ & (\X[2]~input_o\ $ (!\X[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \X[2]~input_o\,
	datab => \X[0]~input_o\,
	datac => \X[3]~input_o\,
	datad => \X[1]~input_o\,
	combout => \Y~2_combout\);

-- Location: LCCOMB_X27_Y1_N14
\Y~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Y~3_combout\ = (\X[1]~input_o\ & (((\X[3]~input_o\)))) # (!\X[1]~input_o\ & (\X[2]~input_o\ $ (((\X[0]~input_o\ & !\X[3]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \X[2]~input_o\,
	datab => \X[0]~input_o\,
	datac => \X[3]~input_o\,
	datad => \X[1]~input_o\,
	combout => \Y~3_combout\);

-- Location: LCCOMB_X27_Y1_N8
\Y~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Y~4_combout\ = (\X[2]~input_o\ & (((\X[3]~input_o\) # (!\X[1]~input_o\)))) # (!\X[2]~input_o\ & ((\X[0]~input_o\) # ((\X[3]~input_o\ & \X[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \X[2]~input_o\,
	datab => \X[0]~input_o\,
	datac => \X[3]~input_o\,
	datad => \X[1]~input_o\,
	combout => \Y~4_combout\);

-- Location: LCCOMB_X27_Y1_N18
\Y~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Y~5_combout\ = (\X[2]~input_o\ & (((\X[3]~input_o\)))) # (!\X[2]~input_o\ & ((\X[1]~input_o\) # ((\X[0]~input_o\ & !\X[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \X[2]~input_o\,
	datab => \X[0]~input_o\,
	datac => \X[3]~input_o\,
	datad => \X[1]~input_o\,
	combout => \Y~5_combout\);

-- Location: LCCOMB_X27_Y1_N12
\Y~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Y~6_combout\ = \X[3]~input_o\ $ (((\X[2]~input_o\) # (\X[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \X[2]~input_o\,
	datac => \X[3]~input_o\,
	datad => \X[1]~input_o\,
	combout => \Y~6_combout\);

ww_Y(0) <= \Y[0]~output_o\;

ww_Y(1) <= \Y[1]~output_o\;

ww_Y(2) <= \Y[2]~output_o\;

ww_Y(3) <= \Y[3]~output_o\;

ww_Y(4) <= \Y[4]~output_o\;

ww_Y(5) <= \Y[5]~output_o\;

ww_Y(6) <= \Y[6]~output_o\;
END structure;


