setwd("C:/Users/gessi/tabelas/sitios_arqueologicos")
end <- read.csv("sitios_arq.csv", sep = ",", dec = ".") 

amaid<- end
MyData <- cbind.data.frame(amaid,encoding = "UTF-8")


#convert data to shapefile    

WGScoor<-  MyData
coordinates(WGScoor)=~longitude+latitude
proj4string(WGScoor)<- CRS("+proj=longlat +datum=WGS84")


#salvando em shapefile
setwd("C:/Users/gessi/shapes_amazonia_legal/")
writeOGR (WGScoor, ".", "sitios_arq_amazon", driver = "ESRI Shapefile")


