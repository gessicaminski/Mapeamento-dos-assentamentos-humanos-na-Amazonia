##sicar analises 
#tabela com dados po estado 
#maior problema é sobreposição dos dados que não consegui tirar 

setwd("C:/Users/gessi/Downloads/estagio-docs/") #diretório que eu quero uilizar
sicar <- read.csv("sicar_tabela.csv", sep = ",", dec = ".")

sicar$tamanho <-ifelse(sicar$NUM_MODULO <1, "mf", 
                       ifelse(sicar$NUM_MODULO  >15, "g",
                              ifelse(sicar$NUM_MODULO >= 1 & sicar$NUM_MODULO <= 4, "p",
                                     ifelse(sicar$NUM_MODULO > 4  & sicar$NUM_MODULO <= 15, "m","na"))))

sum(sicar$area_sqkm)



setwd("C:/Users/gessi/Downloads/estagio-docs/tam/t")
rr <- shapefile('roraima.shp')

crs(rr)
rr$area_sqkm <- area(rr) / 1000000  ## km²
plot(urb)

rr1<-as.data.frame((rr))

#rr1$id2<- duplicated(rr1$COD_IMOVEL)
#excluindo colunas 
rr1 <- subset( rr1, select = -c( 1 ))
rr1 <- subset( rr1, select = -c( 3))
rr1 <- subset( rr1, select = -c( 4:6))
rr1 <- subset( rr1, select = -c( 4:5))


##criar nova coluna para classificação do tamanho dasareas rurais por módulos
rr1$tam <-ifelse(rr1$NUM_MODULO <1, "mf", 
          ifelse(rr1$NUM_MODULO  >15, "g",
      ifelse(rr1$NUM_MODULO >=1 | rr1$NUM_MODULO <=4, "p",
      ifelse(rr1$NUM_MODULO >4  | rr1$NUM_MODULO <=15, "m", "na"))))

##tamanho em km2 dos tamanhso das propriedades mf, p,m e g de RR
sum(rr1$area_sqkm)# 80531.54
sum(rr1$NUM_AREA) #8058193

mf<-rr1[rr1$tam =="mf",]
p<- rr1[rr1$tam  =="p",]
m <- rr1[rr1$tam  =="m",]
g <- rr1[rr1$tam  =="g",]

## feito no R
sum(mf$area_sqkm)#
sum (p$area_sqkm)#
sum(m$area_sqkm) #
sum(g$area_sqkm)#


#####
mn<- subset(rr1, NUM_MODULO <1)
sum(mf$area_sqkm)

p<- subset(rr1, NUM_MODULO >=1 & NUM_MODULO <=4) 
sum(p$area_sqkm)

m<- subset(rr1, NUM_MODULO >4 & NUM_MODULO<=15) 
sum(m$area_sqkm)

g<- subset(rr1, NUM_MODULO >15)
sum(g$area_sqkm)


sum(err$area_sqkm)-sum(rr1$area_sqkm)



setwd("C:/Users/gessi/Downloads/estagio-docs/tam/t")
ac <- shapefile('acre.shp')
crs(ac)
ac$area_sqkm <- area(ac) / 1000000  ## km²


ac1<-as.data.frame((ac))
sum(ac1$area_sqkm)
sum(ac1$NUM_AREA)
#####
mn<- subset(ac1, NUM_MODULO <1)
sum(mf$area_sqkm)
sum(mf$NUM_AREA)

p<- subset(ac1, NUM_MODULO >=1 & NUM_MODULO <=4) 
sum(p$area_sqkm)
sum(p$NUM_AREA)

m<- subset(ac1, NUM_MODULO >4 & NUM_MODULO<=15) 
sum(m$area_sqkm)
sum(m$NUM_AREA)
g<- subset(ac1, NUM_MODULO >15)
sum(g$area_sqkm)
sum(g$NUM_AREA)
sum(eac$area_sqkm)- sum(ac1$area_sqkm)


ac1$tam <-ifelse(ac1$NUM_MODULO <1, "mf", 
      ifelse(ac1$NUM_MODULO  >15, "g",
   ifelse(ac1$NUM_MODULO >= 1 & ac1$NUM_MODULO <= 4, "p",
    ifelse(ac1$NUM_MODULO > 4  & ac1$NUM_MODULO <= 15, "m","na"))))

