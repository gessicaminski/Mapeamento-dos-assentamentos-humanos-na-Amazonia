# Estados
setwd("C:/Users/gessi/Downloads/estagio-docs/sbf_aml")
est <- readOGR(dsn = '.' , layer = 'estados_2010', encoding = "UTF-8")
x <- shapefile('aml.shp')
crs(x)
x$area_sqkm <- area(x) / 1000000

sum(x$area_sqkm)
aas <- as.data.frame (x)

class(x$area_sqkm)
sum(x$area_sqkm)

rr <- sbf[sbf$uf  =="RR",]
plot(rr)
pi<-rr[rr$protecao  =="PROTECAO INTEGRAL",]
plot(pi)
pi$OBJECTID


setwd("C:/Users/gessi/Downloads/estagio-docs/RR/sbf/")
cnfp_RR <- readOGR(dsn = '.' , layer = 'CNFP_2020_RR')
x <- shapefile('RR_CNFP_2020_PROTECAOI.shp')
crs(x)
x$area_sqkm <- area(x) / 1000000
x$area_sqkm 


setwd("C:/Users/gessi/Downloads/estagio-docs/sbf_aml/")
sbf <- shapefile('sbf_km.shp')
crs(sbf)
sbf$area_sqkm <- area(sbf) / 1000000  ## km²
sbf$area_sqkm
sum(sbf$area_sqkm)
s <- as.data.frame (sbf)

#roraima
rr <- sbf[sbf$uf  =="RR",]
sum(rr$area_sqkm)
pi<-rr[rr$protecao  =="PROTECAO INTEGRAL",]
sde<- rr[rr$protecao  =="SEM DESTINACAO",]
mi <- rr[rr$protecao  =="USO MILITAR",]
usust <- rr[rr$protecao  =="USO SUSTENTAVEL",]
ou <- rr[rr$protecao  =="OUTROS USOS",]

pi$areakm2 <- as.numeric(pi$areakm2)

## feito no R
sum(pi$area_sqkm)#10.4009 - 14.622.27 KM2 14622.11
sum (sde$area_sqkm)#7.917538 29960.89
sum(mi$area_sqkm) #1.871284  2504.844
sum(usust$area_sqkm)#46.48217 133666.6
sum(ou$area_sqkm)  #0  0

(19012.34/5088572)  *100
#feito no qgis em formato real
sum(pi$areak)#10.4009 - 14.622.27 KM2 14622.11
sum (sde$areak)#7.917538 29960.89
sum(mi$areak) #1.871284  2504.844
sum(usust$areak)#46.48217 133666.6
sum(ou$areak)

aa <- as.data.frame (rr)


#ACRE
ac <- sbf[sbf$uf  =="AC",]
sum(ac$area_sqkm)
pi<-ac[ac$protecao  =="PROTECAO INTEGRAL",]
sde<- ac[ac$protecao  =="SEM DESTINACAO",]
mi <- ac[ac$protecao  =="USO MILITAR",]
usust <- ac[ac$protecao  =="USO SUSTENTAVEL",]
ou <- ac[ac$protecao  =="OUTROS USOS",]



## feito no R
sum(pi$area_sqkm)#10.4009 - 14.622.27 KM2 14622.11
sum (sde$area_sqkm)#7.917538 29960.89
sum(mi$area_sqkm) #1.871284  2504.844
sum(usust$area_sqkm)#46.48217 133666.6
sum(ou$area_sqkm)  #0  0


#feito no qgis em formato real
sum(pi$areak)#10.4009 - 14.622.27 KM2 14622.11
sum (sde$areak)#7.917538 29960.89
sum(mi$areak) #1.871284  2504.844
sum(usust$areak)#46.48217 133666.6
sum(ou$areak)




#Am
am<- sbf[sbf$uf  =="AM",]
sum(am$area_sqkm)
pi<-am[am$protecao  =="PROTECAO INTEGRAL",]
sde<- am[am$protecao  =="SEM DESTINACAO",]
mi <- am[am$protecao  =="USO MILITAR",]
usust <- am[am$protecao  =="USO SUSTENTAVEL",]
ou <- am[am$protecao  =="OUTROS USOS",]



## feito no R
sum(pi$area_sqkm)#10.4009 - 14.622.27 KM2 14622.11
sum (sde$area_sqkm)#7.917538 29960.89
sum(mi$area_sqkm) #1.871284  2504.844
sum(usust$area_sqkm)#46.48217 133666.6
sum(ou$area_sqkm)  #0  0



