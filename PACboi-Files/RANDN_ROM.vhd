--Random Number mif file read
library IEEE;
use  IEEE.STD_LOGIC_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

LIBRARY altera_mf;
USE altera_mf.all;

ENTITY RANDN_ROM IS
	PORT( clk 				: IN 	STD_LOGIC;
			character_address	: IN	STD_LOGIC_VECTOR (8 DOWNTO 0);
			rom_mux_output	: OUT	STD_LOGIC_VECTOR(10 DOWNTO 0));
END RANDN_ROM;

ARCHITECTURE a OF RANDN_ROM IS
	SIGNAL	rom_data: STD_LOGIC_VECTOR(10 DOWNTO 0);
	SIGNAL	rom_address: STD_LOGIC_VECTOR(8 DOWNTO 0);

	COMPONENT altsyncram
	GENERIC (
		address_aclr_a		: STRING;
		init_file		: STRING;
		intended_device_family		: STRING;
		lpm_hint		: STRING;
		lpm_type		: STRING;
		numwords_a		: NATURAL;
		operation_mode		: STRING;
		outdata_aclr_a		: STRING;
		outdata_reg_a		: STRING;
		widthad_a		: NATURAL;
		width_a		: NATURAL;
		width_byteena_a		: NATURAL
	);
	PORT (
			clock0	: IN STD_LOGIC ;
			address_a	: IN STD_LOGIC_VECTOR (8 DOWNTO 0);
			q_a	: OUT STD_LOGIC_VECTOR (10 DOWNTO 0)
	);
	END COMPONENT;
	
BEGIN
-- Small 8 by 8 Character Generator ROM for Video Display
-- Each character is 8 8-bits words of pixel data

	altsyncram_component : altsyncram
	GENERIC MAP (
		address_aclr_a => "NONE",
		init_file => "randnnn.MIF",
		intended_device_family => "Cyclone",
		lpm_hint => "ENABLE_RUNTIME_MOD=NO",
		lpm_type => "altsyncram",
		numwords_a => 256,
		operation_mode => "ROM",
		outdata_aclr_a => "NONE",
		outdata_reg_a => "UNREGISTERED",
		widthad_a => 9,
		width_a => 8,
		width_byteena_a => 1
	)
	PORT MAP ( clock0 => clk, address_a => rom_address, q_a => rom_data );


rom_address <= character_address;
-- Mux to pick off correct rom data bit from 8-bit word
-- for on screen character generation
rom_mux_output <= rom_data;

END a;