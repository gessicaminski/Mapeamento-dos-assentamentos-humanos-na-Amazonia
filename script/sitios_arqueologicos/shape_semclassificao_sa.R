
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

#quantidade de linhas igual a 0 ou seja sem camada
sar0<-sar[sar$aux =="0",]  #1910

#salvando em shape
amaid<- sar0
MyData <- cbind.data.frame(amaid,encoding = "UTF-8")


#convert data to shapefile    

WGScoor<-  MyData
coordinates(WGScoor)=~longitude+latitude
proj4string(WGScoor)<- CRS("+proj=longlat +datum=WGS84")


#salvando em shapefile
setwd("C:/Users/gessi/shapes_amazonia_legal/sitios_semclassificao")
writeOGR (WGScoor, ".", "sitios_semclassificao", driver = "ESRI Shapefile")





