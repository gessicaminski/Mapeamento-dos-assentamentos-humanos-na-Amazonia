#colocando os estados no shape da amazonia legal
#link download: ibge.gov.br/geociencias/cartas-e-mapas/mapas-regionais/15819-amazonia-legal.html?=&t=acesso-ao-produto

setwd("C:/Users/gessi/shape_bruto/amazonia_legal_ibge/")
aml <- readOGR(dsn = '.' , layer = 'Amazonia_Legal_2020', encoding = "UTF-8")

setwd("C:/Users/gessi/shapes_amazonia_legal/")
mun<- readOGR(dsn = '.' , layer = 'BR_UF_2020_ibge')


mn1<-spTransform(mun,crs(aml))

source('C:/Users/gessi/rasterCrop.R')
aml1 <- crop(mn1, mn, snap = 'out')

plot(mn)
plot(mn1, add=T)
plot(aml)

#salvar em shapefile
setwd("C:/Users/gessi/shapes_amazonia_legal/")
writeOGR (aml1, ".", "amazonia_legal_ibge", driver = "ESRI Shapefile")