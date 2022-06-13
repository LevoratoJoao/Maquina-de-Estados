# Maquina-de-Estados 
Maquina de estados ---------> Projeto desenvolvido por ArthurPetroli, JoãoVitorLevorato, YagorMattos e AlexandreAparecida para faculdade na matéria Circuito Digital.

   A maquina (Placa DE10-Lite) se inicia zerada, para inserir as moedas é necessário levantar os "Push-buttons" da direita para esquerda, os 3 primeiros da direita representam 25 centavos, em sequência os próximos 3 representam 50 centavos e em sequência os últimos 3 representam 1 real.
   O produto poderá ser comprado se seu valor estiver inserido na maquina (este valor aparecerá no display),  quando estiver com o valor do produto que o usuário desejar, apenas será preciso escolher o produto através dos botões presentes ao lado da maquina (Placa DE10-Lite) , após escolher basta levantar o último "Push-button" (presente no maximo a esquerda dos "Push-buttons") assim, ele subtrai-rá o valor do produto no valor total adicionado, com isso o cliente comprará seu produto e no display será mostrado o valor que a máquina precisa voltar para o cliente (troco).

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
Neste código foi projetada uma máquina de vendas, que permite a compra de água R$1,50, refrigerante R$3,00, salgadinho R$3,50 e chocolate R$3,75 , que recebe moedas de R$0.25, R$0.50 e R$1,00.

    MOEDAS(9 DOWNTO 0) : variável vetor moeda :

    moeda 0,25 ”_1,_2,_3”: atribuído para os pinos SW0 PIN C10 ,SW1 PIN C11, SW2 PIN_D12.

    moeda 0,50 ”_1,_2,_3”: atribuído para os pinos SW3 PIN_C12, SW4 PIN_A12, SW5 PIN_B12.

    moeda 1,00 ”_1,_2,_3”: atribuído para os pinos SW6 PIN_A13, SW7 PIN_A14, SW8 PIN_B14.

ESCOLHA(01,02,03,04) : variável vetor escolha responsável por permitir a escolha do produtos ÁGUA, REFRIGERANTE, SALGADINHO, CHOCOLATE atribuído ao botoes

    opcao1 : atribuído ao botão PIN_B8

    opcao2 : atribuído ao botão PIN_A7.

TROCO (dinheiro_total - gasto total) : pino SW9 PIN_F15 que ao ser ativado faz a verificação de se a soma total das moedas é maior ou igual ao preço do produto, se for a soma recebe seu valor menos o valor dos produtos.

    DISPLAY : variáveis display4, display3, display2, display1 que mostram os valores na placa:

    Display4 : Aparece a letra do item que é possível comprar.

    Display3 : Aparece a centena no Display.

    Display2 : Aparece a dezena no Display.

    Display1 : Aparece a unidade no Display.

PREÇO (01,02,03,04) : quantidade total do produto escolhido:
