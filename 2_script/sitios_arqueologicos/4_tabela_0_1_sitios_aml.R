##após definir o uso e cobertura do solo, cruzamos esses dados com os georreferenciados dos sitios arqueologicos
#fornecidos pela amazon arch  
#cobertura e uso do solo (shapefile) x sitios (csv-dataframe)
#fizemos uma tabela de 0 e 1- 0: quando o sitio não coincide com nenhum
#1-quando o sitio esta localizado com determinado uso do solo

#abrir csv com os sitios arqueologicos
setwd("C:/Users/gessi/tabelas/sitios_arqueologicos") #diretório que eu quero uilizar
end <- read.csv("sitios_arq_amazon.csv", sep = ";", dec = ".") 


#Terras Indigenas dividas em: homologadas, não homologada, interditada, dominomial ,reserva indigena 
##terra indigena para amazonia legal
setwd("C:/Users/gessi/shapes_amazonia_legal/")
ind <- shapefile('terra_indigena_funai.shp')

#ind1<- as.data.frame(ind)

#tem estado do MS junto então precisa excluir 
ind<-ind[!(ind$uf_sigla=="MS"),]

#arrumando a escrita da coluna modalidade
ind$modalidade<-as.character(ind$modalidade)
Encoding(ind$modalidade) <- "UTF-8"

##separar as terras homologadas
h<-ind[ind$modalidade =="Tradicionalmente ocupada",]
ho<- h[h$fase_ti  =="Regularizada"| h$fase_ti  == "Homologada",]

nho<- h[h$fase_ti  =="Declarada" | h$fase_ti  ==  "Delimitada",]

si <- ind[ind$modalidade  =="Interditada",]
do <- ind[ind$modalidade=="Dominial Indígena",]
re <- ind[ind$modalidade  =="Reserva Indígena",]


#colocando  os endereços na mesma projeção das terras indg
end1<- SpatialPoints(as.data.frame(cbind(end$longitude , end$latitude)), 
                     proj4string=crs(ind))


#extraindo os estados e municipios do shape a partir das coords dos dados_leia
df_end_ti<-sp::over(end1, ho)

#criando nova coluna na tabela end dos endereços e colocando os dados da coluna modalidades
end$ti_homologadas<- df_end_ti$modalidade

# onde tiver NA é 0  se não é 1 
end$ti_homologadas<- ifelse(is.na(df_end_ti$modalidade), 0,1)


##não homologadas
#extraindo os estados e municipios do shape a partir das coords dos dados_leia
df_end_tin<-sp::over(end1, nho)

#criando nova coluna na tabela end dos endereços e colocando os dados da coluna modalidades
end$ti_n_homologadas<- df_end_tin$modalidade

# onde tiver NA é 0  se não é 1 
end$ti_n_homologadas<- ifelse(is.na(df_end_tin$modalidade), 0,1)


#terra indigena dominais
#extraindo os estados e municipios do shape a partir das coords dos dados_leia
df_end_tid<-sp::over(end1, do)

#criando nova coluna na tabela end dos endereços e colocando os dados da coluna modalidades
end$ti_dominais<- df_end_tid$modalidade

# onde tiver NA é 0  se não é 1 
end$ti_dominais<- ifelse(is.na(df_end_tid$modalidade), 0,1)


#terra indigena reserva indigena
#extraindo os estados e municipios do shape a partir das coords dos dados_leia
df_end_tir<-sp::over(end1, re)

#criando nova coluna na tabela end dos endereços e colocando os dados da coluna modalidades
end$ti_reserva_ind<- df_end_tir$modalidade

# onde tiver NA é 0  se não é 1 
end$ti_reserva_ind<- ifelse(is.na(df_end_tir$modalidade), 0,1)


#terra indigena sob interdição
#extraindo os estados e municipios do shape a partir das coords dos dados_leia
df_end_tiin<-sp::over(end1, si)

#criando nova coluna na tabela end dos endereços e colocando os dados da coluna modalidades
end$ti_interdicao<- df_end_tiin$modalidade