##tamanho em km2 dos tamanhso das propriedades mf, p,m e g de RR
sum(ac1$area_sqkm)# 80531.54
sum(ac1$NUM_AREA) #8058193

mf<-ac1[ac1$tam =="mf",]
p<- ac1[ac1$tam  =="p",]
m <- ac1[ac1$tam  =="m",]
g <- ac1[ac1$tam  =="g",]

## feito no R
sum(mf$area_sqkm)#
sum (p$area_sqkm)#
sum(m$area_sqkm) #
sum(g$area_sqkm)#

##amazonas
setwd("C:/Users/gessi/Downloads/estagio-docs/tam/t")
am <- shapefile('am.shp')
crs(am)
am$area_sqkm <- area(am) / 1000000  ## km²


am1<-as.data.frame((am))
sum(am1$area_sqkm)

mn<- subset(am1, NUM_MODULO <1)
sum(mf$area_sqkm)

p<- subset(am1, NUM_MODULO >=1 & NUM_MODULO <=4) 
sum(p$area_sqkm)

m<- subset(am1, NUM_MODULO >4 & NUM_MODULO<=15) 
sum(m$area_sqkm)

g<- subset(am1, NUM_MODULO >15)
sum(g$area_sqkm)

sum(eam$area_sqkm)- sum(am1$area_sqkm)



am1$tam <-ifelse(am1$NUM_MODULO <1, "mf", 
                 ifelse(am1$NUM_MODULO  >15, "g",
                        ifelse(am1$NUM_MODULO >= 1 & am1$NUM_MODULO <= 4, "p",
                               ifelse(am1$NUM_MODULO > 4  & am1$NUM_MODULO <= 15, "m","na"))))

##tamanho em km2 dos tamanhso das propriedades mf, p,m e g de RR

mf<-am1[am1$tam =="mf",]
p<- am1[am1$tam  =="p",]
m <- am1[am1$tam  =="m",]
g <- am1[am1$tam  =="g",]

## feito no R
sum(mf$area_sqkm)#
sum (p$area_sqkm)#
sum(m$area_sqkm) #
sum(g$area_sqkm)#


##amapa
setwd("C:/Users/gessi/Downloads/estagio-docs/tam/t")
ap <- shapefile('amap.shp')
crs(ap)
ap$area_sqkm <- area(ap) / 1000000  ## km²

ap1<-as.data.frame((ap))
sum(ap1$area_sqkm)

mn<- subset(ap1, NUM_MODULO <1)
sum(mf$area_sqkm)

p<- subset(ap1, NUM_MODULO >=1 & NUM_MODULO <=4) 
sum(p$area_sqkm)

m<- subset(ap1, NUM_MODULO >4 & NUM_MODULO<=15) 
sum(m$area_sqkm)

g<- subset(ap1, NUM_MODULO >15)
sum(g$area_sqkm)

sum(eap$area_sqkm)- sum(ap1$area_sqkm)



ap1$tam <-ifelse(ap1$NUM_MODULO <1, "mf", 
                 ifelse(ap1$NUM_MODULO  >15, "g",
                        ifelse(ap1$NUM_MODULO >= 1 & ap1$NUM_MODULO <= 4, "p",
                               ifelse(ap1$NUM_MODULO > 4  & ap1$NUM_MODULO <= 15, "m","na"))))

##tapanho em km2 dos tapanhso das propriedades mf, p,m e g de RR

mf<-ap1[ap1$tam =="mf",]
p<- ap1[ap1$tam  =="p",]
m <- ap1[ap1$tam  =="m",]
g <- ap1[ap1$tam  =="g",]

## feito no R
sum(mf$area_sqkm)#
sum (p$area_sqkm)#
sum(m$area_sqkm) #
sum(g$area_sqkm)#


##maranhão
setwd("C:/Users/gessi/Downloads/estagio-docs/tam/t")
ma <- shapefile('maranhao.shp')
ma$area_sqkm <- area(ma) / 1000000  ## km²

ma1<-as.data.frame((ma))
sum(ma1$area_sqkm)

mn<- subset(ma1, NUM_MODULO <1)
sum(mf$area_sqkm)

p<- subset(ma1, NUM_MODULO >=1 & NUM_MODULO <=4) 
sum(p$area_sqkm)

m<- subset(ma1, NUM_MODULO >4 & NUM_MODULO<=15) 
sum(m$area_sqkm)

g<- subset(ma1, NUM_MODULO >15)
sum(g$area_sqkm)

sum(ema$area_sqkm)- sum(ma1$area_sqkm)


ma1$tam <-ifelse(ma1$NUM_MODULO <1, "mf", 
                 ifelse(ma1$NUM_MODULO  >15, "g",
                        ifelse(ma1$NUM_MODULO >= 1 & ma1$NUM_MODULO <= 4, "p",
                               ifelse(ma1$NUM_MODULO > 4  & ma1$NUM_MODULO <= 15, "m","na"))))

##tmaanho em km2 dos tmaanhso das propriedades mf, p,m e g de RR

mf<-ma1[ma1$tam =="mf",]
p<- ma1[ma1$tam  =="p",]
m <- ma1[ma1$tam  =="m",]
g <- ma1[ma1$tam  =="g",]

## feito no R
sum(mf$area_sqkm)#
sum (p$area_sqkm)#
sum(m$area_sqkm) #
sum(g$area_sqkm)#


##area rural minifundio  filtrar o shape para plotar 
mn<- subset(aim_am, NUM_MODULO <1)
#filtrar no shape area p, m e g
p<- subset(aim_am, NUM_MODULO >15)
#filtrar no shape area p, m e g
p<- subset(aim_am, NUM_MODULO >=1 & NUM_MODULO <=4) 
#filtrar no shape area p, m e g
p<- subset(aim_am, NUM_MODULO >4 & NUM_MODULO<=15) 

sdam<-sum(eam$area_sqkm)-sum(am$area_sqkm)






setwd("C:/Users/gessi/Downloads/estagio-docs/tam/t")
mt <- shapefile('mt.shp')
mt$area_sqkm <- area(mt) / 1000000  ## km²

mt1<-as.data.frame((mt))
sum(mt1$area_sqkm)

mn<- subset(mt1, NUM_MODULO <1)
sum(mf$area_sqkm)

p<- subset(mt1, NUM_MODULO >=1 & NUM_MODULO <=4) 
sum(p$area_sqkm)

m<- subset(mt1, NUM_MODULO >4 & NUM_MODULO<=15) 
sum(m$area_sqkm)

g<- subset(mt1, NUM_MODULO >15)
sum(g$area_sqkm)

sum(emt$area_sqkm)- sum(mt1$area_sqkm)


mt1$tam <-ifelse(mt1$NUM_MODULO <1, "mf", 
                 ifelse(mt1$NUM_MODULO  >15, "g",
                        ifelse(mt1$NUM_MODULO >= 1 & mt1$NUM_MODULO <= 4, "p",
                               ifelse(mt1$NUM_MODULO > 4  & mt1$NUM_MODULO <= 15, "m","na"))))

##tmtanho em km2 dos tmtanhso das propriedades mf, p,m e g de RR

mf<-mt1[mt1$tam =="mf",]
p<- mt1[mt1$tam  =="p",]
m <- mt1[mt1$tam  =="m",]
g <- mt1[mt1$tam  =="g",]

## feito no R
sum(mf$area_sqkm)#
sum (p$area_sqkm)#
sum(m$area_sqkm) #
sum(g$area_sqkm)#






##para
setwd("C:/Users/gessi/Downloads/estagio-docs/tam/t")
pa <- shapefile('para.shp')
pa$area_sqkm <- area(pa) / 1000000  ## km²

pa1<-as.data.frame((pa))
sum(pa1$area_sqkm)

mn<- subset(pa1, NUM_MODULO <1)
sum(mf$area_sqkm)

p<- subset(pa1, NUM_MODULO >=1 & NUM_MODULO <=4) 
sum(p$area_sqkm)

