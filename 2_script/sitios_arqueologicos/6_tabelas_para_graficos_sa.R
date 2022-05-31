##usei somente um diretório-coloquei as tabelas todas na mesma pasta
##abrir tabela de 0 e 1 dos sitios
setwd("C:/Users/gessi/tabelas/sitios_arqueologicos") 
sar <- read.csv("tabela_0_1_sitios_arq.csv", sep = ",", dec = ".") 

#excluindo coluna 
sar <- subset(sar, select = - 1)
sar <- subset(sar, select = - 1)

#somar a quantidade de  sitios por linha    
sar$aux<- rowSums(sar[7:23])

#arranjar do menor para maior 
sar<-arrange(sar,aux)

                      ########## COMO FIZ A TABELA sobreposicao_sa.csv ##########
#quantidade de linhas que somando dava 0, 1....
sar0<-sar[sar$aux =="0",]  #1910
sar1<-sar[sar$aux =="1",]  #2806
sar2<-sar[sar$aux =="2",]  #1123
sar3<-sar[sar$aux =="3",]  #669
sar4<-sar[sar$aux =="4",]  #197
sar5<-sar[sar$aux =="5",]  #20
sar6<-sar[sar$aux =="6",]  #0


#dataframe de quantidade de sitios em cada cobertura do solo
todos<- data.frame( x=c('0','1','2','3','4', '5'),
                    classificação=c('0','1','2','3','4', '5'), 
                    quantidade = c(1910,2806,1123,669,197,20))

# fazer a porcentagem em relação ao total
#obs*: foi feito em relação ao total de sitios estudados 6725
#e não com a soma deles, por que houve sobreposição então o total ultrapassa os 6725 sitios
todos$porc<- (todos$quantidade *100)/ (6725)
sum(todos$quantidade)
sum(todos$porc)
todos$porc2<-round(todos$porc, 2)
todos$porc0<-round(todos$porc, 0)

#salvando em csv
write.csv(todos,'sobreposicao_sa.csv')



                ##### COMO FIZ  A TABELA classificacao_estado_sa.csv ########
#para o proximo grafico extrai os dados por estado e fiz a tabela csv
# para fazer a porcentagem  dos estados tambem foi feito em relação aao total de sitios da tabela inicial

#abrir csv com os sitios arqueologicos
sit<- read.csv("sitios_amazon.csv", sep = ";", dec = ".") 

#separa por estado 
ac<-sit[sit$est =="AC",] #fazer por estado e anotar a quantidade de linhas da nota tabela que aparce no painel 3-navegador de espaço

ac<-sit[sit$est =="AC",] #TOTAL: 376	
am<-sit[sit$est =="AM",] #TOTAL: 1375
ap<-sit[sit$est =="AP",] #TOTAL:334
ma<-sit[sit$est =="MA",] #TOTAL:185
mt<-sit[sit$est =="MT",] #TOTAL:882
pa<-sit[sit$est =="PA",] #TOTAL:2076
rr<-sit[sit$est =="RR",] #TOTAL:32
ro<-sit[sit$est =="RO",] #TOTAL:713
to<-sit[sit$est =="TO",] #TOTAL:752
                         #SOMA: 6725 sitios

#por exemplo para o estado do acre, extrai os valores pra cada classificação 
ac<-sit[sit$est =="AC",] #so mudar o estado

#terra ind homologada
ind<-ac[ac$ti_homologadas =="1",]

#nao  homologada
indn<-ac[ac$ti_n_homologadas =="1",]

#interditada-estudo
indint<-ac[ac$ti_interdicao =="1",]

##dominial
inddo<-ac[ac$ti_dominais =="1",]

#reserva
indre<-ac[ac$ti_reserva_ind =="1",]


#assentamento
ass<-ac[ac$assentamento =="1",]

#quilombola
qui<-ac[ac$quilombola =="1",]

#urbana
urb<-ac[ac$area_urbanizada =="1",]

#sbf
pi<-ac[ac$pi_sbf =="1",]
us<-ac[ac$us_sbf =="1",]
mil<-ac[ac$militar_sbf =="1",]
semd<-ac[ac$sd_sbf =="1",]
out<-ac[ac$ou_sbf =="1",]

#rural-sicar
mf<-ac[ac$mf =="1",]
p<-ac[ac$p =="1",]
m<-ac[ac$m =="1",]
g<-ac[ac$g =="1",]

#salvar como tabela sitios_todos.csv
#abrir tabela
sest<- read.csv("sitios_todos.csv", sep = ";", dec = ".") 

#fazer a porcentagem de cada modalidade por estado 
#por exemplo para o acre
ac<-sest[sest$est =="AC",] #fazer por estado e anotar todos

#porcentagem é em relação ao total de sitios presentes no ACRE:376
ac$porc<- (ac$quantidade /(376))) * 100

###salvar a tabela no excel e abrir novamente 
sest <- read.csv("sitios_todos.csv", sep = ";", dec = ".") 
sest$porc2<-round(sest$porc, 2) #com dois numeros depois da virgula
sest$porc0<-round(sest$porc, 0)# um numero depois da virgula

#salvar a tabela novamente com as porcentagens 
write.csv(sest,'classificacao_estado_sa.csv')


                       ### AMAZONIA LEGAL -AML ####
# para fazer a porcentagem  dos estados tambem foi feito em relação aao total de sitios da tabela inicial
#abrir csv com os sitios arqueologicos
sit<- read.csv("sitios_amazon.csv", sep = ";", dec = ".") 

