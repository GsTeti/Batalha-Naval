Algoritmo "Batalha Naval"
// Disciplina   : [Linguagem e Lógica de Programação] 
// Professor   : Antonio Carlos Nicolodi 

Var

a:inteiro
b:inteiro
j:Inteiro
i:inteiro

adm:inteiro
run:inteiro
menu:inteiro
vazio:caractere
bomba:inteiro
barco:inteiro
numero_barcos_maquina:inteiro
numero_barcos_jogador:inteiro
numero_barcos:inteiro
validacao_bomba:inteiro
pontos_maquina:inteiro
pontos_jogador:inteiro

mapa_barco_maquina:vetor[1..9,1..9] de caractere
mapa_barco_jogador:vetor[1..9,1..9] de caractere
mapa_bomba_maquina:vetor[1..9,1..9] de caractere
mapa_bomba_jogador:vetor[1..9,1..9] de caractere

posicoes_validas:vetor[1..81,1..2] de inteiro
posicao:inteiro

entrada_bomba:vetor[1..2] de inteiro
entrada_barco:vetor[1..2] de inteiro

funcao_adm:caractere
mvsm:caractere
mostre_tudo:caractere
//------------------------------------------------------------
Inicio
   numero_barcos_maquina <- 0
   numero_barcos_jogador <- 0
   validacao_bomba <-1
   numero_barcos <- 2
   mostre_tudo <- "O"
   mvsm <- "O"
   adm <-0
   a<-1


   para i de 1 ate 9 faca
      para j de 1 ate 9 faca

         mapa_barco_maquina [i,j] <- " _"
         mapa_barco_jogador [i,j] <- " _"
         mapa_bomba_maquina [i,j] <- " _"
         mapa_bomba_jogador [i,j] <- " _"

      fimpara
   fimpara
//--------------------------------------------------
//Menu Jogo
   menu <- 1
   Repita
      escreval("                                               ")
escreval("           ____           __         __  __    __")
escreval("          |  __ )       _|  |_      |  ||  |  |  |")
escreval("          |  __  | ___ |_    _|___  |  ||  |__|  | ___")
escreval("          | | _| |/ _  | |  | / _  ||  ||   __   |/ _  |")
escreval("          |_____ |\__,_| |__| \__,_||__||__|  |__|\__,_|")
escreval("                  _   _                      __")
escreval("                 | \ | |       _    _       |  |")
escreval("                 |  \| | ___  \ \  / / ___  |  |")
escreval("                 | |\  |/ _  | \ \/ / / _  ||  |")
escreval("                 |_| \_|\__,_|  \__/  \__,_||__|")
      escreval("")
      se menu = 1 entao
         escreval("")
      senao
         escreval ("Escreva um número válido !")
      fimse
      escreval("       Informe o número de barcos para o jogo (de 1 a 20)")
      leia(numero_barcos)
      limpatela
      se numero_barcos <> 1001101 entao
         se numero_barcos>= 1 entao
            se numero_barcos <= 20 entao
               menu <- 1
            senao
               menu <- 0
            fimse
         senao
            menu<-0
         fimse
      senao
         adm <- 1
      fimse

//-----------------------------------------------------------------
//Menu Adm
      se adm = 1 entao
         menu <- 0
         repita
            escreval("          BATALHA NAVAL")
            escreval("")
            se funcao_adm = "F" entao
               escreval("COMANDO INVÁLIDO!")
            senao
               escreval("Menu do administrador")
            fimse
            escreva("'A' - MÁQUINA VS MÁQUINA ")
            se mvsm = "O" entao
               escreval("(Off)")
            senao
               escreval("(ON)")
            fimse
            escreval("           Substitue o jogador por outra máquina para uma")
            escreval("           demostração dinâmica")
            escreva("'B' - MOSTRE TUDO! ")
            se mostre_tudo = "O" entao
               escreval("(Off)")
            senao
               escreval("(ON)")
            fimse
            escreval("           Mostra todas as matrizes e escolhas da máquina")
            escreval("           e nao aplica nenhum 'limpatela'")
            escreval("'C' - VOLTAR AO MENU")
            leia (funcao_adm)
            escolha funcao_adm
            caso "A"
               se mvsm = "A" entao
                  mvsm <- "O"
               senao
                  mvsm <- "A"
               fimse
            caso "B"
               se mostre_tudo = "B" entao
                  mostre_tudo <- "O"
               senao
                  mostre_tudo <- "B"
               fimse
            caso "C"
               adm <-0
            outrocaso
               funcao_adm <-"F"
               escreval("Comando inválido")
            fimescolha
            limpatela
         ate adm =0
      fimse

   ate menu =1
   limpatela
