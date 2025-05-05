setwd("C:/Users/gessi/tabelas/sitios_arqueologicos") 
sar <- read.csv("tabela_0_1_sitios_arq.csv", sep = ",", dec = ".") 

#excluindo coluna 
sar <- subset(sar, select = - 1)
sar <- subset(sar, select = - 1)


## loop na tabela 
## em que ele vai passando por cada linha e onde tem o 1 presente ele pega o nome da coluna e forma uma sigla no final em uma nova coluna
## assim se na linha tem varios 1 vai ter uma sigla com o nome de varias colunas

sar$d <- NA
 for(i in 1:nrow(sar)){
   string <- c()
   
   for(j in 1:(ncol(sar)-1)){
     
     if(sar[i,j] == 1){
       
       string <- paste0(string,colnames(sar)[j])
       
       
     }
     
     
   }
   if(is.null(string)){
     sar$d[i] <- NA
   }else{
     sar$d[i] <- string  
     
   }
   
 }
 
 
#sort(unique(sar$d))
 
##somar quantas vezes aparece cada sigla 
library(plyr)
sar <- join(sar, ddply(sar, .(d), 'nrow'))
 

##reover as linhas que tem informações iguais 
library(dplyr)
sar2<- sar %>% distinct(d, .keep_all= TRUE)


data<- data.frame(c(sar2$d), 
        c(sar2$nrow))

sum(data$c.sar2.nrow.)

#porcentagem
data$porc<- (data$c.sar2.nrow.)/(sum(data$c.sar2.nrow.))*100
sum(data$porc2)

data$porc3<-round(data$porc2, 2)
data$porc0<-round(data$porc, 0)

#salvar nova tabela mostrando as sobreposições das camadas para a localizaçao dos sitios
write.csv(data,'sobreposicao_sigla_sa.csv')

#salvar os dados com todas as informações
write.csv(sar,'sobreposição_sigla_tudo_sa.csv')

#por estado/ fiz de um por um e salvei o csv de cada  
ac1<-sar2[sar2$SIGLA_UF =="AC",]

ac2 <- join(ac1, ddply(ac1, .(d), 'nrow'))

##remover as linhas que tem info iguais 
ac2<- ac2 %>% distinct(d, .keep_all= TRUE)

sum(ac2$nrow)

data5<- data.frame(c(ac2$d), 
                  c(ac2$nrow))

sum(data5$c.ac2.nrow.)

#porcentagem
data5$porc<- (data5$c.ac2.nrow.)/(sum(data5$c.ac2.nrow.))*100
sum(data5$porc)

data5$porc2<-round(data5$porc, 2)
data5$porc0<-round(data5$porc, 0)

#salvar csv
setwd("C:/Users/gessi/tabelas/sitios_arqueologicos/sobreposicao_sa") 
write.csv(data5,'sobreposicao_ac.csv')





