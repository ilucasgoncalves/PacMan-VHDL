library IEEE;
use  IEEE.STD_LOGIC_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity YAKUZA_CONV is
	port( color_bit: in std_logic;
			red_tenbit:out std_logic_vector(9 downto 0);
			blue_tenbit:out std_logic_vector(9 downto 0);
			green_tenbit:out std_logic_vector(9 downto 0));
	
end entity;

architecture ten_bit of YAKUZA_CONV is
	begin
		process(color_bit)
			begin
				if color_bit = '1' then
					red_tenbit <=   "1111111111";
					blue_tenbit <=  "0000000000";
					green_tenbit <= "1111111111";
				else 
					red_tenbit <=   "0000000000";
					blue_tenbit <=  "0000000000";
					green_tenbit <= "0000000000";
					
				end if;
		end process;
end architecture;