m<- subset(pa1, NUM_MODULO >4 & NUM_MODULO<=15) 
sum(m$area_sqkm)

g<- subset(pa1, NUM_MODULO >15)
sum(g$area_sqkm)

sum(epa$area_sqkm)- sum(pa1$area_sqkm)

pa1$tam <-ifelse(pa1$NUM_MODULO <1, "mf", 
                 ifelse(pa1$NUM_MODULO  >15, "g",
                        ifelse(pa1$NUM_MODULO >= 1 & pa1$NUM_MODULO <= 4, "p",
                               ifelse(pa1$NUM_MODULO > 4  & pa1$NUM_MODULO <= 15, "m","na"))))

##tpaanho em km2 dos tpaanhso das propriedades mf, p,m e g de RR

mf<-pa1[pa1$tam =="mf",]
p<- pa1[pa1$tam  =="p",]
m <- pa1[pa1$tam  =="m",]
g <- pa1[pa1$tam  =="g",]

## feito no R
sum(mf$area_sqkm)#
sum (p$area_sqkm)#
sum(m$area_sqkm) #
sum(g$area_sqkm)#


##ro
setwd("C:/Users/gessi/Downloads/estagio-docs/tam/t")
ro <- shapefile('rondonia.shp')
ro$area_sqkm <- area(ro) / 1000000  ## km²

ro1<-as.data.frame((ro))
sum(ro1$area_sqkm)

mn<- subset(ro1, NUM_MODULO <1)
sum(mf$area_sqkm)

p<- subset(ro1, NUM_MODULO >=1 & NUM_MODULO <=4) 
sum(p$area_sqkm)

m<- subset(ro1, NUM_MODULO >4 & NUM_MODULO<=15) 
sum(m$area_sqkm)

g<- subset(ro1, NUM_MODULO >15)
sum(g$area_sqkm)

sum(ero$area_sqkm)- sum(ro1$area_sqkm)

ro1$tam <-ifelse(ro1$NUM_MODULO <1, "mf", 
                 ifelse(ro1$NUM_MODULO  >15, "g",
                        ifelse(ro1$NUM_MODULO >= 1 & ro1$NUM_MODULO <= 4, "p",
                               ifelse(ro1$NUM_MODULO > 4  & ro1$NUM_MODULO <= 15, "m","na"))))

##troanho em km2 dos troanhso das propriedades mf, p,m e g de RR

mf<-ro1[ro1$tam =="mf",]
p<- ro1[ro1$tam  =="p",]
m <- ro1[ro1$tam  =="m",]
g <- ro1[ro1$tam  =="g",]

## feito no R
sum(mf$area_sqkm)#
sum (p$area_sqkm)#
sum(m$area_sqkm) #
sum(g$area_sqkm)#



##tocantins
setwd("C:/Users/gessi/Downloads/estagio-docs/tam/t")
to <- shapefile('tocantins.shp')
to$area_sqkm <- area(to) / 1000000  ## km²

to1<-as.data.frame((to))
sum(to1$area_sqkm)

mn<- subset(to1, NUM_MODULO <1)
sum(mf$area_sqkm)

p<- subset(to1, NUM_MODULO >=1 & NUM_MODULO <=4) 
sum(p$area_sqkm)

m<- subset(to1, NUM_MODULO >4 & NUM_MODULO<=15) 
sum(m$area_sqkm)

g<- subset(to1, NUM_MODULO >15)
sum(g$area_sqkm)

sum(eto$area_sqkm)- sum(to1$area_sqkm)




to1$tam <-ifelse(to1$NUM_MODULO <1, "mf", 
                 ifelse(to1$NUM_MODULO  >15, "g",
                        ifelse(to1$NUM_MODULO >= 1 & to1$NUM_MODULO <= 4, "p",
                               ifelse(to1$NUM_MODULO > 4  & to1$NUM_MODULO <= 15, "m","na"))))

##ttoanho em km2 dos ttoanhso das ptopriedades mf, p,m e g de RR

mf<-to1[to1$tam =="mf",]
p<- to1[to1$tam  =="p",]
m <- to1[to1$tam  =="m",]
g <- to1[to1$tam  =="g",]