#Ap
ap<- sbf[sbf$uf  =="AP",]
sum(ap$area_sqkm)
pi<-ap[ap$protecao  =="PROTECAO INTEGRAL",]
sde<- ap[ap$protecao  =="SEM DESTINACAO",]
mi <- ap[ap$protecao  =="USO MILITAR",]
usust <- ap[ap$protecao  =="USO SUSTENTAVEL",]
ou <- ap[ap$protecao  =="OUTROS USOS",]


## feito no R
sum(pi$area_sqkm)#10.4009 - 14.622.27 KM2 14622.11
sum (sde$area_sqkm)#7.917538 29960.89
sum(mi$area_sqkm) #1.871284  2504.844
sum(usust$area_sqkm)#46.48217 133666.6
sum(ou$area_sqkm)  #0  0


#ma
ma<- sbf[sbf$uf  =="MA",]
sum(ma$area_sqkm)
pi<-ma[ma$protecao  =="PROTECAO INTEGRAL",]
sde<- ma[ma$protecao  =="SEM DESTINACAO",]
mi <- ma[ma$protecao  =="USO MILITAR",]
usust <- ma[ma$protecao  =="USO SUSTENTAVEL",]
ou <- ma[ma$protecao  =="OUTROS USOS",]



## feito no R
sum(pi$area_sqkm)#10.4009 - 14.622.27 KM2 14622.11
sum (sde$area_sqkm)#7.917538 29960.89
sum(mi$area_sqkm) #1.871284  2504.844
sum(usust$area_sqkm)#46.48217 133666.6
sum(ou$area_sqkm)  #0  0


setwd("C:/Users/gessi/Downloads/estagio-docs/MA/sbf")
sbfm <- shapefile('CNFP_2020_MA.shp')
crs(sbfm)
sbfm$area_sqkm <- area(sbfm) / 1000000  ## km²

sum(sbfm$area_sqkm)

#mt
mt<- sbf[sbf$uf  =="MT",]
sum(mt$area_sqkm)

pi<-mt[mt$protecao  =="PROTECAO INTEGRAL",]
sde<- mt[mt$protecao  =="SEM DESTINACAO",]
mi <- mt[mt$protecao  =="USO MILITAR",]
usust <- mt[mt$protecao  =="USO SUSTENTAVEL",]
ou <- mt[mt$protecao  =="OUTROS USOS",]



## feito no R
sum(pi$area_sqkm)#10.4009 - 14.622.27 KM2 14622.11
sum (sde$area_sqkm)#7.917538 29960.89
sum(mi$area_sqkm) #1.871284  2504.844
sum(usust$area_sqkm)#46.48217 133666.6
sum(ou$area_sqkm)  #0  



#pa
pa<- sbf[sbf$uf  =="PA",]
sum(pa$area_sqkm)
pi<-pa[pa$protecao  =="PROTECAO INTEGRAL",]
sde<- pa[pa$protecao  =="SEM DESTINACAO",]
mi <- pa[pa$protecao  =="USO MILITAR",]
usust <- pa[pa$protecao  =="USO SUSTENTAVEL",]
ou <- pa[pa$protecao  =="OUTROS USOS",]



## feito no R
sum(pi$area_sqkm)#10.4009 - 14.622.27 KM2 14622.11
sum (sde$area_sqkm)#7.917538 29960.89
sum(mi$area_sqkm) #1.871284  2504.844
sum(usust$area_sqkm)#46.48217 133666.6
sum(ou$area_sqkm)  #0

#ro
ro<- sbf[sbf$uf  =="RO",]
sum(ro$area_sqkm)
pi<-ro[ro$protecao  =="PROTECAO INTEGRAL",]
sde<- ro[ro$protecao  =="SEM DESTINACAO",]
mi <- ro[ro$protecao  =="USO MILITAR",]
usust <- ro[ro$protecao  =="USO SUSTENTAVEL",]
ou <- ro[ro$protecao  =="OUTtoS USOS",]



## feito no R
sum(pi$area_sqkm)#10.4009 - 14.622.27 KM2 14622.11
sum (sde$area_sqkm)#7.917538 29960.89
sum(mi$area_sqkm) #1.871284  2504.844
sum(usust$area_sqkm)#46.48217 133666.6
sum(ou$area_sqkm)  #0

#to
to<- sbf[sbf$uf  =="TO",]
sum(to$area_sqkm)
pi<-to[to$protecao  =="PROTECAO INTEGRAL",]
sde<- to[to$protecao  =="SEM DESTINACAO",]
mi <- to[to$protecao  =="USO MILITAR",]
usust <- to[to$protecao  =="USO SUSTENTAVEL",]
ou <- to[to$protecao  =="OUTROS USOS",]



## feito no R
sum(pi$area_sqkm)#10.4009 - 14.622.27 KM2 14622.11
sum (sde$area_sqkm)#7.917538 29960.89
sum(mi$area_sqkm) #1.871284  2504.844
sum(usust$area_sqkm)#46.48217 133666.6
sum(ou$area_sqkm)  #0


