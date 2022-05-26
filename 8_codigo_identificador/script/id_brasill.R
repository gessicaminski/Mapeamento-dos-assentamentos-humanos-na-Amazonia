

#organizando tabela de dados 
getwd()   #qual diretório esta
setwd("C:/Users/gessi/Documents") #diretório que eu quero uilizar
dir()  #docs presentes neste diretório

#descobrir o id dos municipios do meu data.frame 
#a partir do data.frame(spatialpolygonsdataframe) municipios do IBGE

#organizando a minha tabela de dados 

#abrir arquivo csv
setwd("C:/Users/gessi/Documents") #diretório que eu quero uilizar
amazon <- read.csv("AmazonArch_Database_csv.csv", sep = ";", dec = ".") 
#amazon <- amazon[, -8]


#filtrar por pais= Brasil
amazon <- filter(amazon,pais == "Brasil")

#mudando nomes dos paises para sigla - conforme o site PRÒ Bandeiras
amazon <- mutate(amazon, pais =  ifelse(pais == "Brasil", "BR","bo"))

#Levels: Acre Amapa Amazonas Goias Maranhao Mato Grosso Para Rondonia  Roraima Tocantins
#Brasil tem 10 estados 

#mudando nomes dos estados para sigla - conforme o site PRÒ Bandeiras
amazon <- mutate(amazon, estado = ifelse(estado == "Acre", "AC", ifelse(estado =="Amapa", "AP",
                                ifelse(estado =="Amazonas", "AM", ifelse(estado =="Goias", "GO",
                                ifelse(estado =="Maranhao", "MA", ifelse(estado =="MatoGrosso", "MG",                                                                                                   ifelse(estado =="Para", "pa",ifelse(estado =="Rondonia","ro",
                               ifelse(estado =="Roraima", "RR","TO"))))))))))



#estados por ordem alfabética
#amazon$estado <-sort(amazon$estado)

#agrupar estados  e colocar municipios por ordem alfabética
#1- colocar estados em ordem alfabética
#2-colocar os municipios em ordem alfabética conforme seus estados 
#amazon<- amazon %>% group_by(amazon$estado~amazon$municipio_provincia)
#amazon$municipio_provincia <-sort(amazon$municipio_provincia)

#renomenado os nomes das colunas 
colnames(amazon) <- c("cod_arch", "name", "longitude", "latitude", "pais", "estado", "NM_MUN")



#abrir o shape dos municipios do IBGE
setwd("C:/Users/gessi/Documents/BR_Municipios_2020/")
am <- readOGR(dsn = '.' , layer = 'BR_Municipios_2020', encoding = "UTF-8")

#transforma o SpatialPolygonsDataFrame em data.frame
#am <- as.data.frame (am, stringsAsFactors = FALSE, encoding = "UTF-8")
am <- as.data.frame (am,encoding = "UTF-8")

#arrumando o nome dos municipios onforme utf-8, 
#antes transformar  coluna que esta como factor em character
am$NM_MUN <- as.character(am$NM_MUN)
Encoding(am$NM_MUN) <- "UTF-8"
am$CD_MUN<-as.numeric(as.character(am$CD_MUN))
class(am$NM_MUN)
class(amazon$)

#estados por ordem alfabética
#am$SIGLA_UF <-sort(am$SIGLA_UF)
am <- subset(am, select = - AREA_KM2)



#agrupar estados  e colocar municipios por ordem alfabética
#1- colocar estados em ordem alfabética
#2-colocar os municipios em ordem alfabética conforme seus estados 

#am<- am %>% group_by(SIGLA_UF) #esse é  o que da certo 

#am$NM_MUN <-sort(am$NM_MUN)



# agora relacionar os nomes dos municipios/estados para extrair
#o ID do data.frame do ibge para o meu 

am2<- merge(amazon,am,by.x="NM_MUN",by.y="NM_MUN",all.x=TRUE,all.y=TRUE)

#am2 <- subset(am2, select = - c(cod_arch,longitude,latitude, estado))


#Pracuúba  AP 	1600550
#am2$CD_MUN<-gsub(gsub("^$|^ $", NA, am2$CD_MUN))


#obs: Pracuúba não quer dar certo 
#am2 <-anti_join(am2,am2[1:6,]) #remover linhas  desse municipio por em quanto



#excluir linhas com NA
am2 <-anti_join(am2,am2[7326:12463,]) #remover linhas 


am2<-Joining, by = c("nm_mun", "cod_arch", "name", "longitude","latitude", "pais", "estado", "cod_mun","sigla_uf")

colnames(am2) <- c("nm_mun", "cod_arch", "name", "longitude", 
                   "latitude", "pais", "estado", "cod_mun","sigla_uf" )
#agrupar por estados
am2<- am2 %>% group_by(sigla_uf)


#write.csv(am2,'id_brasil_prac.csv')

#setwd("C:/Users/gessi/Documents") #diretório que eu quero uilizar
#am2<- read.csv("id_brasil_prac.csv", sep = ";", dec = ".")
#am2<- am2 %>% group_by(sigla_uf)
#cidades que deram problemas 
#arrumei no excel
#Alta Floresta D'oeste / Conquista D'oeste / Machadinho D.Oeste
#Pedra Branca do Amaparí	/ Poxoréo/Pracuuba/


#Ultimo nome esta na linha 7325


#tirando acentos
am2$nm_mun <- iconv(am2$nm_mun,to="ASCII//TRANSLIT")
am2$name <- iconv(am2$name,to="ASCII//TRANSLIT")

#deixando todas as letras  minusculas 
am2$nm_mun <- tolower(am2$nm_mun)
am2$name <- tolower(am2$name)
am2$pais <- tolower(am2$pais)
am2$sigla_uf <- tolower(am2$sigla_uf)

#tirar os - das palavras 
am2$nm_mun<-gsub("-", "",am2$nm_mun)
am2$nm_mun<-gsub("[-]", "",am2$nm_mun)

#tirar os \ das palavras 
am2$name<-gsub("[\]", "", am$name)

#tirar os () das palavras

am2$name <-gsub("[()]", "", am2$name) 

#tirando espaço
am2$name<-gsub("\\s+","",am2$name)

#organizar as colunas para fazer o codigo 
#Pais_Estado_Nome Completo_Municipio

#criando ID

am2$id<- paste((am2$pais),"_", (am2$sigla_uf),"_", (am2$name),"_",(am2$cod_mun))

#tirando espaço
am2$id<-gsub("\\s+","",am2$id)

#ver se tem algum ID igual 
am2$id2<- duplicated(am2$id)




#salvando em csv
setwd("C:/Users/gessi/Documents") #diretório que eu quero uilizar
write.csv(am2,'id_brasil.csv')
write.table(am2, file = "id_brasil2.csv", sep = "\t", na = "", quote = FALSE)
