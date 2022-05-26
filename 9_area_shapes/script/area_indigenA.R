##como fiz a extração dos km²
#abri os shapefiles das camadas e fiz a area de cada um
#pode ser feito diretamente no saphe como a partir do dataframe


#### TERRAS  INDIGENAS - FUNAI #######
setwd("C:/Users/gessi/Downloads/estagio-docs/amazonia_legal/funai")
ind <- shapefile('ind_aml.shp')

#criar coluna com km² 
ind$area_sqkm <- area(ind) / 1000000  ## km²
#ind$area_sqkm


#somar a area para amazonia legal
sum(ind$area_sqkm)

#criar um dataframe a partir do shape
see <- as.data.frame (ind)

#excluindo colunas 
see2 <- subset( see, select = -c( 3: 5 ))
see2 <- subset( see2, select = -c( 7: 15 ))
see2 <- subset(see2, select = - gid)
see2 <- subset(see2, select = - superficie)


#excluindo colunas 
see3 <- subset(see3, select = - id2)
#see3 <- subset(see3, select = - terrai_cod)
see3<-see3[!(see3$uf_sigla=="MS"),]
sum (see3$area_sqkm)

#excluindo colunas 
see3 <- subset(see3, select = - id2)
#see3 <- subset(see3, select = - terrai_cod)

#exclui mato grosso do sul
see3<-see3[!(see3$uf_sigla=="MS"),]
sum (see3$area_sqkm)


##exclui as linhas que as terras indigenas que estao na divisoria 
see3<-see3[!(see3$uf_sigla=="AM,AC"),]
see3<-see3[!(see3$uf_sigla=="AM,PA"),]
see3<-see3[!(see3$uf_sigla=="AM,RO"),]
see3<-see3[!(see3$uf_sigla=="AP,PA"),]
see3<-see3[!(see3$uf_sigla=="MT,PA"),]
see3<-see3[!(see3$uf_sigla=="MT,RO"),]
see3<-see3[!(see3$uf_sigla=="PA,MT"),]
see3<-see3[!(see3$uf_sigla=="RO,MT"),]
see3<-see3[!(see3$uf_sigla=="RR,AM"),]
see3<-see3[!(see3$uf_sigla=="RR,AM,PA"),]
see3<-see3[!(see3$uf_sigla=="TO,PA"),]


#salvando em csv
setwd("C:/Users/gessi/Downloads/estagio-docs/") #diretório que eu quero uilizar
write.csv(see3,'terra_ind.csv')

#abrir tabela 
see3 <- read.csv("terra_ind.csv", sep = ",", dec = ".")
see3$uf_sigla <-sort(see3$uf_sigla)

see3<-see3[!(see3$uf_sigla=="MS"),]
sum(see3$area_sqkm)

##usei a area dos estados que estao no outro script - area_estados
#para fazer a porcentagem 
##separar por estado AC
ac <- see3[see3$uf_sigla  =="AC",]
sum(ac$area_sqkm) #total

#por divisões
h<-ac[ac$modalidade =="Tradicionalmente ocupada",]

ho<- h[h$fase_ti  =="Regularizada"| h$fase_ti  == "Homologada",]

nho<- h[h$fase_ti  =="Declarada" | h$fase_ti  ==  "Delimitada",]

si <- ac[ac$modalidade  =="Interditada",]
do <- ac[ac$modalidade  =="Dominial Indigena",]
re <- ac[ac$modalidade  =="Reserva Indigena",]

## porcentagem
sum(ho$area_sqkm)#10.4009 - 14.622.27 KM2 14622.11
sum (nho$area_sqkm)#7.917538 29960.89
sum(si$area_sqkm) #1.871284  2504.844
sum(do$area_sqkm)#46.48217 133666.6
sum(re$area_sqkm)  #0  0

#porcentagem aml
sdac<-sum(eac$area_sqkm)-sum(ac$area_sqkm)
sdac


##AM
am <- see3[see3$uf_sigla  =="AM",]
sum(am$area_sqkm)

h<-am[am$modalidade =="Tradicionalmente ocupada",]
ho<- h[h$fase_ti  =="Regularizada"| h$fase_ti  == "Homologada",]