//----------------------------------------------------------
   posicoes_validas [1,1] <- 1
   posicoes_validas [1,2] <- 1
   para i de 2 ate 81 faca
      para j de 1 ate 2 faca
         se j =1 entao
            se posicoes_validas [(i-1),2] = 9 entao
               posicoes_validas [i,j] <- posicoes_validas [(i-1),j] + 1
            senao
               posicoes_validas [i,j] <- posicoes_validas [(i-1),j]
            fimse
         senao
            se posicoes_validas [i-1,j] < 9 entao
               posicoes_validas [i,j] <- posicoes_validas [i-1,j] + 1
            senao
               posicoes_validas [i,j] <- 1
            fimse
         fimse

         se mostre_tudo = "B" entao
            escreva (posicoes_validas [i,j])
            se j = 2 entao
               escreval("")
            fimse
         fimse
      fimpara
   fimpara
   se mostre_tudo = "B" entao
      leia(vazio)
   fimse
//------------------------------------------------------------------
   enquanto numero_barcos_maquina < numero_barcos faca

      aleatorio on
      aleatorio 1,81
      leia(posicao)
      aleatorio off
      para b de 1 ate 2 faca
         entrada_barco[b]<- posicoes_validas [posicao,b]
         se mostre_tudo = "B" entao
            escreva (entrada_barco[b])
         fimse
      fimpara
      se mostre_tudo = "B" entao
         escreval("")
      senao
         limpatela
      fimse

      numero_barcos_maquina <- 0
      se mostre_tudo = "B" entao
         escreval("   1 2 3 4 5 6 7 8 9")
      fimse
      para i de 1 ate 9 faca
         para j de 1 ate 9 faca
            se j=1 entao
               se mostre_tudo = "B" entao
                  escreva (i)
               fimse
            fimse

            se entrada_barco[1] = i entao
               se entrada_barco[2]= j entao
                  mapa_barco_maquina [i,j] <- " M"
               fimse
            fimse


            se mapa_barco_maquina [i,j] = " M" entao
               numero_barcos_maquina <- numero_barcos_maquina + 1
            fimse
            se mostre_tudo = "B" entao
               escreva(mapa_barco_maquina[i,j])
            fimse
            se j = 9 entao
               se mostre_tudo = "B" entao
                  escreval ("")
               fimse
            fimse
         fimpara
      fimpara
      se mostre_tudo = "B" entao
         leia(vazio)
      fimse
   fimenquanto
   escreval("")

//--------------------------------------------------

   entrada_barco[1] <- 0
   entrada_barco[2] <- 0
   enquanto numero_barcos_jogador < numero_barcos faca

      numero_barcos_jogador <- 0

      escreval("   1 2 3 4 5 6 7 8 9")
      para i de 1 ate 9 faca
         para j de 1 ate 9 faca
            se j=1 entao
               escreva (i)
            fimse

            se entrada_barco[1] = i entao
               se entrada_barco[2]= j entao
                  mapa_barco_jogador [i,j] <- " J"
               fimse
            fimse


            se mapa_barco_jogador [i,j] = " J" entao
               numero_barcos_jogador <- numero_barcos_jogador + 1
            fimse

            escreva(mapa_barco_jogador[i,j])

            se j = 9 entao
               escreval ("")
            fimse
         fimpara
      fimpara

      se mvsm = "A" entao
         aleatorio on
         aleatorio 1,81
         leia(posicao)
         aleatorio off
         para b de 1 ate 2 faca
            entrada_barco[b]<- posicoes_validas [posicao,b]
            se mostre_tudo = "B" entao
               escreva (entrada_barco[b])
            fimse
         fimpara
         se mostre_tudo = "B" entao
            escreval("")
         senao
            limpatela
         fimse
      senao
         se numero_barcos_jogador < numero_barcos entao
            escreval("")
            escreval("Digite a casa onde deseja colocar um barco ")
            escreva("Linha: ")
            leia(entrada_barco[1])
            escreva("Coluna: ")
            leia(entrada_barco[2])
            se mostre_tudo = "B" entao
               escreval("")
            senao
               limpatela
            fimse
         fimse
      fimse
   fimenquanto