## feito no R
sum(mf$area_sqkm)#
sum (p$area_sqkm)#
sum(m$area_sqkm) #
sum(g$area_sqkm)#



setwd("C:/Users/gessi/Downloads/estagio-docs/") #diretório q
si <- read.csv("sicar_por.csv", sep = ";", dec = ".")

si1<-si[si$Estado  =="AC",]
si1$porc<- (si1$Valores/164173.6 ) * 100
si1$porc

si1<-si[si$Estado  =="AM",]
si1$porc<- (si1$Valores/1559169.0 ) * 100
si1$porc

si1<-si[si$Estado  =="AP",]
si1$porc<- (si1$Valores/142470.9  ) * 100
si1$porc

si1<-si[si$Estado  =="MA",]
si1$porc<- (si1$Valores/329651.5  ) * 100
si1$porc

si1<-si[si$Estado  =="MT",]
si1$porc<- (si1$Valores/903207.5  ) * 100
si1$porc

si1<-si[si$Estado  =="PA",]
si1$porc<- (si1$Valores/1245871.0 ) * 100
si1$porc

si1<-si[si$Estado  =="RR",]
si1$porc<- (si1$Valores/223644.1  ) * 100
si1$porc

si1<-si[si$Estado  =="RO",]
si1$porc<- (si1$Valores/237765.4 ) * 100
si1$porc

si1<-si[si$Estado  =="TO",]
si1$porc<- (si1$Valores/277423.6  ) * 100
si1$porc

si$porc2<-round(si$porc, 2)
sum(si1$Valores)
write.csv(si,'si_porc2.csv')

sum(si$Valores)
a<-si[si$Estado =="TO",]
sum(a$Valores)

a<- (753/6725 ) * 100
b<-round(a, 2)
b
##ggplot 
#todos
cbp1 <- c("saddlebrown","goldenrod4", "gold",  "gray64", "goldenrod3")

ggplot(si, aes(fill=Classificação, y=Valores, x=Estado)) + 
   geom_bar(position="dodge", stat="identity")+
   scale_fill_manual(values = cbp1)+
   
   
   labs(title = "Classificação das Áreas Rurais-SICAR",
        subtitle = "AC=164.173  AM= 1.559.169  AP=142.470  MA=329.651  MT=90.3207  PA=1.245.871   RO=237.765  RR=223.644  TO= 277.423  - Km²")+
   theme(plot.title = element_text(hjust= 0.5, size=16), 
         plot.subtitle = element_text(hjust= 0.0, size=9.0)) + 
   ylab("km²")


#porcentagem 
ggplot(si, aes(fill=Classificação, y=Valores, x=Estado)) + 
   geom_bar(position="fill", stat="identity")+
   scale_y_continuous(labels = scales::percent)+
   #scale_y_continuous(labels = scales::percent_format(accuracy = 1))+
   # scale_y_continuous(labels = scales::percent_format, breaks = seq(10, 100,0))+
   
   scale_fill_manual(values = cbp1)+
   
   ggtitle("Classificação das Áreas Rurais-SICAR")+ 
   
   theme(plot.title = element_text(hjust= 0.5, size=16)) + 
   xlab("Estados") + 
   ylab("Porcentagem")