nho<- h[h$fase_ti  =="Declarada" | h$fase_ti  ==  "Delimitada",]

si <- am[am$modalidade  =="Interditada",]
do <- am[am$fase_ti  =="Encaminhada RI",]
re <- am[am$modalidade  =="Reserva IndÃ???gena",]

## feito no R
sum(ho$area_sqkm)#10.4009 - 14.622.27 KM2 14622.11
sum (nho$area_sqkm)#7.917538 29960.89
sum(si$area_sqkm) #1.871284  2504.844
sum(do$area_sqkm)#46.48217 133666.6
sum(re$area_sqkm)  #0  0

sdam<-sum(eam$area_sqkm)-sum(am$area_sqkm)
sdam


##Ap
ap <- see3[see3$uf_sigla  =="AP",]
sum(ap$area_sqkm)

h<-ap[ap$modalidade =="Tradicionalmente ocupada",]
ho<- h[h$fase_ti  =="Regularizada"| h$fase_ti  == "Homologada",]

nho<- h[h$fase_ti  =="Declarada" | h$fase_ti  ==  "Delimitada",]

si <- ap[ap$modalidade  =="Interditada",]
do <- ap[ap$fase_ti  =="Encaminhada RI",]
re <- ap[ap$modalidade  =="Reserva Indigena",]

## feito no R
sum(ho$area_sqkm)#10.4009 - 14.622.27 KM2 14622.11
sum (nho$area_sqkm)#7.917538 29960.89
sum(si$area_sqkm) #1.871284  2504.844
sum(do$area_sqkm)#46.48217 133666.6
sum(re$area_sqkm)  #0  0

sdap<-sum(eap$area_sqkm)-sum(ap$area_sqkm)
sdap


##MA
ma <- see3[see3$uf_sigla  =="MA",]
sum(ma$area_sqkm)

h<-ma[ma$modalidade =="Tradicionalmente ocupada",]
ho<- h[h$fase_ti  =="Regularizada"| h$fase_ti  == "Homologada",]

nho<- h[h$fase_ti  =="Declarada" | h$fase_ti  ==  "Delimitada",]

si <- ma[ma$modalidade  =="Interditada",]
do <- ma[ma$modalidade  =="Dominial Indigena",]

re <- ma[ma$modalidade  =="Reserva Indigena",]

## feito no R
sum(ho$area_sqkm)#10.4009 - 14.622.27 KM2 14622.11
sum (nho$area_sqkm)#7.917538 2996a0.89
sum(si$area_sqkm) #1.871284  2504.844
sum(do$area_sqkm)#46.48217 133666.6
sum(re$area_sqkm)  #0  0

sdma<-sum(ema$area_sqkm)-sum(ma$area_sqkm)
sdma




##MT
mt <- see3[see3$uf_sigla  =="MT",]
sum(mt$area_sqkm)

h<-mt[mt$modalidade =="Tradicionalmente ocupada",]
ho<- h[h$fase_ti  =="Regularizada"| h$fase_ti  == "Homologada",]

nho<- h[h$fase_ti  =="Declarada" | h$fase_ti  ==  "Delimitada",]

si <- mt[mt$modalidade  =="Interditada",]
do <- mt[mt$modalidade  =="Dominial Indigena",]
re <- mt[mt$modalidade  =="Reserva Indigena",]


## feito no R
sum(ho$area_sqkm)#10.4009 - 14.622.27 KM2 14622.11
sum (nho$area_sqkm)#7.917538 2996a0.89
sum(si$area_sqkm) #1.871284  2504.844
sum(do$area_sqkm)#46.48217 133666.6
sum(re$area_sqkm)  #0  0

sdmt<-sum(emt$area_sqkm)-sum(mt$area_sqkm)
sdmt


##PA
pa <- see3[see3$uf_sigla  =="PA",]
sum(pa$area_sqkm)

h<-pa[pa$modalidade =="Tradicionalmente ocupada",]
ho<- h[h$fase_ti  =="Regularizada"| h$fase_ti  == "Homologada",]

nho<- h[h$fase_ti  =="Declarada" | h$fase_ti  ==  "Delimitada",]

