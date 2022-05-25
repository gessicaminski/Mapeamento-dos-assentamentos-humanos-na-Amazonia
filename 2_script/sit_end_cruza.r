## cruzamento dos sitios com os dados das comunidades aatuais 
#para ver se algum ponto coincide, mas não teve 
setwd("C:/Users/gessi/tabelas/sitios_arqueologicos") 
sit <- read.csv("sitios_arq_amazon.csv", sep = ",", dec = ".") 


setwd("C:/Users/gessi/shapes_amazonia_legal/")
sit <- readOGR(dsn = '.' , layer = 'sitios_arq_amazon', encoding = "UTF-8")

plot(sit)       
          
##abrir endereços ibge
setwd("C:/Users/gessi/tabelas/comunidades_tradicionais") 
end <- read.csv("com_tradicionais_ibge.csv", sep = ",", dec = ".")

#acrescentando codico do UF dos estados para sigla
#11, 12, 13 , 14,15, 16 , 17, 21,51 
end$UF <-ifelse(end$COD_UF == 12, "AC", ifelse(end$COD_UF == 11, "RO",
          ifelse(end$COD_UF ==13, "AM", ifelse(end$COD_UF ==14, "RR",
       ifelse(end$COD_UF ==15, "PA",ifelse(end$COD_UF ==16, "AP",  
       ifelse(end$COD_UF==17, "TO",ifelse(end$COD_UF == 21,"MA","MT"))))))))

#arrumando na mesma  projeção os dados e o shape; 
#shape
sit<-spTransform(sit,
                     CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"))

#dados leia
end1<- SpatialPoints(as.data.frame(cbind(end$LONGITUDE, end$LATITUDE)), 
                     proj4string=crs(sit))


#extraindo os estados e municipios do shape a partir das coords dos dados_leia
df_sit<-sp::over(end1, sit)

#criando nova coluna na tabela end dos endereços e colocando os dados da coluna modalidades
end$m<- df_sit$cruz

# onde tiver NA é 0  se não é 1 
end$m<- ifelse(is.na(df_sit$cruz), 0,1)

#salvando em csv
setwd("C:/Users/gessi/tabelas/")  #diretório que eu quero uilizar
write.csv(cruz,'df_sit_cruz.csv')