# fazer para amazonia legal- na coluna estado vai AML
#soma da quantidade de sitios por modalidade  para amazonia legal 
# fiz um por um e anotei na tabela no excel classificacao_estado_sa
aml0<-sest[sest$modalidades =="Homologada",] 
aml1<-sest[sest$modalidades =="Não Homologada",]
aml2<-sest[sest$modalidades =="Interditada",]
aml3<-sest[sest$modalidades =="Dominial",]
aml4<-sest[sest$modalidades =="Reserva Indigena",]
aml5<-sest[sest$modalidades =="Proteção Integral",]
aml6<-sest[sest$modalidades =="Uso Sustentável",]
aml7<-sest[sest$modalidades =="Militar",]
aml8<-sest[sest$modalidades =="Outros Usos",]
aml9<-sest[sest$modalidades =="Sem Destinação",]
aml10<-sest[sest$modalidades =="Assentamento",]
aml11<-sest[sest$modalidades =="Quilombola",]
aml12<-sest[sest$modalidades =="Urbanizada",]
aml13<-sest[sest$modalidades =="Rural-Minifúndio",]
aml14<-sest[sest$modalidades =="Rural-Pequena",]
aml15<-sest[sest$modalidades =="Rural-Média",]
aml16<-sest[sest$modalidades =="Rural-Grande",]
aml17<-sest[sest$modalidades =="Sem Classificação",]

#abri o arquivo novamente para fazer a porcentagem
sest <- read.csv("classificacao_estado_sa.csv", sep = ";", dec = ".")

#selecionar amazonia legal - AML
aml<-sest[sest$est =="AML",]
#fazer a porcetagem em realação ao total de sitios
aml$porc<- (aml$quantidade /(6725)) * 100
aml$porc

aml$porc0<-round(aml$porc, 0) #zero casas depois da virgula
aml$porc2<-round(aml$porc, 2) #duas casas depois da virgula 


#arquivo final salvo como classificacao_estado_sa.csv
#contem o estado; "est","modalidades","quantidade" de sitios
#porcentagem:"porc","porc2"(2 casas dpois da virgula),"porc0"(0casas depois da virgula)

          ##### COMO FIZ  A TABELA DOS DADOS SEM DESTINAÇÃO - semdestinacao_sa.csv ########
#para esta tabela utilizei os dados obtidos a partir da tabela de sobreposição com as siglas
#que foi feito no script de sobreposição_siglas
#tabela mostrando as sobreposições das camadas para a localizaçao dos sitio


install.packages("stringr")                        # Install stringr package
library("stringr")                                 # Load stringr       

install.packages("data.table")                     # Install data.table package
library("data.table")                              # Load data.table

#abrindo tabela
sob <- read.csv("sobreposição_sigla_sa.csv", sep = ",", dec = ".")

#excluindo coluna 
sob <- subset(sob, select = -c(5:12))

# Extract matching rows with %like%
data2 <- sob[sob$sobreposicao %like% "sd", ]        
head(data2)

#salvar nova tabela mostrando as sobreposições das camadas para a localizaçao dos sitios
write.csv(data2,'sem_dest_aml.csv')

##posteriormente arrumei esta tabela no excel 
#salvei como sd_aml.csv

###fazer a porcentagem 
dat <- read.csv("sd_aml.csv", sep = ";", dec = ".")
dat$porc<- (dat$q /(6725)) * 100
dat$porc2<-round(dat$porc, 2)
dat$porc0<-round(dat$porc, 0)
dat$c1<-as.character(dat$c1)
Encoding(dat$c1) <- "UTF-8"
write.csv(dat,'semdestinacao_sa.csv')


                   ##### COMO FIZ  A TABELA DADOS RURAIS geral_rural_sa.csv ########
#rural
#analisei os dados na tabela de sobreposição sobreposição_sigla_sa.csv e fiz no excel
#salvei como geral_rural.csv

#deepois fiz a porcentagem 
dat <- read.csv("geral_rural.csv", sep = ";", dec = ".")
dat$porc<- (dat$q /(6725)) * 100
dat$porc2<-round(dat$porc, 2)
dat$porc0<-round(dat$porc, 0)
dat$c1<-as.character(dat$c1)
Encoding(dat$c1) <- "UTF-8"
write.csv(dat,'geral_rural_sa.csv')

##### COMO FIZ  A TABELA AML aml_geral_sa.csv ########

sa <- read.csv("classificacao_estado_sa.csv", sep = ",", dec = ".")
#separei aml-amazonia legal -total
s<-sa[sa$est =="AML",] 

#salvar
write.csv(s,'aml_geral_sa.csv')


####tabela grafico indigena indigena_sa.csv
sob <- read.csv("sobreposição_aml_sa2.csv", sep = ",", dec = ".")
#excluindo coluna 
#sob <- subset(sob, select = -c(5:12))


data2 <- sob[sob$sobreposicao %like% "t", ]        # Extract matching rows with %like%
head(data2)
data2$porc<- (data2$q *100)/ (1028959)
data2$porc0<- round(data2$porc)
sum(data2$q)
sum(data2$porc)
data2$porc2<-round(data2$porc, 2)
data2$porc0<-round(data2$porc, 0)

#salvar nova tabela 
write.csv(data2,'indigena_sa.csv')






