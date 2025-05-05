#estados 
#um unico diretorio, as tabelas estao todas em uma unica pasta 
setwd(".../comunidades_tradicionais") #diret�rio que eu quero uilizar
pos <- read.csv("tabela_0_1_com_trad.csv", sep = ",", dec = ".") 

#somou as linhas 
pos$aux<- rowSums(pos[10:26])
sum(pos$aux)# 1341564

               ########## COMO FIZ A TABELA sobreposicao##########
#grafico sobreposi��o  tabela sobreposicao_ct.csv
pos$aux<- rowSums(pos[10:26])
a<-pos[pos$aux =="0",]
b<-pos[pos$aux =="1",]
c<-pos[pos$aux =="2",]
d<-pos[pos$aux =="3",]
e<-pos[pos$aux =="4",]
f<-pos[pos$aux =="5",]
g<-pos[pos$aux =="6",]

(693712   *100)/ (1028959)

todos<- data.frame( x=c('0','1','2','3','4', '5','6'),
                    classifica��o=c('0','1','2','3','4', '5','6'), 
                    quantidade = c(263694,363692,261156,108370,29892,2048,107))


todos$porc<- (todos$quantidade *100)/ (1028959)
todos$porc0<- round(todos$porc)
sum(todos$quantidade)
sum(todos$porc)
todos$porc2<-round(todos$porc, 2)
todos$porc0<-round(todos$porc, 0)

write.csv(todos,'sobreposicao_ct.csv')

          ########### TABELA PARA AMAZONIA LEGAL ######
#classific��es total para aml
sum(pos$ti_homologadas )
sum(pos$ti_n_homologadas)
sum(pos$ti_dominais)
sum(pos$ti_reserva_ind)
sum(pos$ti_interdicao)
sum(pos$area_urbanizada)
sum(pos$assentamento)
sum(pos$quilombola)
sum(pos$pi_sbf)
sum(pos$us_sbf)
sum(pos$sd_sbf)
sum(pos$ou_sbf)
sum(pos$militar_sbf)
sum(pos$mf)
sum(pos$p)
sum(pos$m)
sum(pos$g)
sc<-pos[pos$aux ==0,] #263694

#salvo como dados_posc.csv

#tabela dados_posc
##fazer porcentagem 
s <- read.csv("dados_posc.csv", sep = ";", dec = ".")
s$porc<- (s$quantidade /(1028959 )) * 100
s$porc2<-round(s$porc, 2)
s$porc0<-round(s$porc, 0)

#salvar dados gerais pra aml
write.csv(s,'aml_geral_ct.csv')


              ##### COMO FIZ  A TABELA classificacao_estado_ct.csv ########
#para o proximo grafico extrai os dados por estado e fiz a tabela csv
# para fazer a porcentagem  dos estados tambem foi feito em rela��o aao total de COMUNIDADES 
#da tabela inicial

##classifica��es por estados/ fazer de um por um ee anotar no excel
#exemplo ACRE
ac<-pos[pos$UF =="AC",]

#classifica��es
sum(ac$ti_homologadas )
sum(ac$ti_n_homologadas)
sum(ac$ti_interdicao)
sum(ac$ti_dominais)
sum(ac$ti_reserva_ind)
sum(ac$pi_sbf)
sum(ac$us_sbf)
sum(ac$militar_sbf)
sum(ac$ou_sbf)
sum(ac$sd_sbf)
sum(ac$assentamento)
sum(ac$quilombola)
sum(ac$area_urbanizada)
sum(ac$mf)
sum(ac$p)
sum(ac$m)
sum(ac$g)
ac<-ac[ac$aux ==0,] 


#salvar como tabela pos_col_todos

#abrir csv com os sitios arqueologicos
end<- read.csv("enderecos_com_trad.csv", sep = ";", dec = ".") 

#separa por estado 
ac<-end[end$est =="AC",] #fazer por estado e anotar a quantidade de linhas da nota tabela que aparce no painel 3-navegador de espa�o

ac<-end[end$est =="AC",] #TOTAL: 37149
am<-end[end$est =="AM",] #TOTAL: 80415
ap<-end[end$est =="AP",] #TOTAL:8460
ma<-end[end$est =="MA",] #TOTAL:317578
mt<-end[end$est =="MT",] #TOTAL:118534
pa<-end[end$est =="PA",] #TOTAL:280412
rr<-end[end$est =="RR",] #TOTAL:31502
ro<-end[end$est =="RO",] #TOTAL:91289
to<-end[end$est =="TO",] #TOTAL:63620
                         #SOMA: 1.028.959 comunidades

#abrir arquivo
posc <- read.csv("pos_col_todos.csv", sep = ";", dec = ".")
sum(posc$quantidade) #1341564

##porcentagem por estados 