//Inicio loop
   run <- 1
   repita
      validacao_bomba <- 1
      entrada_bomba [1]<-1
      entrada_bomba [2]<-1
      repita

         se mostre_tudo = "B" entao
            escreval("")
         senao
            limpatela
         fimse


         pontos_jogador <- numero_barcos
         pontos_maquina <- numero_barcos


         se validacao_bomba = 0 entao
            escreval("Posição inválida, jogue novamente !")
            escreval("")
         senao
            escreval("      Bom jogo")
            escreval("")
         fimse


         escreval("       Jogador                      Máquina")
         escreval("   1 2 3 4 5 6 7 8 9           1 2 3 4 5 6 7 8 9")
         para i de 1 ate 9 faca
            para j de 1 ate 18 faca

               se j=1 entao
                  escreva (i)
               fimse

               se j <= 9 entao
                  se mapa_barco_jogador [i,j] = " J" entao
                     se mapa_bomba_maquina [i,j] = " *" entao
                        escreva (" X")
                     senao
                        escreva (mapa_barco_jogador [i,j])
                     fimse
                  senao
                     escreva (mapa_bomba_maquina [i,j])
                  fimse
               fimse

               se j >9 entao
                  se mapa_barco_maquina [i,a] = " M" entao
                     se mapa_bomba_jogador [i,a] = " *" entao
                        escreva (" X")
                     senao
                        se mostre_tudo = "B" entao
                           escreva (mapa_barco_maquina [i,a])
                        senao
                           escreva (" _")
                        fimse
                     fimse
                  senao
                     escreva (mapa_bomba_jogador [i,a])
                  fimse
                  a <- a +1
               fimse

               se j = 9 entao
                  escreva ("        ",i)
               fimse
               se j=18 entao
                  escreval ("")
                  a<-1
               fimse

            fimpara
         fimpara
         escreval("")

         se mvsm = "A" entao
            timer 300
            escreva ("")
            timer 0
         fimse

         se mvsm = "A" entao
            aleatorio on
            aleatorio 1,81
            leia(posicao)
            aleatorio off
            para b de 1 ate 2 faca
               entrada_bomba[b]<- posicoes_validas [posicao,b]
               se mostre_tudo = "B" entao
                  escreva (entrada_bomba[b])
               fimse
            fimpara
            se mostre_tudo = "B" entao
               escreval("")
            senao
               limpatela
            fimse
         senao

            escreval("")
            escreval("Digite a casa que quer bombardear (coloque -1 para sair)")
            escreva("Linha: ")
            leia(entrada_bomba[1])
            escreva("Coluna: ")
            leia(entrada_bomba[2])
            escreval("")
         fimse


         para i de 1 ate 9 faca
            para j de 1 ate 9 faca


               se entrada_bomba [1] >= 1 entao
                  se entrada_bomba [1]<= 9 entao
                     se entrada_bomba [2] >=1 entao
                        se entrada_bomba [2] <= 9 entao


                           se entrada_bomba[1] = i entao
                              se entrada_bomba[2] =j entao
                                 se mapa_bomba_jogador [i,j] = " *" entao
                                    validacao_bomba <- 0
                                 senao

                                    mapa_bomba_jogador [i,j] <- " *"


                                    validacao_bomba <- 1
                                 fimse
                              fimse
                           fimse

                        senao
                           validacao_bomba <-0
                        fimse
                     senao
                        validacao_bomba <-0
                     fimse
                  senao
                     validacao_bomba <-0
                  fimse
               senao
                  validacao_bomba <-0
               fimse


               se mapa_barco_jogador [i,j] = " J" entao
                  se mapa_bomba_maquina [i,j] = " *" entao
                     pontos_jogador <- pontos_jogador -1
                  fimse
               fimse


               se mapa_barco_maquina [i,j] = " M" entao
                  se mapa_bomba_jogador [i,j] = " *" entao
                     pontos_maquina <- pontos_maquina -1
                  fimse
               fimse
            fimpara
         fimpara


         se pontos_maquina = 0 entao
            run <-0
         fimse
         se pontos_jogador = 0 entao
            run <- 0
         fimse


         se entrada_bomba[1]<0 entao
            run <-0
            validacao_bomba <-1
         fimse
         se entrada_bomba[2]<0 entao
            run <-0
            validacao_bomba <-1
         fimse

      ate validacao_bomba = 1
