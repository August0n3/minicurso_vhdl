--fsm.vhd
--Maquina de estados
--Autor: Augusto Camara

--Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

--Entity
ENTITY fsmd is
    PORT(
        x,rst,clk : in std_logic;
        value : in std_logic_vector(7 downto 0);
        tot : out std_logic_vector(7 downto 0)
    ); 
END fsmd;

--Architecture
ARCHITECTURE comportamento OF fsmd IS
    
    TYPE estado IS (inicio,esperar,somar,esperar2);
    signal estadoatual, estadoproximo : estado; 
    signal tot_reg : std_logic_vector (7 downto 0);
    
    BEGIN

        resgistradordeestado : process (clk,rst)
        begin
            if(rst = '1')then
                estadoatual<= inicio;
            elsif(rising_edge(clk))then
                estadoatual <= estadoproximo;
            end if;

        end process;
        logicacombinacional : process (estadoatual,x,value)
        begin
            case estadoatual is
                when inicio =>
                    tot_reg <= (others => '0');

                    estadoproximo <= esperar;
                when esperar =>
                    if(x='0')then
                        estadoproximo <=somar;
                    else
                        estadoproximo <= esperar;
                    end if;
                when somar =>
                    tot_reg <= STD_LOGIC_VECTOR(UNSIGNED(tot_reg) + UNSIGNED(value));
                    estadoproximo <= esperar2;
                when esperar2 =>                
                  if(x='0')then
                        estadoproximo <=esperar2;
                    else
                        estadoproximo <= esperar;
                    end if;
            end case;
        end process;
        tot <= tot_reg;
    END comportamento;
