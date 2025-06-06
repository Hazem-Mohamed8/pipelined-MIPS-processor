----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Remon Ehab - Ibrahim amin - Ibrahim mousa - Hazem mohamed - adham ashraf - Basel Ahmed
-- 
-- Create Date:    15:56:11 12/19/2024
-- Design Name: 
-- Module Name:    WB - Behavioral 
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

entity WB is
    Port ( MEM_WB_IN : in  STD_LOGIC_VECTOR (70 downto 0);  --- 2 WB   32 ALU  32DATA MEM  5 MUX RT/RS
           MEM_WB_OUT : out  STD_LOGIC_VECTOR (70 downto 0);
           CLK : in  STD_LOGIC);
end WB;

architecture Behavioral of WB is

Signal TEMP : std_logic_vector(70 downto 0):=(others => '0');

begin

MEM_WB_OUT <= TEMP;

process (CLK)
begin 
if(CLK'event and CLK = '1')then
	TEMP<= MEM_WB_IN;
end if;

end process;

end Behavioral;
