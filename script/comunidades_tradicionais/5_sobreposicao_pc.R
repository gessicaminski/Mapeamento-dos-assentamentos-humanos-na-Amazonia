setwd("C:/Users/gessi/tabelas/comunidades_tradicionais") #diretório que eu quero uilizar
pos <- read.csv("tabela_0_1_com_trad.csv", sep = ",", dec = ".") 
pos <- subset(pos, select = - c(1:3))
pos <- subset(pos, select = - c(1:5))
pos<-pos %>% drop_na()

colnames(pos) <- c( "uf","th","tnh","td","tr","ti","u",
                    "as","q","pi","us","sd","ou","mi","mf","p","m","g")



                       pos$d <- NA
                       for(i in 1:nrow(pos)){
                         string <- c()
                         
                         for(j in 1:(ncol(pos)-1)){
                           
                           if(pos[i,j] == 1){
                             
                             string <- paste0(string,colnames(pos)[j])
                             
                             
                           }
                           
                           
                         }
                         if(is.null(string)){
                           pos$d[i] <- NA
                         }else{
                           pos$d[i] <- string  
                           
                         }
                         
                       }
                       
                       
      sort(unique(pos$d))
     
      data1<- data.frame (pos)

     ##somar quantas vezes aparece cada sigla 
        library(plyr)
       pos <- join(pos, ddply(pos, .(d), 'nrow'))
                       
                       
     ##reover as linhas que tem info iguais 
       library(dplyr)
       pos2<- pos %>% distinct(d, .keep_all= TRUE)
                       
                       
  data<- data.frame(c(pos2$d), 
   c(pos2$nrow))
    sum(data$c.pos2.nrow.)
                       
 data$porc<- (data$c.pos2.nrow.)/(sum(data$c.pos2.nrow.))*100
 sum(data$porc2)
                       
data$porc3<-round(data$porc, 2)
data$porc0<-round(data$porc, 0)

write.csv(data,'sobreposição_sigla_ct.csv')

write.csv(sar2,'sobreposição_sigla_tudo_ct.csv') ##tabela inteira 
                                      
 #excluir linhas 
 data2<-data[!(data$X.== 0),]
       
 
  
                    ## por estados - exemplo tocantins ai muda o estado e faz para todos

                       ac<-pos2[pos2$SIGLA_UF =="TO",]
                       
                       ac1<-pos[pos$SIGLA_UF =="TO",]
                       ac2 <- join(ac1, ddply(ac1, .(d), 'nrow'))
                       
                       ##reover as linhas que tem info iguais 
                       ac2<- ac2 %>% distinct(d, .keep_all= TRUE)
                       
                       sum(ac2$nrow)
                       
                       data5<- data.frame(c(ac2$d), 
                                          c(ac2$nrow))
                       
                       sum(data5$c.ac2.nrow.)
                       
                       data5$porc<- (data5$c.ac2.nrow.)/(sum(data5$c.ac2.nrow.))*100
                       sum(data5$porc)
                       
                       data5$porc2<-round(data5$porc, 2)
                       data5$porc0<-round(data5$porc, 0)
                       
                      setwd("C:/Users/gessi/tabelas/comunidades_tradicionais/sobreposicao_ct")
                       write.csv(data5,'sobreposição_pc_to.csv')
                       
                       
                       
                      
                       