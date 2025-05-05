
### amazonia legal ##
setwd("C:/Users/gessi/shapes_amazonia_legal/")
aml<- readOGR(dsn = '.' , layer = 'amazonia_legal_ibge')


#abrir os dados de terras indigeneas FUNAI 
#foram baixados divididos  por classificação- para o Brasil
#1-abrir os arquivos
#2-UNIR
#3-CORTAR PARA AMAZONIA LEGAL 
#também da para unir no Qgis : vetor-gerenciar dados - mesclar camadas vetoriais
#para cortar: vetor- geoprocessamento - recortar

#projeção do arquivo
crs: +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs 

#dado baixado/link download: https://www.gov.br/funai/pt-br/atuacao/terras-indigenas/geoprocessamento-e-mapas

#homologadas
setwd(".../funai/terra_ind_homologadas/")
tih <- readOGR(dsn = '.' , layer = 'terra_ind_homologadas')

#nao homologadas
setwd(".../funai/terra_ind_nao_homologadas/")
tinh <- readOGR(dsn = '.' , layer = 'terra_ind_nao_homologadas')

#dominais 
setwd(".../funai/terras_dominiais_indig/")
tid <- readOGR(dsn = '.' , layer = 'terras_dominiais_indig')


##sob interdição 
setwd(".../funai/areas_sob_interdicao/")
tiint <- readOGR(dsn = '.' , layer = 'areas_sob_interdicao')

##reserva_indig 
setwd(".../funai/reserva_indig/")
ri <- readOGR(dsn = '.' , layer = 'reserva_indig')


#unir os shapes
ind<-rbind(tih, tinh, tid, tiint, ri)


#cotar para a amazonia legal 
todos_ind <- crop(ind, aml, snap = 'out')

#salvar terras indigenas para amazonia legal
setwd(".../shapes_amazonia_legal/")
writeOGR (todos_ind, ".", "terra_indigena_funai", driver = "ESRI Shapefile")



##########sistema de florestas publicas-SBF##############
#OS arquivos foram baixados por estado
#link download:https://www.florestal.gov.br/cadastro-nacional-de-florestas-publicas/127-informacoes-florestais/cadastro-nacional-de-florestas-publicas-cnfp/2050-cadastro-nacional-de-florestas-publicas-atualizacao-2020
#projeção: crs: +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs 
#1-abrir os arquivos
#2-UNIR os estados da amazonia legal

#abrir os estados
#ex:roraima
setwd(".../sfb/estados/")
cnfp_RR <- readOGR(dsn = '.' , layer = 'CNFP_2020_RR')


#unir os shapes
sbf <-rbind(cnfp_RR, ...)

#salvar sbf para amazonia legal
setwd(".../shapes_amazonia_legal/")
writeOGR (sbf , ".", "area_conservada_sfb", driver = "ESRI Shapefile")

## fiz isso no qgis

##########------Incra---##############
#OS arquivos foram baixados por estado
#projeção: crs: +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs 
#1-abrir os arquivos
#2-UNIR os estados da amazonia legal

#Assentamentos 
#abrir os estados
#link download: https://certificacao.incra.gov.br/csv_shp/export_shp.py
#ex:mato grosso
setwd(".../INCRA/estados_assentamentos/")
ass_mt <- readOGR(dsn = '.' , layer = 'Assentamento Brasil_MT')

#unir os shapes
ass <-rbind(ass_mt, ...)

#salvar sbf para amazonia legal
setwd("C:/Users/gessi/shapes_amazonia_legal/")
writeOGR (ass , ".", "assentamento_incra", driver = "ESRI Shapefile")

##quilombola
#link download: https://certificacao.incra.gov.br/csv_shp/export_shp.py
#abrir os estados
setwd(".../INCRA/estados_quilombolas")
qui_mt <- readOGR(dsn = '.' , layer = 'Áreas de Quilombolas_MT')

#unir os shapes
qui <-rbind(qui_mt, ...)

#salvar qui para amazonia legal
setwd("C:/Users/gessi/shapes_amazonia_legal/")
writeOGR (qui , ".", "quilombola_incra", driver = "ESRI Shapefile")

#fiz no qgis

##########- areas urbanizadas--IBGE  ##############
#OS arquivos foram baixados para o Brasil
#projeção: crs: +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs  
#1-abrir os arquivos
#2-UNIR os estados da amazonia legal
#3-CORTAR PARA AMAZONIA LEGAL 

#link download: https://www.ibge.gov.br/geociencias/cartas-e-mapas/redes-geograficas/15789-areas-urbanizadas.html?=&t=downloads

setwd(".../ibge/")
urb <- readOGR(dsn = '.' , layer = 'AreasUrbanizadasDoBrasil_2015_Concentracoes_Urbanas_com_mais_de_300000_habitantes')
     
setwd("C:/Users/gessi/Downloads/estagio-docs/")
urb2 <- readOGR(dsn = '.' , layer = 'AreasUrbanizadasDoBrasil_2015_Concentracoes_Urbanas_de_100000_a_300000_habitantes')

#unir os shapes
urbb<-rbind(urb, urb2)


#cotar para a amazonia legal 
todos_urb <- crop(urbb, aml, snap = 'out')