# onde tiver NA é 0  se não é 1 
end$ti_interdicao<- ifelse(is.na(df_end_tiin$modalidade), 0,1)

###### AREAS URBANIZADAS######

# Areas urbanizadas -ibge para amazonia legal 
urb <- readOGR(dsn = '.' , layer = 'area_urbanizada_ibge')

#urb<-spTransform(urb,
#                 CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"))

#colocando  os endereços na mesma projeção das terras indg
end1<- SpatialPoints(as.data.frame(cbind(end$longitude , end$latitude)), 
                     proj4string=crs(urb))

#extraindo os estados e municipios do shape a partir das coords dos dados_leia
df_end_urb<-sp::over(end1, urb)

#criando nova coluna na tabela end dos endereços e colocando os dados da coluna modalidades
end$area_urbanizada<- df_end_urb$Tipo

# onde tiver NA é 0  se não é 1 
end$area_urbanizada<- ifelse(is.na(df_end_urb$Tipo), 0,1)


####### ASSENTAMENTOS########
#### abrir arquivos incra - assentamento 
ass <- readOGR(dsn = '.' , layer = 'assentamento_incra')

#ass<-spTransform(ass,
#                CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"))

#colocando  os endereços na mesma projeção das terras indg
end1<- SpatialPoints(as.data.frame(cbind(end$longitude , end$latitude)), 
                     proj4string=crs(ass))

#extraindo os estados e municipios do shape a partir das coords dos dados_leia
df_end_ass<-sp::over(end1, ass)

#criando nova coluna na tabela end dos endereços e colocando os dados da coluna modalidades
end$assentamento<- df_end_ass$descricao_

# onde tiver NA é 0  se não é 1 
end$assentamento<- ifelse(is.na(df_end_ass$descricao_), 0,1)

####### QUILOMBOLA########
#### abrir arquivos incra - QUILOMBO 
qui <- readOGR(dsn = '.' , layer = 'quilombola_incra')

#qui<-spTransform(qui,
#         CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"))

#colocando  os endereços na mesma projeção das terras indg
end1<- SpatialPoints(as.data.frame(cbind(end$longitude , end$latitude)), 
                     proj4string=crs(qui))

#extraindo os estados e municipios do shape a partir das coords dos dados_leia
df_end_qui<-sp::over(end1, qui)

#criando nova coluna na tabela end dos endereços e colocando os dados da coluna modalidades
end$quilombola<- df_end_qui$layer

# onde tiver NA é 0  se não é 1 
end$quilombola<- ifelse(is.na(df_end_qui$layer), 0,1)


####### SISTEMA FLORESTAL BRASILEIRO ########
# dividido em proteção integral , area sustentável , sem destinação, outros  e militar

#### abrir arquivos sbf
sbf <- readOGR(dsn = '.' , layer = 'area_conservada_sfb')

#sbf<-spTransform(sbf,
#             CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"))

#colocando  os endereços na mesma projeção das terras indg
end1<- SpatialPoints(as.data.frame(cbind(end$longitude , end$latitude)), 
                     proj4string=crs(sbf))


##area de proteção integral
pi<-sbf[sbf$protecao  =="PROTECAO INTEGRAL",]

#extraindo os estados e municipios do shape a partir das coords dos dados_leia
df_end_pi<-sp::over(end1, pi)

#criando nova coluna na tabela end dos endereços e colocando os dados da coluna modalidades
end$pi_sbf<- df_end_pi$protecao

# onde tiver NA é 0  se não é 1 
end$pi_sbf<- ifelse(is.na(df_end_pi$protecao), 0,1)


##area de uso sustentável
us<-sbf[sbf$protecao  =="USO SUSTENTAVEL",]

#extraindo os estados e municipios do shape a partir das coords dos dados_leia
df_end_us<-sp::over(end1, us)

#criando nova coluna na tabela end dos endereços e colocando os dados da coluna modalidades
end$us_sbf<- df_end_us$protecao

# onde tiver NA é 0  se não é 1 
end$us_sbf<- ifelse(is.na(df_end_us$protecao), 0,1)


