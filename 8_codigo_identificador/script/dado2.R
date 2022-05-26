
#abrindo shape dos municipios
setwd ("/home/sitios/shapefile/ibge/BR_Municipios_2020")
am <- readOGR(dsn = '.' , layer = 'BR_Municipios_2020', encoding = "UTF-8")

#exclui a coluna de area- não sera utilizada 
am <- subset(am, select = - AREA_KM2)

#abrindo arquivo csv
setwd("/home/sitios/id")
dados1 <- read.csv("Dados_LEIA_Sigla_csv.csv", sep = ",", dec = ".") #abrir arquivo csv

#trocando vazio por NA
dados1$Estado[dados1$Estado==""] <- NA

dados1$Municipio[dados1$Municipio==""] <- NA
dados1$Municipio

#excluindo linhas contem espaço vazio 
dados1<- dados1[!(dados1$X == ""), ]
dados1<- dados1[!(dados1$Y == ""), ]

#coferindo a classe
class(dados1$X) #factor
class(dados1$Y)#factor


#colocando na mesma projeção

am<-spTransform(am,
                 CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"))


objt <- SpatialPoints(as.data.frame(cbind(dados1$X, dados1$Y)), 
                      proj4string=CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"))


#extraindo os estados e municipios do shape a partir das coords dos dados_leia
df<-sp::over(objt, am)

#criando uma tabela com ambos os dados 
df1<-cbind(df, dados1$X, dados1$Y, dados1$Nome)

#formtar a tabela 
#add coluna com a sigla do pais = br
df1$pais <- ("br")



#renomenado os nomes das colunas 
colnames(df1) <- c("cod_mun", "NM_MUN",  "estado", "longitude", "latitude", "nome", "pais")


#formatando tabela
#arrumando o nome dos municipios onforme utf-8, 
df1$NM_MUN <- as.character(df1$NM_MUN)
Encoding(df1$NM_MUN) <- "UTF-8"


#tirando acentos
#df1$NM_MUN<- iconv(df1$NM_MUN,to="ASCII//TRANSLIT") não deu certo, mudou as letras 
df1$nome <- iconv(df1$nome,to="ASCII//TRANSLIT")

#tirar os pontos
df1$nome<-gsub("[.]", "",df1$nome)

#deixando todas as letras  minusculas 
df1$NM_MUN <- tolower(df1$NM_MUN)
df1$nome <- tolower(df1$nome)
df1$estado <- tolower(df1$estado)



#tirando espaço
df1$nome<-gsub("\\s+","",df1$nome)

#tirar os - das palavras 
df1$NM_MUN<-gsub("-", "",df1$NM_MUN)
df1$nome<-gsub("-", "",df1$nome)


#tirar os () das palavras
df1$nome<-gsub("[()]", "", df1$nome) 



#organizar as colunas para fazer o codigo 
#Pais_Estado_Nome Completo_Municipio

#criando ID
df1$id<- paste((df1$pais),"_", (df1$estado),"_", (df1$nome),"_",(df1$cod))


#tirando espaço
df1$id<-gsub("\\s+","",df1$id)

#ver se tem algum ID igual 
df1$id2<- duplicated(df1$id)



#juntando os dados da tabela inicial com a final
d<-dados1
id <- rownames(d)
d <- cbind(id=id, d)

## set colnames to OP's wishes
colnames(d) <- paste0("V", 1:ncol(d))


d1<-df1
id <- rownames(d1)
d1 <- cbind(id=id, d1)

## set colnames to OP's wishes
colnames(d1) <- paste0("V", 1:ncol(d1))

#juntei as duas tabelas 
newResults <- merge(x = d, y = d1, by = "V1", all.x = TRUE)

#exclui a coluna de area- não sera utilizada 
newResults <- subset(newResults, select = - V1)

#renomeando as colunas- onde tem inicialsão os dados da tabela inicial
colnames(newResults) <- c("nome_inicial","long_inicial", "lat_incial",  "est_inicial", "mun_inicial", 
                           "cod_mun", "nm_mun",  "estado", "longitude", "latitude", "nome", "pais", "id", "id_duplicado")


#salvando em csv
setwd("/home/sitios/id") #diretório que eu quero uilizar
write.csv(newResults,'id_dados.csv')




