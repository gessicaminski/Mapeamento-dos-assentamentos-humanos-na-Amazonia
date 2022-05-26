setwd("C:/Users/gessi/tabelas/sitios_arqueologicos") 
sar <- read.csv("tabela_0_1_sitios_arq.csv", sep = ",", dec = ".") 

#somou as linhas 
sar$aux<- rowSums(sar[10:26])
sc<-sar[sar$aux ==0,] #263694


write.csv(sc,'sitios_arq_semclassificacao.csv')