#mapa
setwd("C:/Users/gessi/Downloads/estagio-docs/sbf_aml")
est <- readOGR(dsn = '.' , layer = 'aml', encoding = "UTF-8")
est<-spTransform(est,
                 CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"))
#plot(est,col='darkolivegreen1', border = NA)

setwd("C:/Users/gessi/Downloads/estagio-docs/tam/t")
um <- readOGR(dsn = '.' , layer = 'mt')
um<-spTransform(um,
                CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"))


u1 <- readOGR(dsn = '.' , layer = 'amap')
u1<-spTransform(u1,CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"))


u2 <- readOGR(dsn = '.' , layer = 'am')
u2<-spTransform(u2,CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"))

u3 <- readOGR(dsn = '.' , layer = 'para')
u3<-spTransform(u3,
                CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"))


u4 <- readOGR(dsn = '.' , layer = 'maranhao')
u4<-spTransform(u4,
              CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"))


u6 <- readOGR(dsn = '.' , layer = 'roraima')
u6<-spTransform(u6,
  CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"))
u5 <- readOGR(dsn = '.' , layer = 'rondonia')
u5<-spTransform(u5,             CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"))

u7 <- readOGR(dsn = '.' , layer = 'tocantins')
u7<-spTransform(u7,
                CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"))

u8 <- readOGR(dsn = '.' , layer = 'acre')
u8<-spTransform(u8,CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"))


u8$tam <-ifelse(u8$NUM_MODULO <1, "mf", 
                 ifelse(u8$NUM_MODULO  >15, "g",
                        ifelse(u8$NUM_MODULO >=1 | u8$NUM_MODULO <=4, "p",
                               ifelse(u8$NUM_MODULO >4  | u8$NUM_MODULO <=15, "m", "na"))))

#salvando em shMTefile
setwd("C:/Users/gessi/Downloads/estagio-docs/tam/")
writeOGR (u8, ".", "ac_t", driver = "ESRI Shapefile")

cbp1 <- c("saddlebrown","goldenrod4", "gold",  "gray64", "goldenrod3")
plot(est)

#amazonia legal

##area rural minifundio  filtrar o shape para plotar 
mn<- subset(um, NUM_MODULO <1)
plot(mn, add=T, col='gold', border = NA)
p<- subset(um, NUM_MODULO >=1 & NUM_MODULO <=4) 
plot(p, add=T, col='goldenrod3', border = NA)
#filtrar no shape area p, m e g
m<- subset(um, NUM_MODULO >4 & NUM_MODULO<=15)
plot(m, add=T, col='goldenrod4', border = NA)
g<- subset(um, NUM_MODULO >15)
plot(g, add=T, col='goldenrod4', border = NA)


##area rural minifundio  filtrar o shape para plotar 
mn<- subset(u1, NUM_MODULO <1)
plot(mn, add=T, col='gold', border = NA)
p<- subset(u1, NUM_MODULO >=1 & NUM_MODULO <=4) 
plot(p, add=T, col='goldenrod3', border = NA)
#filtrar no shape area p, m e g
m<- subset(u1, NUM_MODULO >4 & NUM_MODULO<=15)
plot(m, add=T, col='goldenrod4', border = NA)
g<- subset(u1, NUM_MODULO >15)
plot(g, add=T, col='goldenrod4', border = NA)



mn<- subset(u2, NUM_MODULO <1)
plot(mn, add=T, col='gold', border = NA)
p<- subset(u2, NUM_MODULO >=1 & NUM_MODULO <=4) 
plot(p, add=T, col='goldenrod3', border = NA)
#filtrar no shape area p, m e g
m<- subset(u2, NUM_MODULO >4 & NUM_MODULO<=15)
plot(m, add=T, col='goldenrod4', border = NA)
g<- subset(u2, NUM_MODULO >15)
plot(g, add=T, col='goldenrod4', border = NA)


mn<- subset(u3, NUM_MODULO <1)
plot(mn, add=T, col='gold', border = NA)
p<- subset(u3, NUM_MODULO >=1 & NUM_MODULO <=4) 
plot(p, add=T, col='goldenrod3', border = NA)
#filtrar no shape area p, m e g
m<- subset(u3, NUM_MODULO >4 & NUM_MODULO<=15)
plot(m, add=T, col='goldenrod4', border = NA)
g<- subset(u3, NUM_MODULO >15)
plot(g, add=T, col='goldenrod4', border = NA)



mn<- subset(u4, NUM_MODULO <1)
plot(mn, add=T, col='gold', border = NA)
p<- subset(u4, NUM_MODULO >=1 & NUM_MODULO <=4) 
plot(p, add=T, col='goldenrod3', border = NA)
#filtrar no shape area p, m e g
m<- subset(u4, NUM_MODULO >4 & NUM_MODULO<=15)
plot(m, add=T, col='goldenrod4', border = NA)
g<- subset(u4, NUM_MODULO >15)
plot(g, add=T, col='goldenrod4', border = NA)



mn<- subset(u5, NUM_MODULO <1)
plot(mn, add=T, col='gold', border = NA)
p<- subset(u5, NUM_MODULO >=1 & NUM_MODULO <=4) 
plot(p, add=T, col='goldenrod3', border = NA)
#filtrar no shape area p, m e g
m<- subset(u5, NUM_MODULO >4 & NUM_MODULO<=15)
plot(m, add=T, col='goldenrod4', border = NA)
g<- subset(u5, NUM_MODULO >15)
plot(g, add=T, col='goldenrod4', border = NA)




mn<- subset(u6, NUM_MODULO <1)
plot(mn, add=T, col='gold', border = NA)
p<- subset(u6, NUM_MODULO >=1 & NUM_MODULO <=4) 
plot(p, add=T, col='goldenrod3', border = NA)
#filtrar no shape area p, m e g
m<- subset(u6, NUM_MODULO >4 & NUM_MODULO<=15)
plot(m, add=T, col='goldenrod4', border = NA)
g<- subset(u6, NUM_MODULO >15)
plot(g, add=T, col='goldenrod4', border = NA)



mn<- subset(u7, NUM_MODULO <1)
plot(mn, add=T, col='gold', border = NA)
p<- subset(u7, NUM_MODULO >=1 & NUM_MODULO <=4) 
plot(p, add=T, col='goldenrod3', border = NA)
#filtrar no shape area p, m e g
m<- subset(u7, NUM_MODULO >4 & NUM_MODULO<=15)
plot(m, add=T, col='goldenrod4', border = NA)
g<- subset(u7, NUM_MODULO >15)
plot(g, add=T, col='goldenrod4', border = NA)



mn<- subset(u8, NUM_MODULO <1)
plot(mn, add=T, col='gold', border = NA)
p<- subset(u8, NUM_MODULO >=1 & NUM_MODULO <=4) 
plot(p, add=T, col='goldenrod3', border = NA)
#filtrar no shape area p, m e g
m<- subset(u8, NUM_MODULO >4 & NUM_MODULO<=15)
plot(m, add=T, col='goldenrod4', border = NA)
g<- subset(u8, NUM_MODULO >15)
plot(g, add=T, col='goldenrod4', border = NA)


plot(est,lwd=0.5, add=T)




setwd("C:/Users/gessi/Downloads/estagio-docs/")
sicar<- readOGR(dsn = '.' , layer = 'sicar')


setwd("C:/Users/gessi/Downloads/estagio-docs/dados explorados/qgis/sicar/tamanhos/AREA_IMOVEl_AC_MF")
sicar<- readOGR(dsn = '.' , layer = 'AREA_IMOVEl_AC_MF')


sicar$area_sqkm <- area(sicar) / 1000000  ## km²

si<-as.data.frame((sicar))

#salvando em csv
setwd("C:/Users/gessi/Downloads/estagio-docs/") #diretório que eu quero uilizar
write.csv(si,'sicar_tabela.csv')

setwd("C:/Users/gessi/Downloads/estagio-docs/") #diretório que eu quero uilizar
sicar <- read.csv("sicar_tabela.csv", sep = ",", dec = ".")

sicar$tamanho <-ifelse(sicar$NUM_MODULO <1, "mf", 
                       ifelse(sicar$NUM_MODULO  >15, "g",
                              ifelse(sicar$NUM_MODULO >= 1 & sicar$NUM_MODULO <= 4, "p",
                                     ifelse(sicar$NUM_MODULO > 4  & sicar$NUM_MODULO <= 15, "m","na"))))
epa  <- m[m$SIGLA_UF  =="PA",]

sum(sicar$area_sqkm)

(2100425/5088572 ) * 100

sicarp <- read.csv("sicar_por.csv", sep = ";", dec = ".")
mf <- sicarp[sicarp$Classificação  =="Grande",]
sum(mf$Valores)




389664.7
> (389664.7/5088572 ) * 100
 7.657643
 
 
 522943.3
 > (522943.3/5088572 ) * 100
 [1] 10.27682
 
 518121.8
 > (518121.8/5088572 ) * 100
 [1] 10.18207
 
 2100425
 > (2100425/5088572 ) * 100
 [1] 41.2773