si <- pa[pa$modalidade  =="Interditada",]
do <- pa[pa$modalidade  =="Dominial Indigena",]
re <- pa[pa$modalidade  =="Reserva Indigena",]

pa$modalidade
## feito no R
sum(ho$area_sqkm)#10.4009 - 14.622.27 KM2 14622.11
sum (nho$area_sqkm)#7.917538 2996a0.89
sum(si$area_sqkm) #1.871284  2504.844
sum(do$area_sqkm)#46.48217 133666.6
sum(re$area_sqkm)  #0  0

sdpa<-sum(epa$area_sqkm)-sum(pa$area_sqkm)
sdpa

##RR
rr<- see3[see3$uf_sigla  =="RR",]
sum(rr$area_sqkm)

h<-rr[rr$modalidade =="Tradicionalmente ocupada",]
ho<- h[h$fase_ti  =="Regularizada"| h$fase_ti  == "Homologada",]

nho<- h[h$fase_ti  =="Declarada" | h$fase_ti  ==  "Delimitada",]

si <- rr[rr$modalidade  =="Interditada",]
do <- rr[rr$modalidade  =="Dominial Indigena",]
re <- rr[rr$modalidade  =="Reserva Indigena",]

rr$modalidade
## feito no R
sum(ho$area_sqkm)#10.4009 - 14.622.27 KM2 14622.11
sum (nho$area_sqkm)#7.917538 2996a0.89
sum(si$area_sqkm) #1.871284  2504.844
sum(do$area_sqkm)#46.48217 133666.6
sum(re$area_sqkm)  #0  0

sdrr<-sum(err$area_sqkm)-sum(rr$area_sqkm)
sdrr



##RO
ro<- see3[see3$uf_sigla  =="RO",]
sum(ro$area_sqkm)

h<-ro[ro$modalidade =="Tradicionalmente ocupada",]
ho<- h[h$fase_ti  =="Regularizada"| h$fase_ti  == "Homologada",]

nho<- h[h$fase_ti  =="Declarada" | h$fase_ti  ==  "Delimitada",]

si <- ro[ro$modalidade  =="Interditada",]
do <- ro[ro$modalidade  =="Dominial Indigena",]
re <- ro[ro$modalidade  =="Reserva Indigena",]

ro$modalidade
## feito no R
sum(ho$area_sqkm)#10.4009 - 14.622.27 KM2 14622.11
sum (nho$area_sqkm)#7.917538 2996a0.89
sum(si$area_sqkm) #1.871284  2504.844
sum(do$area_sqkm)#46.48217 133666.6
sum(re$area_sqkm)  #0  0

sdro<-sum(ero$area_sqkm)-sum(ro$area_sqkm)
sdro


##TO
to<- see3[see3$uf_sigla  =="TO",]
sum(to$area_sqkm)

h<-to[to$modalidade =="Tradicionalmente ocupada",]
ho<- h[h$fase_ti  =="Regularizada"| h$fase_ti  == "Homologada",]

nho<- h[h$fase_ti  =="Declarada" | h$fase_ti  ==  "Delimitada",]

si <- to[to$modalidade  =="Interditada",]
do <- to[to$modalidade  =="Dominial Indigena",]
re <- to[to$modalidade  =="Reserva Indigena",]

to$modalidade
## feito no R
sum(ho$area_sqkm)#10.4009 - 14.622.27 KM2 14622.11
sum (nho$area_sqkm)#7.917538 2996a0.89
sum(si$area_sqkm) #1.871284  2504.844
sum(do$area_sqkm)#46.48217 133666.6
sum(re$area_sqkm)  #0  0

sdto<-sum(eto$area_sqkm)-sum(to$area_sqkm)
sdto


## Areas que estão na divisa  
setwd("C:/Users/gessi/Downloads/estagio-docs/amazonia_legal/funai")
see <- shapefile('ind_aml.shp')
#excluindo colunas 
see2 <- subset( see, select = -c( 3: 5 ))
see2 <- subset( see2, select = -c( 7: 15 ))
see2 <- subset(see2, select = - gid)
see2 <- subset(see2, select = - superficie)


