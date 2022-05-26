#dados Leia
#abrir arquivo
#no excel substitui os espaços vazios por na
setwd("C:/Users/gessi/Documents/")
dados_leia <- read.csv("id_dados_leia4.csv", sep = ",", dec = ".") #abrir arquivo csv/esta arrumado

#excluir colunas que não serão usadas
dados_leia <- subset(dados_leia, select = - encoding )
dados_leia <- subset(dados_leia, select =  - coords.x2)
dados_leia <- subset(dados_leia, select =  - coords.x1)
dados_leia <- subset(dados_leia, select = - source_of_)
dados_leia <- subset(dados_leia, select = - X)


#abrir dados municipios ibge
setwd("C:/Users/gessi/Documents/BR_Municipios_2020/")
br_mun <- readOGR(dsn = '.' , layer = 'BR_Municipios_2020', encoding = "UTF-8")

#excluindo coluna 
br_mun <- subset(br_mun, select = - AREA_KM2)

# transformando shape em dataframe
m <- as.data.frame (br_mun,encoding = "UTF-8")

#arrumando na mesma  projecaoo dos dados e do shape dos municipios; 
#shape dos municipios
br_munp<-spTransform(br_mun,
                 CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"))


#dados leia
dados_leiap<- SpatialPoints(as.data.frame(cbind(dados_leia$x, dados_leia$y)), 
                      proj4string=CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"))




#extraindo os estados e municipios do shape a partir das coords dos dados_leia
df_leia<-sp::over(dados_leiap, br_munp)

#criando uma tabela com ambos os dados 
df_leia <-cbind(df_leia,dados_leia$x, dados_leia$y, dados_leia$name)

#como inserir as outras colunas da tabela inicail?
#df_leia$sigla <- (dados_leia$Sigla)

#formtar a tabela 
#add coluna com a sigla do pais = br
df_leia$sil <- ("br")


#renomenado os nomes das colunas 
colnames(df_leia) <- c("cod", "NM_MUN",  "estado", "longitude", "latitude", "nome", "pais")


#arrumando o nome dos municipios conforme utf-8, 
df_leia$NM_MUN <- as.character(df_leia$NM_MUN)
Encoding(df_leia$NM_MUN) <- "UTF-8"


#tirando acentos
#df_leia$NM_MUN<- iconv(df_leia$NM_MUN,to="ASCII//TRANSLIT") nao deu certo, mudou as letras 
df_leia$nome <- iconv(df_leia$nome,to="ASCII//TRANSLIT")

#tirar os pontos
df_leia$nome<-gsub("[.]", "",df_leia$nome)

#deixando todas as letras  minusculas 
df_leia$NM_MUN <- tolower(df_leia$NM_MUN)
df_leia$nome <- tolower(df_leia$nome)
df_leia$estado <- tolower(df_leia$estado)



#tirando espaço
df_leia$nome<-gsub("\\s+","",df_leia$nome)

#tirar os - das palavras 
df_leia$NM_MUN<-gsub("-", "",df_leia$NM_MUN)
df_leia$nome<-gsub("-", "",df_leia$nome)


#tirar os () das palavras
df_leia$nome<-gsub("[()]", "", df_leia$nome) 



#organizar as colunas para fazer o codigo 
#Pais_Estado_Nome Completo_Municipio

#criando ID
df_leia$id<- paste((df_leia$pais),"_", (df_leia$estado),"_", (df_leia$nome),"_",(df_leia$cod))


#tirando espaço
df_leia$id<-gsub("\\s+","",df_leia$id)



#ver se tem algum ID igual 
df_leia$id2<- duplicated(df_leia$id)


#salvando em csv
setwd("C:/Users/gessi/Documents") #diret?rio que eu quero uilizar
write.csv(df_leia,'id_dados_leia5.csv')


#criando um id para as duas tabelas
d<-df_leia
id <- rownames(d)
d <- cbind(id=id, d)

## set colnames to OP's wishes
colnames(d) <- paste0("V", 1:ncol(d))


d1<-dados_leia
id <- rownames(d1)
d1 <- cbind(id=id, d1)

## set colnames to OP's wishes
colnames(d1) <- paste0("V", 1:ncol(d1))

#juntei as duas tabelas 
newResults <- merge(x = d, y = d1, by = "V1", all.x = TRUE)


colnames(newResults) <- c("cod1","cod", "nm_mun",  "estado", "longitude", 
                          "latitude", "nome", "pais", 'id','conferir','sigla',
                          'nome1','est1','regiao','bioma','x','y')


#salvando em csv
setwd("C:/Users/gessi/Documents") #diretorio que eu quero uilizar
write.csv(newResults,'id_dados_leia_datacao.csv')

#abrindo arquivo
dados_leia5 <- read.csv("id_dados_leia_datacao.csv", sep = ",", dec = ".") #abrir arquivo csv/esta arrumado




