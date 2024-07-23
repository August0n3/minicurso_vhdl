--fsm.vhd
--Maquina de estados
--Autor: Augusto Camara

--Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.all;

--Entity
ENTITY fsm is
    PORT(
        x,rst,clk : in std_logic;
        y : out std_logic
    ); 
END fsm;

--Architecture
ARCHITECTURE comportamento OF fsm IS
    
    TYPE estado IS (alfa,beta,gamma,delta);
    signal estadoatual, estadoproximo : estado; 
    
    BEGIN

        resgistradordeestado : process (clk,rst)
        begin
            if(rst = '1')then
                estadoatual<= alfa;
            elsif(rising_edge(clk))then
                estadoatual <= estadoproximo;
            end if;

        end process;
        logicacombinacional : process (estadoatual,x)
        begin
            case estadoatual is
                when alfa => 
                    y <= '0';
                    if(x = '1')then
                        estadoproximo <= alfa;
                    else
                        estadoproximo <= beta;
                    end if;
                when beta =>
                    y <= '1';
                    if(x = '1')then
                        estadoproximo <= gamma;
                    else
                        estadoproximo <= beta;
                    end if;
                when gamma =>
                    y  <= '1';
                    estadoproximo <= delta;
                when delta =>
                    y <= '0';
                    estadoproximo <= alfa;
            end case;
        end process;

    END comportamento;