#excluindo colunas 
see3 <- subset(see3, select = - id2)
#see3 <- subset(see3, select = - terrai_cod)
see3<-see3[!(see3$uf_sigla=="MS"),]
sum (see3$area_sqkm)

#excluindo colunas 
see3 <- subset(see3, select = - id2)
#see3 <- subset(see3, select = - terrai_cod)

#exclui mato grosso do sul
see3<-see3[!(see3$uf_sigla=="MS"),]
sum (see3$area_sqkm)


#mt-pa e mt -ro = MT
d<-see3[see3$terrai_cod =="33801"| see3$terrai_cod == "33601"| see3$terrai_cod == "40701",]
sum(mt$area_sqkm)+sum(d$area_sqkm)
h<-mt[mt$modalidade =="Tradicionalmente ocupada",]
ho<- h[h$fase_ti  =="Regularizada"| h$fase_ti  == "Homologada",]
sum(ho$area_sqkm)+sum(d$area_sqkm)
sum(emt$area_sqkm)-(sum(mt$area_sqkm)+sum(d$area_sqkm))


#mt-pa= PA
d1<-see3[see3$terrai_cod =="28701"|see3$terrai_cod == "22902"|see3$terrai_cod == "32201"|see3$terrai_cod == "33701"|see3$terrai_cod == "2001"|see3$terrai_cod == "30501"|see3$terrai_cod == "46401",]

h<-pa[pa$modalidade =="Tradicionalmente ocupada",]
ho<- h[h$fase_ti  =="Regularizada"| h$fase_ti  == "Homologada",]
sum(pa$area_sqkm)+sum(d1$area_sqkm)
sum(ho$area_sqkm)+sum(d1$area_sqkm)
sum(epa$area_sqkm)-(sum(pa$area_sqkm)+sum(d1$area_sqkm))


##ro-MT= RO
d2<-see3[see3$terrai_cod =="43001",]

h<-ro[ro$modalidade =="Tradicionalmente ocupada",]
ho<- h[h$fase_ti  =="Regularizada"| h$fase_ti  == "Homologada",]
sum(ro$area_sqkm)+sum(d2$area_sqkm)
sum(ho$area_sqkm)+sum(d2$area_sqkm)
sum(ero$area_sqkm)-(sum(ro$area_sqkm)+sum(d2$area_sqkm))

##rr-am= am
d3<-see3[see3$terrai_cod =="49501"|see3$terrai_cod == "23701"|see3$terrai_cod == "22001",]

h<-am[am$modalidade =="Tradicionalmente ocupada",]
ho<- h[h$fase_ti  =="Regularizada"| h$fase_ti  == "Homologada",]
sum(am$area_sqkm)+sum(d3$area_sqkm)
sum(ho$area_sqkm)+sum(d3$area_sqkm)
sum(eam$area_sqkm)-(sum(am$area_sqkm)+sum(d3$area_sqkm))


##rr-am= Rr
d4<-see3[see3$terrai_cod =="50901",]

h<-rr[rr$modalidade =="Tradicionalmente ocupada",]
ho<- h[h$fase_ti  =="Regularizada"| h$fase_ti  == "Homologada",]
sum(rr$area_sqkm)+sum(d4$area_sqkm)
sum(ho$area_sqkm)+sum(d4$area_sqkm)

sum(err$area_sqkm)- (sum(rr$area_sqkm)+sum(d4$area_sqkm))

##to-pa=to

d5<-see3[see3$terrai_cod =="27101",]

h<-to[to$modalidade =="Tradicionalmente ocupada",]
ho<- h[h$fase_ti  =="Regularizada"| h$fase_ti  == "Homologada",]
sum(to$area_sqkm)+sum(d5$area_sqkm)
sum(ho$area_sqkm)+sum(d5$area_sqkm)
sum(eto$area_sqkm)- (sum(to$area_sqkm)+sum(d5$area_sqkm))



a<- sum(d$area_sqkm)+sum(d1$area_sqkm)+sum(d2$area_sqkm)+sum(d3$area_sqkm)+sum(d4$area_sqkm)+sum(d5$area_sqkm)

