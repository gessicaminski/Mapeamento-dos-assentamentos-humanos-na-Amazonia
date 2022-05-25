#estados 
setwd("C:/Users/gessi/tabelas/comunidades_tradicionais") #diretório que eu quero uilizar
pos <- read.csv("tabela_0_1_com_trad.csv", sep = ",", dec = ".") 

#somou as linhas 
pos$aux<- rowSums(pos[10:26])

sum(pos$aux)# 1341564

# soma igual a 0 ou seja nenhuma camada
sc<-pos[pos$aux ==0,] #263694

amaid<- sc
MyData <- cbind.data.frame(amaid,encoding = "UTF-8")


#convert data to shapefile    

WGScoor<-  MyData
coordinates(WGScoor)=~longitude+latitude
proj4string(WGScoor)<- CRS("+proj=longlat +datum=WGS84")


#salvando em shapefile
setwd("C:/Users/gessi/Downloads/estagio-docs/")
writeOGR (WGScoor, ".", "com_trad_semclassificao", driver = "ESRI Shapefile")






