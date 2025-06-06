----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Remon Ehab - Ibrahim amin - Ibrahim mousa - Hazem mohamed - adham ashraf - Basel Ahmed
-- 
-- Create Date:    13:30:40 12/19/2024
-- Design Name: 
-- Module Name:    ID_REG - Behavioral 
-- Project Name: Pipeline processor 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity F_ID_REG is
    Port ( INSTRUCT : in  STD_LOGIC_VECTOR (31 downto 0);
           PC : in  STD_LOGIC_VECTOR (31 downto 0);
           BRANCH : in  STD_LOGIC_VECTOR (31 downto 0);
			  INSTRUCT_OUT : out  STD_LOGIC_VECTOR (31 downto 0);
			  PC_OUT : out  STD_LOGIC_VECTOR (31 downto 0);
           CLK : in  STD_LOGIC;
           STALL : in  STD_LOGIC;
           FLUSH : in  STD_LOGIC
           
           );
end F_ID_REG;

architecture Behavioral of F_ID_REG is

signal INSTRUCT_TEMP :  STD_LOGIC_vector(31 downto 0):=x"00000000";
signal c: std_logic:='0';  -- to see it in testbench 
signal PC_TEMP :  STD_LOGIC_vector(31 downto 0):=x"00000000";
begin

process (CLK , FLUSH) 
begin
if(CLK'event and CLK = '1')then
	if(STALL ='1')then    -- if 0 prevent from update hazard unit control it 
		INSTRUCT_TEMP <=INSTRUCT;
		 PC_TEMP<= PC;
	end if;
	
elsif FLUSH='0' then   -- signal intialized with 1 if i change it to 1 it will be like assuming that branch is always taken and jump to it 
		c<='1';
		INSTRUCT_TEMP <= x"00000000";
		PC_TEMP <= branch;

end if;
end process;
INSTRUCT_OUT <= INSTRUCT_TEMP;
PC_OUT <= PC_TEMP;
end Behavioral;