b<-sum(ac$area_sqkm)+sum(am$area_sqkm)+sum(ap$area_sqkm)+sum(ma$area_sqkm)+sum(mt$area_sqkm)+sum(pa$area_sqkm)+sum(rr$area_sqkm)+sum(ro$area_sqkm)+sum(to$area_sqkm)
  
df = data.frame(EStados=c("AC","AC","AC","AC","AC","AC","AM","AM","AM","AM","AM","AM", "AP","AP","AP","AP","AP","AP", "MA","MA","MA","MA","MA","MA","MT","MT","MT","MT","MT","MT","PA","PA","PA","PA","PA","PA", "RR","RR","RR","RR","RR","RR", "RO","RO","RO","RO","RO","RO", "TO","TO","TO","TO","TO","TO" ),Modalidades=c("Homologada","Não Homologada","Interditada", "Dominial", "Reserva Indigena", "Outros"), Valor=c(23.147, 2.073, 0.003, 0.116,0, 138.834,337.548, 30.747, 6.088, 0,0,1185, 11.226,0,0,0,0,131.244, 19.021, 5.355, 0,0.023,0.080, 305.171, 79.577, 21.779,2.424, 0,0.36348,799.064,161.1799, 24.86678, 1.425, 0.004147099, 0.03005553, 1058365,33.434, 0, 0.400, 0,0,189.809, 39.069, 2.351,0.0806,0,0.009, 196.256, 23.755, 2061012,0,0,0.077, 251.531))

## somente com 3 casas decimais
df$Valor<- format(round(df$Valor, 6), nsmall = 6)

sum(df$Valor)

##obs dados indigenas um pouco bagunçados quanto a classificação 
## os shapes são baixados por homologadas ou não ho e interditadas... porem na coluna modalidade são todas tradicionalmente ocupadas, e areas inteditadas é o mensmo nome pra as areas que estao nos arquivos de nao homologadas para as do arquivo interditadas
##os pontos em estudo não deram para trabalhar 
## q estao interditados estão em estudo 

#salvando em csv
setwd("C:/Users/gessi/Downloads/estagio-docs/") #diretório que eu quero uilizar
write.csv(df,'terra_ind3.csv')
          
 
terras_indigenas

setwd("C:/Users/gessi/Downloads/estagio-docs/")
indd <- read.csv("terra_ind3.csv", sep = ",", dec = ".")


indd<-indd[!(indd$Modalidades=="Outros"),]

sum(to$Valor)
h<-to[to$EStados =="TO",]
sum(h$Valor)
sum(eto$area_sqkm)


h<-indd[indd$EStados =="AC",]

sum(h$Valor)
sum(eac$area_sqkm)


h<-indd[indd$EStados =="AM",]
sum(h$Valor)
sum(eam$area_sqkm)

h<-indd[indd$EStados=="AP",]
sum(h$Valor)
sum(eap$area_sqkm)


h<-indd[indd$EStados =="MA",]
sum(h$Valor)
sum(ema$area_sqkm)


h<-indd[indd$EStados =="MT",]
sum(h$Valor)
sum(emt$area_sqkm)

h<-indd[indd$EStados =="PA",]
sum(h$Valor)
sum(epa$area_sqkm)


h<-indd[indd$EStados =="RR",]
sum(h$Valor)
sum(err$area_sqkm)

h<-indd[indd$EStados =="RO",]
sum(h$Valor)
sum(ero$area_sqkm)

h<-indd[indd$EStados =="TO",]
sum(h$Valor)
sum(eto$area_sqkm)


sum(to$Valor)

h<-indd[indd$Modalidades =="Homologada",]
sum(h$Valor)

hs<-indd[indd$Modalidades =="Não Homologada",]
sum(hs$Valor)

s<-indd[indd$Modalidades =="Interditada",]
sum(s$Valor)

hsd<-indd[indd$Modalidades =="Dominial",]
sum(hsd$Valor)

hss<-indd[indd$Modalidades =="Reserva Indigena",]
sum(hss$Valor)

hsw<-indd[indd$Modalidades =="Outros",]
sum(hsw$Valor)

sum(to$Valor)



