--reg4b.vhd
--registrador de 4 bits em vhdl 
--Autor: Augusto Camara

--Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;

--Entity
ENTITY reg4b is
    PORT(
        rst,en,clk : in std_logic;
        d : in STD_LOGIC_VECTOR(3 DOWNTO 0);
        q : out STD_LOGIC_VECTOR(3 DOWNTO 0)     
    ); 
END reg4b;

--Architecture
ARCHITECTURE comportamento OF reg4b IS
    BEGIN
        process (clk,rst)
        BEGIN
        if (rst = '1') then
            q <= "0000";
        elsif(rising_edge(clk)) then 
            if (en = '1') then
                q<=d;
            end if;
        end if;
        end process;
END comportamento;
