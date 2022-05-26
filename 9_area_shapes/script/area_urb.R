##analise urbanizadas
#a partir daqui 
####criando data frame
setwd("C:/Users/gessi/Downloads/estagio-docs/amazonia_legal/ibge")
urb <- shapefile('am_legal_urbanizadaa.shp')

crs(urb)
urb$area_sqkm <- area(urb) / 1000000  ## km²
plot(urb)

uuu <- as.data.frame (urb)
sum(uuu$area_sqkm)

ac<-uu[uu$UF == "AC",]
#excluindo colunas 
uu1 <- subset( uuu, select = -c( 1: 3 ))
#uu1 <- subset(uu1, select = -c( 2 ))
uu1 <- subset(uu1, select = -c( 5: 7 ))
#uu1 <- subset(uu1, select = -c( 3 ))
uu1 <- subset(uu1, select = -c( 6: 7 ))
#asr1$id2<- duplicated(asr1$cd_sipra)

#excluir linhas que tem true 
#asr1<-asr1[!(asr1$id2=="TRUE"),]

sum(uu1$area_sqkm)#1118262- 1810.013




#salvando em csv
setwd("C:/Users/gessi/Downloads/estagio-docs/") #diretório que eu quero uilizar
write.csv(uu1,'uu1.csv')
uu2 <- read.csv("uu2.csv", sep = ";", dec = ".")

asr1$uf_sigla <-sort(asr1$uf_sigla)
sum(asr1$area_sqkm)

##usei a area dos estados que estao no outro script - area_estados
ac<- uu1[uu1$UF  =="AC"| uu1$NomeConcUr  == "AC",]
uu <- as.data.frame (ac)


ac<-  uuu[uuu$CodConcUrb  == "1200401",]
sum(ac$area_sqkm)
sum(ac$AREA_GEO)
164108.3

am<-  uuu[uuu$CodConcUrb  == "1303403"| uuu$CodConcUrb  == "1302603",]
sum(am$area_sqkm)

ap<-  uuu[uuu$CodConcUrb  == "1600303",]
sum(ap$area_sqkm)


##usando o codigo 
ma<-  uuu[uuu$CodConcUrb  == "2111300"|uuu$CodConcUrb  == "2100055"|uuu$CodConcUrb  == "2105302"|uuu$CodConcUrb  == "2103307"|uuu$CodConcUrb  == "2101202",]   
sum(ma$area_sqkm)
329651.5- 303.6813

mt<-  uuu[uuu$CodConcUrb  == "5107602"|uuu$CodConcUrb  == "5103403"|uuu$CodConcUrb  == "5107909",]
sum(mt$area_sqkm)
903207.5-297.9375


pa<-  uuu[uuu$CodConcUrb  == "1501402"|uuu$CodConcUrb  == "1506807"|uuu$CodConcUrb  == "1505536"|uuu$CodConcUrb  == "1504208"|uuu$CodConcUrb  == "1502400"|uuu$CodConcUrb  == "1502103"|uuu$CodConcUrb  == "1500107"|uuu$CodConcUrb  == "1501709",]
sum(pa$area_sqkm)
1245871-462.4417


rr<-  uuu[uuu$CodConcUrb  == "1400100",]
sum(rr$area_sqkm)
223644.1-86.31977

ro<-  uuu[uuu$CodConcUrb  == "1100205"|uuu$CodConcUrb  == "1100122",]	
sum(ro$area_sqkm)
237765.4-150.9598

to<-  uuu[uuu$CodConcUrb  == "1721000"|uuu$CodConcUrb  == "1702109",]
sum(to$area_sqkm)
277423.6-121.8867


   
sort(unique(uu1$CodConcUrb))

#RO-"1100122" "1100205" 

#AC-rio branco "1200401"

#AM-manaus-"1302603" "1303403" 

#RR-boa vista - "1400100"

#PA-"1500107" "1501402"  "1501709" "1502103" "1502400" "1504208""1505536" "1506807" 

#AP- "1600303" 
#To-"1702109" "1721000" 

#MA-"2100055" "2101202" "2103307""2105302" "2111300" 

#MT-"5103403" "5107602" "5107909"


setwd("C:/Users/gessi/Downloads/estagio-docs/") #diretório que 
uu2 <- read.csv("urbb.csv", sep = ";", dec = ".")

sum(uu2$urb)
sum(uu2$outros)

sdac<-sum(eac$area_sqkm)-sum(ac$area_sqkm)
sdac


##AM
sum(eam$area_sqkm)-sum(am$area_sqkm)

##Ap
sdap<-sum(eap$area_sqkm)-sum(ap$area_sqkm)
sdap


##MA
sdma<-sum(ema$area_sqkm)-sum(ma$area_sqkm)
sdma


##MT
Sdmt<-sum(emt$area_sqkm)-sum(mt$area_sqkm)
sdmt

##PA
sdpa<-sum(epa$area_sqkm)-sum(pa$area_sqkm)
sdpa

##RR
sdrr<-sum(err$area_sqkm)-sum(rr$area_sqkm)
sdrr


##RO
sdro<-sum(ero$area_sqkm)-sum(ro$area_sqkm)
sdro


##TO
sdto<-sum(eto$area_sqkm)-sum(to$area_sqkm)
sdto