#salvar areas urbanizadas para amazonia legal
setwd("C:/Users/gessi/shapes_amazonia_legal/")
writeOGR (todos_urb, ".", "area_urbanizada_ibge", driver = "ESRI Shapefile")      


### sicar
#OS arquivos foram baixados municipios 
#projeção: crs: +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs
#1-abrir os arquivos dos municipios
#2-UNIR os municipios por estados amazonia legal 
#3-UNIR os estados da amazonia legal 
   
#link download:  https://www.car.gov.br/publico/imoveis/index

#abrir os arquivos dos municipios 
setwd(".../sicar/acre/SHAPE_1200013/AREA_IMOVEL/")
u1 <- readOGR(dsn = '.' , layer = 'AREA_IMOVEL')

#abrir todos os municipios para cada estado ....

#unir os municipios 
aim<-rbind( u1, u2, u3, u4, u5, u6,u7, u8, u9,u10,u11,u12,u13, u14, u15, u16,u17,u18, u19, u20, u21, u22, u23, u24, u25, u26, u27, u28, u29, u30,
           u31, u32, u33, u34,u35,u36,u37, u38,  u39, u40,  u41,u42,
           u43, u44, u45, u46, u47, u48, u49, u50, u51, u52, u53, u54, u55, u56, u57, u58, u59, u60, u61, u62, u63, u64, u65, u66,u67,u68,u69, u70,u71,u72,u73, u74, u75, u76, u77, u78, u79, u80, u81, u82, u83, u84, u85, u86, u87, u88, u89, u90, u91, u92, u93, u94,  u95, u96, u97, u98, u99, u100, u101, u102, u103, u104, u105, u106, u107, u108, u109, u110, u111, u112, u113, u114, u115, u116, u117, u118, u119, u120, u121, u122, u123, u124, u125,u126, u127, u128, u129, u130, u131, u132,u133, u134, u135,u136, u137, u138, u139, u140, u141, u142)

#salvar pro estado do acre
setwd("C:/Users/gessi/shapes_amazonia_legal/sicar/estados")
writeOGR (aim, ".", "acre", driver = "ESRI Shapefile")

acre <- readOGR(dsn = '.' , layer = 'acre')

###depois salvar os estados para amazonia legal 
#unir os estados
sicar_todos<-rbind( acre, amazonia, amapa,maranhao, matogrosso, para,rondonia,roraima, tocantins)

#salvar dados rurais para amazonia legal
setwd("C:/Users/gessi/shapes_amazonia_legal/")
writeOGR (sicar_todos, ".", "area_rural", driver = "ESRI Shapefile")

#fiz no qgis as unioes dos municipios 
     
## salvar por tamanho
sicar<- readOGR(dsn = '.' , layer = 'area_rural')

sicar$tamamnho <-ifelse(sicar$NUM_MODULO <1, "mf", 
                 ifelse(sicar$NUM_MODULO  >15, "g",
                        ifelse(sicar$NUM_MODULO >= 1 & sicar$NUM_MODULO <= 4, "p",
                               ifelse(sicar$NUM_MODULO > 4  & sicar$NUM_MODULO <= 15, "m","na"))))

setwd("C:/Users/gessi/shapes_amazonia_legal/")
writeOGR (sicar, ".", "area_rural_ibge", driver = "ESRI Shapefile")

#salvar por tamanho
sicar<- readOGR(dsn = '.' , layer = 'area_rural_ibge')

mf <- sicar[sicar$tamanho  =="mf",]
writeOGR (mf, ".", "mf_sicar", driver = "ESRI Shapefile")

p<- sicar[sicar$tamanho  =="p",]
writeOGR (p, ".", "p_sicar", driver = "ESRI Shapefile")

m<- sicar[sicar$tamanho  =="m",]
writeOGR (m, ".", "m_sicar", driver = "ESRI Shapefile")

g<- sicar[sicar$tamanho  =="g",]
writeOGR (g, ".", "g_sicar", driver = "ESRI Shapefile")

## caso de erro cortar com a amazonia legal da para usar o dos estados
#IBGE 
#link download:https://www.ibge.gov.br/geociencias/organizacao-do-territorio/malhas-territoriais/15774-malhas.html?=&t=downloads

setwd("C:/Users/gessi/shapes_amazonia_legal/")
mun<- readOGR(dsn = '.' , layer = 'BR_UF_2020_ibge')

ac <- mun[mun$SIGLA_UF  =="AC",]
am <- mun[mun$SIGLA_UF  =="AM",]
ap <- mun[mun$SIGLA_UF  =="AP",]
ma <- mun[mun$SIGLA_UF  =="MA",]
mt <- mun[mun$SIGLA_UF  =="MT",]
pa <- mun[mun$SIGLA_UF  =="PA",]
rr <- mun[mun$SIGLA_UF  =="RR",]
ro <- mun[mun$SIGLA_UF  =="RO",]
to <- mun[mun$SIGLA_UF  =="TO",]

est_aml<-rbind(ac, am,ap,ma,mt,pa,rr,ro,to)

#se precisa transformar o crs
u4<-spTransform(u4,
                CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"))

#ou para deixar igua a de outro 
mn1<-spTransform(mun,crs(aml))


