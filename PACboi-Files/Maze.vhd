LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY Maze IS
 PORT ( Pixel_row: IN std_logic_vector(9 downto 0);
		   Pixel_col: IN std_logic_vector (9 downto 0);			
		  enableMsg : IN bit;
	      Char_address: OUT std_logic_vector (13 downto 0);
	     	 Font_row: OUT std_logic_vector (3 downto 0);
		    Font_col: OUT std_logic_vector (3 downto 0)
	   );
END Maze;

ARCHITECTURE themap OF Maze IS
SIGNAL Flag : std_logic :='0';
BEGIN
PROCESS (Pixel_Row,Pixel_col)
BEGIN 
IF (enableMsg = '1') THEN
 IF Pixel_Col >= 208 AND Pixel_Col <= 454 AND Pixel_row >= 40 AND Pixel_row <= 45  THEN 
	Font_row <= Pixel_row(3 downto 0);
	Font_col <= Pixel_col(3 downto 0);

	IF Pixel_col >= 208 AND Pixel_Col <= 223 THEN
		Char_address <= CONV_STD_LOGIC_VECTOR (29,14); --Display "the pacman"
	--ELSIF Pixel_col >= 224 AND Pixel_Col <= 239 THEN
		--Char_address <= CONV_STD_LOGIC_VECTOR (27,14); --Display "P"
	--ELSIF Pixel_col >= 240 AND Pixel_Col <= 255 THEN
		--Char_address <= CONV_STD_LOGIC_VECTOR (23,14); --Display "A"
	--ELSIF Pixel_col >= 256 AND Pixel_Col <= 271 THEN
		--Char_address <= CONV_STD_LOGIC_VECTOR (25,14); --Display "C"
	--ELSIF Pixel_col >= 272 AND Pixel_Col <= 287 THEN
		--Char_address <= CONV_STD_LOGIC_VECTOR (24,14); --Display "B"
	--ELSIF Pixel_col >= 288 AND Pixel_Col <= 303 THEN
		--Char_address <= CONV_STD_LOGIC_VECTOR (26,14); --Display "O"
	--ELSIF Pixel_col >= 304 AND Pixel_Col <= 319 THEN
		--Char_address <= CONV_STD_LOGIC_VECTOR (28,14); --Display "i"
	--ELSIF Pixel_col >= 320 AND Pixel_Col <= 335 THEN
		--Char_address <= CONV_STD_LOGIC_VECTOR (28,14); --Display "i"
	--ELSIF Pixel_col >= 336 AND Pixel_Col <= 351 THEN
		--Char_address <= CONV_STD_LOGIC_VECTOR (0,14); --Display " the ghost"	
	--ELSE
		--Char_address <= CONV_STD_LOGIC_VECTOR (30,14); --Display " HORIZONTAL LINE "
	END IF;
 END IF;
 END IF;
END PROCESS;
END;