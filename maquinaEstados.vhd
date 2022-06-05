LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
use IEEE.STD_LOGIC_signed.ALL;

ENTITY maquinaEstados IS
	PORT(
		A, B, C, D, E, F, G	:		IN BIT;--Tres primeiros - Moedas, Quatro ultimos - Produto
		R					:		IN BIT;--Reset
		Digito			    :		OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END ENTITY maquinaEstados;

ARCHITECTURE main of maquinaEstados is
	BEGIN
		-- Especificamos as entradas que usaremos no codigo sequencial
		PROCESS(A, B, C, D, E, F, G, R)
			-- Recebera a saida de cada somador
			VARIABLE dinheiro : integer; -- num sei
			-- Recebera o resto de cada somador
			VARIABLE troco : decimal;
		BEGIN
			--case dinheiro is
			--	when A = "1" => dinheiro <= "25" --"11001"
			--	when B = "1" => dinheiro <= "50" --"110010"
			--	when C = "1" => dinheiro <= "100" --"1100100"
			--end case;

			-- Colocando Moeadas
			if A = '1' then
				dinheiro := 25;
			end if ;
			if B = '1' then
				dinheiro := 50;
			end if ;
			if C = '1' then
				dinheiro := 100;
			end if ;

			--Mostrando opcoes disponiveis de acordo com a quantida de dinheiro inserida
			if dinheiro = 1.50 then
				-- ascende led 1 // display AGUA
			end if ;
			if dinheiro = 3.00 then
				-- ascende led 2 // display REFRI
			end if ;
			if dinheiro = 3.50 then
				-- ascende led 3 // display CHOCOLATE
				end if ;
			if dinheiro = 3.75 then
				-- ascende led 4 // display SALGADINHO
			end if ;

			-- Escolhendo produto
			if D = '1' then
				troco := dinheiro - 1.50;
			end if ;
			if E = '1' then
				troco := dinheiro - 3.00;
			end if ;
			if F = '1' then
				troco := dinheiro - 3.50;
			end if ;
			if G = '1' then
				troco := dinheiro - 3.75;
			end if ;

			--R - Reset

			-- Exibimos o input no display de sete segmentos
			--Como dividir o numero no display em tres partes
			CASE dinheiro IS
				WHEN "0000" => Digito <= "1000000"; -- "0"
			 	WHEN "0101" => Digito <= "0010010"; -- "5"
			WHEN OTHERS => NULL;
			END CASE;

			CASE dinheiro IS
				WHEN "0000" => Digito <= "1000000"; -- "0"
				WHEN "0010" => Digito <= "0100100"; -- "2"
			 	WHEN "0101" => Digito <= "0010010"; -- "5"
			 	WHEN "0111" => Digito <= "1111000"; -- "7"
			WHEN OTHERS => NULL;
			END CASE;

			CASE dinheiro IS
				WHEN "0000" => Digito <= "1000000"; -- "0"
				WHEN "0001" => Digito <= "1111001"; -- "1"
				WHEN "0010" => Digito <= "0100100"; -- "2"
				WHEN "0011" => Digito <= "0110000"; -- "3"
				WHEN "0100" => Digito <= "0011001"; -- "4"
				WHEN "0101" => Digito <= "0010010"; -- "5"
				WHEN "0110" => Digito <= "0000010"; -- "6"
				WHEN "0111" => Digito <= "1111000"; -- "7"
				WHEN "1000" => Digito <= "0000000"; -- "8"
				WHEN "1001" => Digito <= "0010000"; -- "9"
				WHEN OTHERS => NULL;
			END CASE;
		END PROCESS;
END ARCHITECTURE;