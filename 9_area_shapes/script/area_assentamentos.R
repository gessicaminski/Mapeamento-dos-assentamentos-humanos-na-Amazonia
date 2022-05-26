##analise assentamento
setwd("C:/Users/gessi/Downloads/estagio-docs/amazonia_legal/incra")
ass <- shapefile('am_legal_assentamento_incraa.shp')
crs(ind)
ass$area_sqkm <- area(ass) / 1000000  ## km²

asr <- as.data.frame (ass)
sum(ass$area_sqkm)#1118262

#a partir daqui 
setwd("C:/Users/gessi/Downloads/estagio-docs/")
ass1 <- shapefile('ass_aml.shp')
crs(ind)
ass1$area_sqkm <- area(ass1) / 1000000  ## km²

asr1 <- as.data.frame (ass1)

sum(asr1$area_sqkm)#656606.4
####criando data frame


#excluindo colunas 
asr1 <- subset( asr1, select = -c( 3: 13 ))
asr1 <- subset( asr1, select = -c( 4: 5 ))
asr1 <- subset( asr1, select = -c( 1 ))
asr1$id2<- duplicated(asr1$cd_sipra)

#excluir linhas que tem true 
asr1<-asr1[!(asr1$id2=="TRUE"),]

sum(asr1$area_sqkm)#1118262

#salvando em csv
setwd("C:/Users/gessi/Downloads/estagio-docs/") #diretório que eu quero uilizar
write.csv(asr1,'assentamento.csv')
asr1 <- read.csv("terra_ind.csv", sep = ",", dec = ".")

asr1$uf_sigla <-sort(asr1$uf_sigla)
sum(asr1$area_sqkm)

##usei a area dos estados que estao no outro script - area_estados
ac <- asr1[asr1$uf  =="AC",]
sum(ac$area_sqkm)

si <- ac[ac$modalidade  =="Interditada",]
do <- ac[ac$fase_ti  =="Encaminhada RI",]
re <- ac[ac$modalidade  =="Reserva IndÃ???gena",]

## feito no R
sum(si$area_sqkm) #1.871284  2504.844
sum(do$area_sqkm)#46.48217 133666.6
sum(re$area_sqkm)  #0  0

sdac<-sum(eac$area_sqkm)-sum(ac$area_sqkm)
sdac


##AM
am <- asr1[asr1$uf  =="AM",]
sum(am$area_sqkm)
sum(eam$area_sqkm)-sum(am$area_sqkm)



##Ap
ap <- asr1[asr1$uf  =="AP",]
sum(ap$area_sqkm)

sdap<-sum(eap$area_sqkm)-sum(ap$area_sqkm)
sdap


##MA
ma <- asr1[asr1$uf  =="MA",]
sum(ma$area_sqkm)


sdma<-sum(ema$area_sqkm)-sum(ma$area_sqkm)
sdma




##MT
mt <- asr1[asr1$uf  =="MT",]
sum(mt$area_sqkm)


sdmt<-sum(emt$area_sqkm)-sum(mt$area_sqkm)
sdmt


##PA
pa <- asr1[asr1$uf  =="PA",]
sum(pa$area_sqkm)


sdpa<-sum(epa$area_sqkm)-sum(pa$area_sqkm)
sdpa

##RR
rr<- asr1[asr1$uf  =="RR",]
sum(rr$area_sqkm)


sdrr<-sum(err$area_sqkm)-sum(rr$area_sqkm)
sdrr


##RO
ro<- asr1[asr1$uf  =="RO",]
sum(ro$area_sqkm)


sdro<-sum(ero$area_sqkm)-sum(ro$area_sqkm)
sdro


##TO
to<- asr1[asr1$uf  =="TO",]
sum(to$area_sqkm)



sdto<-sum(eto$area_sqkm)-sum(to$area_sqkm)
sdto


setwd("C:/Users/gessi/Downloads/estagio-docs/") #diretório que eu quero uilizar
asse <- read.csv("assentamento22.csv", sep = ";", dec = ".")

#pr estado
ac<-asse[asse$Estados =="TO",]
ac$porc<- (ac$v /(sum(ac$v))) * 100
asse$porc2<-round(asse$porc, 2)
#asse <-asse[-c(10, 11, 12), ]


write.csv(asse,'assentamento_porc2.csv')

sum(asse$v)
asse$
#porcentagem
cbp1 <- c("mediumorchid", "darkolivegreen1")

ggplot(asse, aes(fill=Classificação, y=v, x=Estados)) + 
  geom_bar(position="fill", stat="identity")+
  scale_y_continuous(labels = scales::percent)+
  #scale_y_continuous(labels = scales::percent_format(accuracy = 1))+
  # scale_y_continuous(labels = scales::percent_format, breaks = seq(10, 100,0))+
  
  scale_fill_manual(values = cbp1)+
  
  labs(title = "Assentamentos -INCRA")+
  theme(plot.title = element_text(hjust= 0.5, size=16))+ 
  ylab("km²") 



#xlab("Tree Cover") + 
#ylab("Frequency")

## todos - colocar no subtitulo as areas dos estados 

ggplot(asse, aes(fill=Classificação, y=v, x=Estados)) + 
  geom_bar(position="dodge", stat="identity")+
  #scale_y_continuous(labels = scales::percent)+
  #scale_y_continuous(labels = scales::percent_format(accuracy = 1))+
  # scale_y_continuous(labels = scales::percent_format, breaks = seq(10, 100,0))+
  
  scale_fill_manual(values = cbp1)+
  
  #ggtitle("Classificação do Sistema Brasileiro Florestal") +
  #xlab("Tree Cover") + 
  
  
  labs(title = "Assentamentos -INCRA",
       subtitle = "AC=164.173  AM= 1.559.169  AP=142.470  MA=329.651  MT=90.3207  PA=1.245.871   RO=237.765  RR=223.644  TO= 277.423  - Km²")+
  theme(plot.title = element_text(hjust= 0.5, size=16), 
        plot.subtitle = element_text(hjust= 0.0, size=9.0)) + 
  ylab("km²")



#### mapa 
setwd("C:/Users/gessi/Downloads/estagio-docs/sbf_aml")
est <- readOGR(dsn = '.' , layer = 'aml', encoding = "UTF-8")
est<-spTransform(est,
                 CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"))
#plot(est,col='darkolivegreen1', border = NA)

setwd("C:/Users/gessi/Downloads/estagio-docs/amazonia_legal/incra")
ass <- shapefile('am_legal_assentamento_incraa.shp')
ass<-spTransform(ass,
                 CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"))

plot(est)
#amazonia legal
plot(ass, add=T, col='mediumorchid', border = NA)

plot(est,lwd=0.5, add=T)
#lines(MA, col="gray92", lwd=0.5)