##area sem destinação
sd<-sbf[sbf$protecao  =="SEM DESTINACAO",]

#extraindo os estados e municipios do shape a partir das coords dos dados_leia
df_end_sd<-sp::over(end1, sd)

#criando nova coluna na tabela end dos endereços e colocando os dados da coluna modalidades
end$sd_sbf<- df_end_sd$protecao

# onde tiver NA é 0  se não é 1 
end$sd_sbf<- ifelse(is.na(df_end_sd$protecao), 0,1)


##area outros usos
ou<-sbf[sbf$protecao  =="OUTROS USOS",]

#extraindo os estados e municipios do shape a partir das coords dos dados_leia
df_end_ou<-sp::over(end1, ou)

#criando nova coluna na tabela end dos endereços e colocando os dados da coluna modalidades
end$ou_sbf<- df_end_ou$protecao

# onde tiver NA é 0  se não é 1 
end$ou_sbf<- ifelse(is.na(df_end_ou$protecao), 0,1)


##area uso militar
mi<-sbf[sbf$protecao  =="USO MILITAR",]

#extraindo os estados e municipios do shape a partir das coords dos dados_leia
df_end_mi<-sp::over(end1, mi)

#criando nova coluna na tabela end dos endereços e colocando os dados da coluna modalidades
end$militar_sbf<- df_end_mi$protecao

# onde tiver NA é 0  se não é 1 
end$militar_sbf<- ifelse(is.na(df_end_mi$protecao), 0,1)

#salvando em csv
setwd("C:/Users/gessi/Downloads/estagio-docs/")
write.csv(end,'tabela_0_1_sarq.csv')


######SICAR######
#dividido por tamanhos segundo o incra pelos modulos
#minifundio, pequena, media e grande 

#### abrir arquivos da area rural
sicar<- readOGR(dsn = '.' , layer = 'area_rural_sicar')

#colocando  os endereços na mesma projeção das terras indg
end1<- SpatialPoints(as.data.frame(cbind(end$longitude , end$latitude)), 
                     proj4string=crs(sicar))

mf <- sicar[sicar$tamanho  =="mf",]
p<- sicar[sicar$tamanho  =="p",]
m<- sicar[sicar$tamanho  =="m",]
g<- sicar[sicar$tamanho  =="g",]


##minifundio 
#extraindo os estados e municipios do shape a partir das coords dos dados_leia
df_end_mf<-sp::over(end1, mf)

#criando nova coluna na tabela end dos endereços e colocando os dados da coluna modalidades
end$mf<- df_end_mf$tamanho

# onde tiver NA é 0  se não é 1 
end$mf<- ifelse(is.na(df_end_mf$tamanho), 0,1)

##pequeno
#extraindo os estados e municipios do shape a partir das coords dos dados_leia
df_end_p<-sp::over(end1, p)

#criando nova coluna na tabela end dos endereços e colocando os dados da coluna modalidades
end$p<- df_end_p$tamanho

# onde tiver NA é 0  se não é 1 
end$p<- ifelse(is.na(df_end_p$tamanho), 0,1)


##medio
#extraindo os estados e municipios do shape a partir das coords dos dados_leia
df_end_m<-sp::over(end1, m)

#criando nova coluna na tabela end dos endereços e colocando os dados da coluna modalidades
end$m<- df_end_m$tamanho

# onde tiver NA é 0  se não é 1 
end$m<- ifelse(is.na(df_end_m$tamanho), 0,1)


###grande
#extraindo os estados e municipios do shape a partir das coords dos dados_leia
df_end_g<-sp::over(end1, g)

#criando nova coluna na tabela end dos endereços e colocando os dados da coluna modalidades
end$g<- df_end_g$tamanho

# onde tiver NA é 0  se não é 1 
end$g<- ifelse(is.na(df_end_g$tamanho), 0,1)


#salvando em csv
setwd("C:/Users/gessi/tabelas/sitios_arqueologicos")
write.csv(end,'tabela_0_1_sitios_arq.csv')

#abrir
sar <- read.csv("tabela_0_1_sitios_arq.csv", sep = ",", dec = ".") 
