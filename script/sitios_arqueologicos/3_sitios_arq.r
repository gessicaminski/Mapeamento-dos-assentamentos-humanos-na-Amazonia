#abrir sitios 
setwd(".../sitios_arqueologicos") 
end <- read.csv("AmazonArch.csv", sep = ",", dec = ".") 

#excluir linhas com na
end<-end %>% drop_na()

#excluir linhas que tem GO e PI
end<-end[!(end$SIGLA_UF== 'GO'),]
end<-end[!(end$SIGLA_UF== 'PI'),]

#acrescentando coluna com o nome do municipio e UF do estado 
#dados municipios ibge
setwd(".../shapes_amazonia_legal/")
br_mun <- readOGR(dsn = '.' , layer = 'BR_Municipios_2020', encoding = "UTF-8")

#excluindo coluna 
br_mun <- subset(br_mun, select = - AREA_KM2)
#m <- as.data.frame (br_mun,encoding = "UTF-8")

#arrumando na mesma  projeção os dados e o shape; 
#shape
br_munp<-spTransform(br_mun,
                     CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"))

#dados leia
end1<- SpatialPoints(as.data.frame(cbind(end$longitude, end$latitude)), 
                     proj4string=crs(br_munp))

#extraindo os estados e municipios do shape a partir das coords dos dados_leia
df_sarq<-sp::over(end1, br_munp)

df_sarq$longitude <- end$longitude
df_sarq$latitude <- end$latitude
df_sarq$nome <- end$Name

df_sarq<- subset(df_sarq, select = - AREA_KM2)

#arrumando a escrita da coluna modalidade
df_sarq$NM_MUN<-as.character(df_sarq$NM_MUN)
Encoding(df_sarq$NM_MUN) <- "UTF-8"

#arrumando a escrita da coluna modalidade
df_sarq$nome<-as.character(df_sarq$nome)
Encoding(df_sarq$nome) <- "UTF-8"

#salvando em csv
setwd(".../sitios_arqueologicos")
write.csv(df_sarq,'sitios_arq_amazon.csv')
