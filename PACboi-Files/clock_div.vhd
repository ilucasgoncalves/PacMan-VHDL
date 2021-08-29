library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
entity CLock_div is
	port(CHECKER: in std_logic_vector(2 downto 0); CLOCK: in std_logic;
		OUTCLCK: out std_logic);
end CLock_div;
-- Time to make the counter to time
-- Time for some fun, need to make the clock changer, to do this we make a MUX to select different inputs we have
-- 8 different clocks, so we will use a 4 to 1 MUX with one input always low.
-- Based off what input is selected, we will pick how we divide the DE2 boards clock out.
-- 0 ("000") will select 5kHz
-- 1 ("001") will select 1kHz
-- 2 ("010") will select 100Hz
-- 3 ("011") will select 50Hz
-- 4 ("100") will select 10Hz
-- 5 ("101") will select 5Hz
-- 6 ("110") will select 2Hz
-- 7 ("111") will select 1Hz
architecture CLOCKd of CLock_div is
	signal SUCKER: integer :=0;
	signal POPSICLE: integer;
	signal LOLIPOP: std_logic := '0';
	begin
		process(CLOCK)
			begin
				if (CLOCK'event and CLOCK = '1') then SUCKER <= SUCKER+1;
					--10 Hz
					if CHECKER = "000" then 
						if SUCKER >= 2500000 then LOLIPOP <= not LOLIPOP; SUCKER <= 0;
						end if;
					end if;
					--9 Hz
					if CHECKER = "001" then
						if SUCKER >= 2700000 then LOLIPOP <= not LOLIPOP; SUCKER <= 0;
						end if;
					end if;
					--8 Hz
					if CHECKER = "010" then
						if SUCKER >= 3000000 then LOLIPOP <= not LOLIPOP; SUCKER <= 0;
						end if;
					end if;
					--7 Hz
					if CHECKER = "011" then
						if SUCKER >= 3500000 then LOLIPOP <= not LOLIPOP; SUCKER <= 0;
						end if;
					end if;
					--6 Hz
					if CHECKER = "100" then
						if SUCKER >= 4000000 then LOLIPOP <= not LOLIPOP; SUCKER <= 0;
						end if;
					end if;
					--5 Hz
					if CHECKER = "101" then
						if SUCKER >= 5000000 then LOLIPOP <= not LOLIPOP; SUCKER <= 0;
						end if;
					end if;
					--2 Hz
					if CHECKER = "110" then
						if SUCKER >= 12500000 then LOLIPOP <= not LOLIPOP; SUCKER <= 0;
						end if;
					end if;
					--1 Hz
					if CHECKER = "111" then
						if SUCKER >= 25000000 then LOLIPOP <= not LOLIPOP; SUCKER <= 0;
						end if;
					end if;
				end if;
			OUTCLCK <= LOLIPOP;
		end process;
end CLOCKd;