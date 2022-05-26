
##area em km2 de cada estado
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


sum(err$area_sqkm) 

sum(ero$area_sqkm) 

sum(eto$area_sqkm) 

sum(epa$area_sqkm)

sum(ema$area_sqkm)

sum(eac$area_sqkm)

sum(eam$area_sqkm)

sum(eap$area_sqkm)

sum(emt$area_sqkm)


##total da amazonialegal =  5.083.377
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