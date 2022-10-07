algoritmo "jogodavelha"

var
jog: vetor[1..3,1..3] de caractere
modo,comp,cont, i, j, a, b, fim, resp_num : inteiro
aux, play1, play2, resp: caractere
empate:logico

procedimento interface()

inicio
         escreval ("===================")
         escreval (" JOGO DA VELHA ")
         escreval ("+-----+-----+-----+")
         para i de 1 ate 3 faca
              para j de 1 ate 3 faca
                   escreva ("| ")
                   escreva (jog[i,j] :4)
              fimpara
              escreva ("|")
              escreval ()
              escreval ("+-----+-----+-----+")
         fimpara
fimprocedimento

inicio


//interface
repita
fim<- 0
comp <- 1
cont <- 0
   para i de 1 ate 3 faca
        para j de 1 ate 3 faca
             cont <- cont+1
             jog[i,j] <- NumpCarac(cont)
             fimpara
     fimpara

repita
   escreval("Modos de jogo disponíveis:")
   escreval("1 - Humano X Humano")
   escreval("2 - Humano X Máquina")
   escreval("3 - Sair")
   escreval("O que deseja fazer ?")
   leia (modo)

   se (modo < 1) ou (modo > 3) entao
      escreval()
      escreval("Digite uma opção válida")
      escreval()
   fimse

ate (modo > 0) e (modo < 4)

//MODO JOGADOR X JOGADOR

se (modo = 1) entao

escreval("Nome do Player 1:")
leia(play1)
escreval("Nome do Player 2:")
leia(play2)
limpatela

interface()

//MOTOR DO JOGO

repita
      escreval ()
      escreva ("Escolha uma posição ")
      leia (resp)
      a <- 1
      b <- 1
      enquanto (jog[a,b] <> resp) faca

   se (jog[a,b] <> resp) entao
         b <- b + 1

      se (b > 3) entao
         a <- a + 1
         b <- 1
  fimse
      se (a > 3) entao
         a <- 1

         limpatela

         interface()

         escreval()
         escreva("Jogada inválida, escolha outra: ")
         leia(resp)

     fimse
     fimse
fimenquanto

escolha comp

caso 1
     jog[a,b] <- "X"
caso 2
     jog[a,b] <- "O"
     comp <- 0
fimescolha
     comp <- comp + 1

limpatela

interface ()

//VERIFICADOR DE VITÓRIA
empate <- verdadeiro
para i de 1 ate 3 faca
     se (jog[i,1] = jog[i,2]) e (jog[i,2] = jog[i,3]) entao
        fim <- 1
        se (comp = 2) entao
           escreval (play1," ganhou!")
        senao
             escreval (play2," ganhou!")
        fimse
     fimse
fimpara

para i de 1 ate 3 faca
     se (jog[1,i] = jog[2,i]) e (jog[2,i] = jog[3,i]) e (fim=0) entao
        fim <- 1
        se (comp = 2) entao
           escreval (play1," ganhou!")
        senao
             escreval (play2," ganhou!")
        fimse
     fimse
fimpara

     se (jog[1,1] = jog[2,2]) e (jog[2,2] = jog[3,3]) e (fim=0) entao
        fim <- 1
        se (comp = 2) entao
           escreval (play1," ganhou!")
        senao
             escreval (play2," ganhou!")
        fimse
     fimse
     se (jog[1,3] = jog[2,2]) e (jog[2,2] = jog[3,1]) e (fim=0) entao
        fim <- 1
        se (comp = 2) entao
           escreval (play1," ganhou!")
        senao
             escreval (play2," ganhou!")
        fimse
     fimse

     para i de 1 ate 3 faca
          para j de 1 ate 3 faca
               se ((jog[i,j] <> "X") e (jog[i,j] <> "O")) entao
               empate <- falso
               fimse
          fimpara
     fimpara

     se (fim = 1) entao
        empate <- falso
     fimse

     se (empate = verdadeiro) entao
        escreval("Empate!")
     fimse


ate ((fim = 1) ou (empate = verdadeiro))

escreval ("Fim de Partida")
escreval ("")
fimse

// MODO JOGADOR X MAQUINA

se (modo=2) entao

   limpatela
   interface()

   repita

   //VEZ DO JOGADOR

   escolha (comp)
   caso 1

         escreval ()
         escreva ("Escolha uma posição ")
         leia (resp)
         a <- 1
         b <- 1
         enquanto (jog[a,b] <> resp) faca

         se (jog[a,b] <> resp) entao
            b <- b + 1

            se (b > 3) entao
            a <- a + 1
            b <- 1
         fimse
            se (a > 3) entao
            a <- 1

            limpatela

            interface()

            escreval()
            escreva("Jogada inválida, escolha outra: ")
            leia(resp)

        fimse
        fimse

        fimenquanto

   //VEZ DA MÁQUINA

   caso 2
         escreval ()
         escreva ("Escolha uma posição ")
         aleatorio 1, 9
                  leia (resp_num)
         aleatorio off

         resp<- numpcarac(resp_num)
         a <- 1
         b <- 1
         enquanto (jog[a,b] <> resp) faca

         se (jog[a,b] <> resp) entao
            b <- b + 1

         se (b > 3) entao
            a <- a + 1
            b <- 1
         fimse
         se (a > 3) entao
            a <- 1

            limpatela

            interface()

            escreval()
            aleatorio 1, 9
                leia(resp_num)
            aleatorio off
            resp<- numpcarac(resp_num)

        fimse
        fimse
        fimenquanto

   fimescolha

   escolha comp

   caso 1
        jog[a,b] <- "X"
   caso 2
        jog[a,b] <- "O"
        comp <- 0
   fimescolha
        comp <- comp + 1

   limpatela

   interface ()

   //VERIFICADOR DE VITÓRIA


   empate <- verdadeiro
   para i de 1 ate 3 faca
        se (jog[i,1] = jog[i,2]) e (jog[i,2] = jog[i,3]) e (fim=0) entao
           fim <- 1
           se (comp = 2) entao
              escreval ("Você ganhou!")
           senao
                escreval ("Você perdeu!")
           fimse
        fimse
   fimpara

   para i de 1 ate 3 faca
        se (jog[1,i] = jog[2,i]) e (jog[2,i] = jog[3,i]) e (fim=0) entao
           fim <- 1
           se (comp = 2) entao
              escreval ("Você ganhou!")
           senao
                escreval ("Você perdeu!")
           fimse
        fimse
   fimpara

        se (jog[1,1] = jog[2,2]) e (jog[2,2] = jog[3,3]) e (fim=0) entao
           fim <- 1
           se (comp = 2) entao
              escreval ("Você ganhou!")
           senao
                escreval ("Você perdeu!")
           fimse
        fimse
        se (jog[1,3] = jog[2,2]) e (jog[2,2] = jog[3,1]) e (fim=0) entao
           fim <- 1
           se (comp = 2) entao
              escreval ("Você ganhou!")
           senao
                escreval ("Você perdeu!")
           fimse
        fimse

        para i de 1 ate 3 faca
             para j de 1 ate 3 faca
                  se ((jog[i,j] <> "X") e (jog[i,j] <> "O")) entao
                  empate <- falso
                  fimse
             fimpara
        fimpara

        se (fim = 1) entao
        empate <- falso
        fimse

        se (empate = verdadeiro) entao
           escreval("Empate!")
        fimse



   ate ((fim = 1) ou (empate = verdadeiro))

   escreval ("Fim de Partida")
   escreval ("")
fimse
ate (modo=3)

fimalgoritmo