//-----------------------------------------------------------------

//inicia jogada da maquina
      repita

         pontos_jogador <- numero_barcos
         pontos_maquina <- numero_barcos

         aleatorio on
         aleatorio 1,81
         leia(posicao)
         aleatorio off
         para b de 1 ate 2 faca
            entrada_bomba[b]<- posicoes_validas [posicao,b]
            se mostre_tudo = "B" entao
               escreva (entrada_bomba[b])
            fimse
         fimpara
         escreval("")
         se mostre_tudo <> "B" entao
            limpatela
         fimse


         para i de 1 ate 9 faca
            para j de 1 ate 9 faca
               se entrada_bomba[1] = i entao
                  se entrada_bomba[2] =j entao
                     se mapa_bomba_maquina [i,j] = " *" entao
                        validacao_bomba <- 0
                     senao

                        se entrada_bomba[1] = i entao
                           se entrada_bomba[2] =j entao
                              mapa_bomba_maquina [i,j] <- " *"
                           fimse
                        fimse

                        validacao_bomba <- 1
                     fimse
                  fimse
               fimse


               se mapa_barco_jogador [i,j] = " J" entao
                  se mapa_bomba_maquina [i,j] = " *" entao
                     pontos_jogador <- pontos_jogador -1
                  fimse
               fimse


               se mapa_barco_maquina [i,j] = " M" entao
                  se mapa_bomba_jogador [i,j] = " *" entao
                     pontos_maquina <- pontos_maquina -1
                  fimse
               fimse
            fimpara
         fimpara
      ate validacao_bomba = 1
//-----------------------------

      se pontos_maquina = 0 entao
         run <-0
      fimse
      se pontos_jogador = 0 entao
         run <- 0
      fimse

   ate run = 0

   se pontos_maquina = 0 entao
      escreval("     PARABENS! VOCÊ GANHOU!")
      escreval("")
   senao
      escreval("     Sinto muito, não foi dessa vez")
      escreval("")
   fimse

   escreval("       Jogador                       Máquina")
   escreval("   1 2 3 4 5 6 7 8 9           1 2 3 4 5 6 7 8 9")
   para i de 1 ate 9 faca
      para j de 1 ate 18 faca

         se j=1 entao
            escreva (i)
         fimse

         se j <= 9 entao

            se mapa_barco_jogador [i,j] = " J" entao
               se mapa_bomba_maquina [i,j] = " *" entao
                  escreva (" X")
               senao
                  escreva (" J")
               fimse
            senao
               escreva ("  ")
            fimse
         fimse

         se j >9 entao

            se mapa_barco_maquina [i,a] = " M" entao
               se mapa_bomba_jogador [i,a] = " *" entao
                  escreva (" X")
               senao
                  escreva (" M")
               fimse
            senao
               escreva ("  ")
            fimse
            a <- a +1
         fimse

         se j = 9 entao
            escreva ("        ",i)
         fimse
         se j=18 entao
            escreval ("")
            a<-1
         fimse

      fimpara
   fimpara
   escreval("")


Fimalgoritmo
