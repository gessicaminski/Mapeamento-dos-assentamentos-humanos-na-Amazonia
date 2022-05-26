##analise assentamento 
#a partir daqui 
####criando data frame
setwd("C:/Users/gessi/Downloads/estagio-docs/amazonia_legal/incra")
qui<- shapefile('am_legal_quilombo_incraa.shp')
crs(ind)
qui$area_sqkm <- area(qui) / 1000000  ## km²

sum(qui$area_sqkm)
quii <- as.data.frame (qui)

#excluindo colunas 
qui1 <- subset( quii, select = -c( 1: 5 ))
qui1 <- subset( qui1, select = -c( 2:18))
qui1 <- subset( qui1, select = -c( 3 ))
#qui1$id2<- duplicated(qui1$cd_sipra)

#excluir linhas que tem true 
#qui1<-qui1[!(qui1$id2=="TRUE"),]

sum(qui1$area_sqkm)#1118262

#salvando em csv
setwd("C:/Users/gessi/Downloads/estagio-docs/") #diretório que eu quero uilizar
write.csv(qui1,'quilombola.csv')

qui1 <- read.csv("qui1.csv", sep = ";", dec = ".")

qui1$cd_uf_sigla <-sort(qui1$cd_uf_sigla)
sum(qui1$v)

class(qui1$v)
##usei a area dos estados que estao no outro script - area_estados
ac <- qui1[qui1$cd_cd_uf  =="AC",]
sum(ac$area_sqkm)


sdac<-sum(eac$area_sqkm)-sum(ac$area_sqkm)
sdac


##AM
am <- qui1[qui1$cd_uf  =="AM",]
sum(am$area_sqkm)
sum(eam$area_sqkm)-sum(am$area_sqkm)



##Ap
ap <- qui1[qui1$cd_uf  =="AP",]
sum(ap$area_sqkm)

sdap<-sum(eap$area_sqkm)-sum(ap$area_sqkm)
sdap


##MA
ma <- qui1[qui1$cd_uf  =="MA",]
sum(ma$area_sqkm)


sdma<-sum(ema$area_sqkm)-sum(ma$area_sqkm)
sdma




##MT
mt <- qui1[qui1$cd_uf  =="MT",]
sum(mt$area_sqkm)


sdmt<-sum(emt$area_sqkm)-sum(mt$area_sqkm)
sdmt


##PA
pa <- qui1[qui1$cd_uf  =="PA",]
sum(pa$area_sqkm)


sdpa<-sum(epa$area_sqkm)-sum(pa$area_sqkm)
sdpa

##RR
rr<- qui1[qui1$cd_uf  =="RR",]
sum(rr$area_sqkm)


sdrr<-sum(err$area_sqkm)-sum(rr$area_sqkm)
sdrr


##RO
ro<- qui1[qui1$cd_uf  =="RO",]
sum(ro$area_sqkm)


sdro<-sum(ero$area_sqkm)-sum(ro$area_sqkm)
sdro


##TO
to<- qui1[qui1$cd_uf  =="TO",]
sum(to$area_sqkm)



sdto<-sum(eto$area_sqkm)-sum(to$area_sqkm)
sdto


setwd("C:/Users/gessi/Downloads/estagio-docs/") #diretório que eu quero uilizar
qui1 <- read.csv("qui1.csv", sep = ";", dec = ".")
#asse <-asse[-c(10, 11, 12), ]

ac<-qui1[qui1$Estados =="TO",]
ac$porc<- (ac$v /(sum(ac$v))) * 100

qui1$porc2<-round(qui1$porc, 2)
write.csv(qui1,'qui_porc2.csv')
 #porcentagem
  cbp1 <- c( "darkolivegreen1","mediumpurple4")

ggplot(qui1, aes(fill=Classificação, y=v, x=Estados)) + 
  geom_bar(position="fill", stat="identity")+
  scale_y_continuous(labels = scales::percent)+
  #scale_y_continuous(labels = scales::percent_format(accuracy = 1))+
  # scale_y_continuous(labels = scales::percent_format, breaks = seq(10, 100,0))+
  
  scale_fill_manual(values = cbp1)+
  
  labs(title = "Quilombola -INCRA")+
  theme(plot.title = element_text(hjust= 0.5, size=16))+ 
  ylab("km²") 



#xlab("Tree Cover") + 
#ylab("Frequency")

## todos - colocar no subtitulo as areas dos estados 

ggplot(qui1, aes(fill=Classificação, y=v, x=Estados)) + 
  geom_bar(position="dodge", stat="identity")+
  #scale_y_continuous(labels = scales::percent)+
  #scale_y_continuous(labels = scales::percent_format(accuracy = 1))+
  # scale_y_continuous(labels = scales::percent_format, breaks = seq(10, 100,0))+
  
  scale_fill_manual(values = cbp1)+
  
  #ggtitle("Classificação do Sistema Brasileiro Florestal") +
  #xlab("Tree Cover") + 
  
  
  labs(title = "Quilombola -INCRA",
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
qui<- shapefile('am_legal_quilombo_incraa.shp')
qui<-spTransform(qui,
                 CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"))

plot(est)
#amazonia legal
plot(qui, add=T, col='mediumpurple4', border = NA)

plot(est,lwd=0.5, add=T)
#lines(MA, col="gray92", lwd=0.5)