##amazonia legal
pi<-sbf[sbf$protecao  =="PROTECAO INTEGRAL",]
sde<- sbf[sbf$protecao  =="SEM DESTINACAO",]
mi <- sbf[sbf$protecao  =="USO MILITAR",]
usust <- sbf[sbf$protecao  =="USO SUSTENTAVEL",]
ou <- sbf[sbf$protecao  =="OUTROS USOS",]

pi$areakm2 <- as.numeric(pi$areakm2)

## feito no R
a<-sum(pi$area_sqkm)#10.4009 - 14.622.27 KM2 14622.11
b<-sum (sde$area_sqkm)#7.917538 29960.89
c<-sum(mi$area_sqkm) #1.871284  2504.844
d<-sum(usust$area_sqkm)#46.48217 133666.6
e<-sum(ou$area_sqkm)  #0  0

ad<- (a+b+c+d+e)
w<- sum(x$area_sqkm)#area da amazonia legal

sem_classifica<- w-ad
sem_classifica
f<- (1.778 /5.088572)*100

setwd("C:/Users/gessi/Downloads/estagio-docs/AM/ibge/BR_Municipios_2020")
mun <- readOGR(dsn = '.' , layer = 'BR_Municipios_2020', encoding = "UTF-8")
m <- shapefile('BR_Municipios_2020.shp')
crs(m)
m$area_sqkm <- area(m) / 1000000

at<- as.data.frame (m)

epa  <- m[m$SIGLA_UF  =="PA",]
err  <- m[m$SIGLA_UF  =="RR",]
ero  <- m[m$SIGLA_UF  =="RO",]
emt  <- m[m$SIGLA_UF  =="MT",]
ema  <- m[m$SIGLA_UF  =="MA",]
eap  <- m[m$SIGLA_UF  =="AP",]
eam  <- m[m$SIGLA_UF  =="AM",]
eac  <- m[m$SIGLA_UF  =="AC",]
eto  <- m[m$SIGLA_UF  =="TO",]

sum(eto$area_sqkm)
sum(epa$area_sqkm)
sum(err$area_sqkm)

##areas não designadas
#area do estado -todas as areas do sbf para cada estado
sdrr <-sum(err$area_sqkm) - sum(rr$area_sqkm)
sdrr

sdro <-sum(ero$area_sqkm) - sum(ro$area_sqkm)
sdro


sdto <-sum(eto$area_sqkm) - sum(to$area_sqkm)
sdto

sdpa<-sum(epa$area_sqkm)-sum(pa$area_sqkm)
sdpa


sdma<-sum(ema$area_sqkm)-sum(ma$area_sqkm)
sdma

sdac<-sum(eac$area_sqkm)-sum(ac$area_sqkm)
sdac

sdam<-sum(eam$area_sqkm)-sum(am$area_sqkm)
sdam

sdap<-sum(eap$area_sqkm)-sum(ap$area_sqkm)
sdap

sdmt<-sum(emt$area_sqkm)-sum(mt$area_sqkm)
sdmt



##abrir csv

setwd("C:/Users/gessi/Downloads/estagio-docs/")
sbff <- read.csv("sbf_porc2.csv", sep = ";", dec = ".")
#sbff<-t(sbff)

#salvando em csv
setwd("C:/Users/gessi/Downloads/estagio-docs/") #diretório que eu quero uilizar
write.csv(sbff,'sbf_porc2.csv')


setwd("C:/Users/gessi/Downloads/estagio-docs/")
sbff <- read.csv("sbf_porc2.csv", sep = ";", dec = ".")


sbff$por_ndes<- (sbff$nao_desig / sbff$area_km) * 100
sbff$porc_pi<- (sbff$sbf_pi / sbff$area_km) * 100
sbff$porc_sde<- (sbff$sbf_sde/ sbff$area_km) * 100
sbff$porc_mil<- (sbff$sbf_mil/ sbff$area_km) * 100
sbff$porc_sust<- (sbff$sbf_sust/ sbff$area_km) * 100
sbff$porc_out<- (sbff$sbf_outros/ sbff$area_km) * 100


sum(sbff$sbf_pi)
sum(sbff$sbf_sde)



setwd("C:/Users/gessi/Downloads/estagio-docs/")
est <- readOGR(dsn = '.' , layer = 'estados_2010', encoding = "UTF-8")
to <- est[est$sigla =="TO",] 

#salvando em shMTefile
setwd("C:/Users/gessi/Downloads/estagio-docs/TO")
writeOGR (to, ".", "est_to", driver = "ESRI Shapefile")


