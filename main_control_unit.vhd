----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Remon Ehab - Ibrahim amin - Ibrahim mousa - Hazem mohamed - adham ashraf - Basel Ahmed
-- 
-- Create Date:    13:40:29 12/19/2024
-- Design Name: 
-- Module Name:    MAIN_CONTROL_UNIT - Behavioral 
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

entity MAIN_CONTROL_UNIT is
    Port ( OP_CODE : in  STD_LOGIC_VECTOR (5 downto 0);
           BRANCH : out  STD_LOGIC;
           MEM_READ : out  STD_LOGIC;
           MEM_TO_REG : out  STD_LOGIC;
           MEM_WRITE : out  STD_LOGIC;
           ALU_SRC : out  STD_LOGIC;
           REG_WRITE : out  STD_LOGIC;
           REG_DES : out  STD_LOGIC;
           JUMP : out  STD_LOGIC;
           ALU_OP : out  STD_LOGIC_VECTOR (1 downto 0));
end MAIN_CONTROL_UNIT;

architecture Behavioral of MAIN_CONTROL_UNIT is

begin
process(OP_CODE)
begin

if OP_CODE="000000" then       --R/type INSTRUCT OPCODE=0
           JUMP    <='0' ;
            BRANCH   <='0' ;
          MEM_READ  <='0' ;
           MEM_TO_REG <='0' ;
            MEM_WRITE <='0' ;
           ALU_SRC  <='0' ;
           REG_WRITE <='1' ;
           REG_DES  <='1' ;
           ALU_OP   <="10";
			 

elsif OP_CODE="100011" then     --Load  23 HEX
           JUMP     <='0'  ;
           BRANCH   <='0'  ;
           MEM_READ <='1'  ;
           MEM_TO_REG <='1'  ; 
            MEM_WRITE <='0'  ;
           ALU_SRC   <='1'  ;
           REG_WRITE <='1'  ;
           REG_DES  <='0'  ;
           ALU_OP    <="00" ;
			  
			


elsif OP_CODE="101011" then     --Store  2b HEX
           JUMP     <='0'  ;
          BRANCH   <='0'  ; 
          MEM_READ <='0'  ;
           MEM_WRITE <='1'  ;
            ALU_SRC   <='1'  ;
           REG_WRITE <='0'  ;
          ALU_OP   <="00" ;
			  
			 

elsif OP_CODE="000100" then    --beq 4 HEX
           JUMP	<='0'  ;
          BRANCH   <='1'  ;
          MEM_READ <='0'  ;
            MEM_WRITE <='0'  ;
           ALU_SRC   <='0'  ;
           REG_WRITE <='0'  ;
           ALU_OP    <="01" ;
			  
			 
   
elsif OP_CODE="000010" then    --Jump  2 HEX
           JUMP    <='1'  ;
           BRANCH   <='0'  ;
           MEM_READ  <='0'  ;
           MEM_WRITE <='0'  ;
           REG_WRITE <='0'  ;
           ALU_OP    <="11" ;
			 


else
			  JUMP     <='0'  ;
          BRANCH   <='0'  ;
          MEM_READ  <='0'  ;
          MEM_TO_REG<='0'  ; 
            MEM_WRITE <='0'  ;
            ALU_SRC  <='0'  ;
          REG_WRITE <='0'  ;
           REG_DES  <='0'  ;
          ALU_OP  <="00" ;
			 
end if ;
end process ;
end Behavioral;