ac<-posc[posc$est =="AC",]
sum(ac$quantidade) #67736
ac$porc<- (ac$quantidade /(37149   )) * 100

ac<-posc[posc$est =="AM",]
sum(ac$quantidade)
ac$porc<- (ac$quantidade /(80415   )) * 100


ac<-posc[posc$est =="AP",]
sum(ac$quantidade)
ac$porc<- (ac$quantidade /(8460  )) * 100

(63620 /1028959) * 100
round( 6.182948, 2)
 
ac<-posc[posc$est =="MA",]
sum(ac$quantidade)
ac$porc<- (ac$quantidade /(317578   )) * 100
ac$porc<-as.character(ac$porc)

ac<-posc[posc$est =="MT",]
sum(ac$quantidade)
ac$porc<- (ac$quantidade /(118534  )) * 100
ac$porc<-as.character(ac$porc)


ac<-posc[posc$est =="PA",]
sum(ac$quantidade)
ac$porc<- (ac$quantidade /(280412)) * 100

ac<-posc[posc$est =="RR",]
sum(ac$quantidade)
ac$porc<- (ac$quantidade /(31502 )) * 100


ac<-posc[posc$est =="RO",]
sum(ac$quantidade)
ac$porc<- (ac$quantidade /(91289)) * 100

ac$porc
ac<-posc[posc$est =="TO",]
sum(ac$quantidade)
ac$porc<- (ac$quantidade /(63620)) * 100
ac$porc

#salvo como: pos_col_todos


setwd("C:/Users/gessi/Downloads/estagio-docs/")
posc <- read.csv("pos_col_todos.csv", sep = ";", dec = ".")
posc$porc2<-round(posc$porc, 2)
posc$porc0<-round(posc$porc, 0)

##acresentar aml 

#fazer a porcentagem
posc$porc2<-round(posc$porc, 2)
posc$porc0<-round(posc$porc, 0)
write.csv(posc,'classificacao_estado_ct.csv')



        
    ##### COMO FIZ  A TABELA DOS DADOS SEM DESTINA��O - semdestinacao_ct.csv ########
#para esta tabela utilizei os dados obtidos a partir da tabela de sobreposi��o com as siglas
#que foi feito no script de sobreposi��o_siglas
#tabela mostrando as sobreposi��es das camadas para a localiza�ao dos sitio

#sobreposicao

sob <- read.csv("sobreposi��o_sigla_ct.csv", sep = ",", dec = ".")

#excluindo coluna 
sob <- subset(sob, select = -c(3:6))


data2 <- sob[sob$sobreposicao %like% "sd", ]        # Extract matching rows with %like%
head(data2)

#salvar nova tabela mostrando as sobreposi��es das camadas para a localiza�ao dos sitios
write.csv(data2,'sem_dest_aml_pos.csv')

#ap�s fazer altera��es no excel salvei como sd_pos2.csv

setwd("C:/Users/gessi/Downloads/estagio-docs/")
dat <- read.csv("sd_pos2.csv", sep = ";", dec = ".")
dat$porc<- (dat$q /(1028959 )) * 100
dat$porc2<-round(dat$porc, 2)
dat$porc0<-round(dat$porc, 0)
dat$c1<-as.character(dat$c1)
Encoding(dat$c1) <- "UTF-8"
write.csv(dat,'semdestinacao_ct.csv')

##### COMO FIZ  A TABELA geral_rural.csv ########
#a partir da tabela de sobreposi��o 
#analisei os dados na tabela de sobreposi��o e fiz no excel
#salvo como geral_rural_pos2.csv

#porcentagem
dat <- read.csv("geral_rural_pos2.csv", sep = ";", dec = ".")
dat$porc<- (dat$q /(1028959 )) * 100
dat$porc2<-round(dat$porc, 2)
dat$porc0<-round(dat$porc, 0)
dat$c1<-as.character(dat$c1)
Encoding(dat$c1) <- "UTF-8"

#salvar
write.csv(dat,'geral_rural_ct.csv')

#para o grafico indigena 2 foi usado o arquivo indigena_pc
sob <- read.csv("sobreposi��o_todo_aml.csv", sep = ",", dec = ".")
#excluindo coluna 
#sob <- subset(sob, select = -c(5:12))

data2 <- sob[sob$d %like% "t", ]        # Extract matching rows with %like%
head(data2)

sum(data2$nrow)
data2$porc<- (data2$q *100)/ (1028959)
data2$porc0<- round(data2$porc)
sum(data2$q)
sum(data2$porc)
data2$porc2<-round(data2$porc, 2)
data2$porc0<-round(data2$porc, 0)

#salvar nova tabela 
write.csv(data2,'indigena_pc.csv')



#para o grafico indigena 2 foi usado o arquivo aml_geral_ct






