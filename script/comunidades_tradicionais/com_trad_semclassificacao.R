setwd("C:/Users/gessi/tabelas/comunidades_tradicionais") #diretório que eu quero uilizar
pos <- read.csv("tabela_0_1_com_trad.csv", sep = ",", dec = ".") 

#somou as linhas 
pos$aux<- rowSums(pos[10:26])
sc<-pos[pos$aux ==0,] #263694


write.csv(sc,'com_trad_semclassificacao.csv')