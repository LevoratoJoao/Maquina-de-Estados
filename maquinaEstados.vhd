LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
use IEEE.STD_LOGIC_signed.ALL;

ENTITY maquina IS
	PORT(
		A, B, C, D, E, F, G	:		IN BIT;--Tres primeiros - Moedas, Quatro ultimos - Produto
		R					:		IN BIT;--Reset
        Dled, Eled, Fled, Gled		    :		OUT BIT;
		  auxdin			    :		OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		  auxtroco			    :		OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		  troco1			    :		OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		  troco2			    :		OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		  troco3			    :		OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		  diheiro1			    :		OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		  diheiro2			    :		OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		  diheiro3			    :		OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		  Display1			    :		OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
        Display2			    :		OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
        Display3			    :		OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END ENTITY maquina;

ARCHITECTURE main of maquina is
	BEGIN
		-- Especificamos as entradas que usaremos no codigo sequencial
		PROCESS(A, B, C, D, E, F, G, R)
			-- Recebera a saida de cada somador
			VARIABLE dinheiro : integer;
			-- Recebera o resto de cada somador 
			VARIABLE troco : integer;
		BEGIN
			-- Colocando Moeadas
			if A <= '1' then
				dinheiro:=25;
			end if ;
			if B <= '1' then
				dinheiro:=50;
			end if ;
			if C <= '1' then
				dinheiro:=100;
			end if ;
			
			
			

			--Mostrando opcoes disponiveis de acordo com a quantida de dinheiro inserida
			if dinheiro = 150 then
				Dled <= '1';
			end if ;
			if dinheiro = 300 then
				Eled <= '1';
			end if ;
			if dinheiro = 350 then
				Fled <= '1';
				end if ;
			if dinheiro = 375 then
				Gled <= '1';
			end if ;
			
			auxdin <= dinheiro;
			dinheiro1 := to_integer(auxdin / 100);
			auxdin := auxdin - (dinheiro1 * 100);
			dinheiro2 := to_integer(auxdin / 10);
			auxdin := auxdin - (dinheiro2 * 10);
			dinheiro3 := to_integer(auxdin / 1);

			-- Escolhendo produto
			if D = '1' then
				troco := dinheiro - 150;
			end if ;
			if E = '1' then
				troco := dinheiro - 300;
			end if ;
			if F = '1' then
				troco := dinheiro - 350;
			end if ;
			if G = '1' then
				troco := dinheiro - 375;
			end if ;
			
			auxtroco <= troco;
			troco1 := to_integer(auxtroco / 100);
			auxtroco := auxtroco - (torco1 * 100);
			troco2 := to_integer(auxtroco / 10);
			auxtroco := auxtroco - (troco2 * 10);
			troco3 := to_integer(auxtroco / 1);


			--R - Reset

			-- Exibimos o input no display de sete segmentos
			--Como dividir o numero no display em tres partes
			CASE dinheiro1 IS
				WHEN "0000" => Display1 <= "1000000"; -- "0"
			 	WHEN "0101" => Display1 <= "0010010"; -- "5"
			WHEN OTHERS => NULL;
			END CASE;

			CASE dinheiro2 IS
				WHEN "0000" => Display2 <= "1000000"; -- "0"
				WHEN "0010" => Display2 <= "0100100"; -- "2"
			 	WHEN "0101" => Display2 <= "0010010"; -- "5"
			 	WHEN "0111" => Display2 <= "1111000"; -- "7"
			WHEN OTHERS => NULL;
			END CASE;

			CASE dinheiro3 IS
				WHEN "0000" => Display3 <= "1000000"; -- "0"
				WHEN "0001" => Display3 <= "1111001"; -- "1"
				WHEN "0010" => Display3 <= "0100100"; -- "2"
				WHEN "0011" => Display3 <= "0110000"; -- "3"
				WHEN "0100" => Display3 <= "0011001"; -- "4"
				WHEN "0101" => Display3 <= "0010010"; -- "5"
				WHEN "0110" => Display3 <= "0000010"; -- "6"
				WHEN "0111" => Display3 <= "1111000"; -- "7"
				WHEN "1000" => Display3 <= "0000000"; -- "8"
				WHEN "1001" => Display3 <= "0010000"; -- "9"
				WHEN OTHERS => NULL;
			END CASE;
			
			

            CASE troco IS
				WHEN "0000" => Display1 <= "1000000"; -- "0"
			 	WHEN "0101" => Display1 <= "0010010"; -- "5"
			WHEN OTHERS => NULL;
			END CASE;

			CASE troco IS
				WHEN "0000" => Display2 <= "1000000"; -- "0"
				WHEN "0010" => Display2 <= "0100100"; -- "2"
			 	WHEN "0101" => Display2 <= "0010010"; -- "5"
			 	WHEN "0111" => Display2 <= "1111000"; -- "7"
			WHEN OTHERS => NULL;
			END CASE;

			CASE troco IS
				WHEN "0000" => Display3 <= "1000000"; -- "0"
				WHEN "0001" => Display3 <= "1111001"; -- "1"
				WHEN "0010" => Display3 <= "0100100"; -- "2"
				WHEN "0011" => Display3 <= "0110000"; -- "3"
				WHEN "0100" => Display3 <= "0011001"; -- "4"
				WHEN "0101" => Display3 <= "0010010"; -- "5"
				WHEN "0110" => Display3 <= "0000010"; -- "6"
				WHEN "0111" => Display3 <= "1111000"; -- "7"
				WHEN "1000" => Display3 <= "0000000"; -- "8"
				WHEN "1001" => Display3 <= "0010000"; -- "9"
				WHEN OTHERS => NULL;
			END CASE;

		END PROCESS;
END ARCHITECTURE;
