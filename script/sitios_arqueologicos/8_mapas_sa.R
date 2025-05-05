#pontos endios 
setwd("C:/Users/gessi/shapes_amazonia_legal/")
sit <- readOGR(dsn = '.' , layer = 'sitios_arq_amazon', encoding = "UTF-8")


#amazonia 
setwd("C:/Users/gessi/Downloads/estagio-docs/")
aml <- readOGR(dsn = '.' , layer = 'amazonia_legal_ibge', encoding = "UTF-8")
#plot(aml)

end<-spTransform(sit,crs(aml))

#indigena
setwd("C:/Users/gessi/Downloads/estagio-docs/amazonia_legal/")
ind <- readOGR(dsn = '.' , layer = 'terra_indigena_funai', encoding = "UTF-8")

ind<-spTransform(ind,crs(aml))

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


plot(aml)
#plot(sit, add=T, pch=20, cex=0.5,col="gray38", border = NA)
plot(ho, add=T, col = adjustcolor("darksalmon", alpha.f =  0.5), border = NA)
plot(nho, add=T, col = adjustcolor("violetred4", alpha.f =  0.5), border = NA)
plot(si, add=T, col = adjustcolor("tan4", alpha.f =  0.5) , border = NA)
plot(do, add=T, col = adjustcolor("violetred1", alpha.f =  0.5), border = NA)
plot(re, add=T, col = adjustcolor("firebrick", alpha.f =  0.5), border = NA)

plot(aml)
##mais escuro 
plot(ho, add=T, col = "darksalmon", border = NA)
plot(nho, add=T, col = "violetred4", border = NA)
plot(si, add=T, col = "tan4",  border = NA)
plot(do, add=T, col = "violetred1",  border = NA)
plot(re, add=T, col = "firebrick", border = NA)

plot(aml, add=T) #tamanho é cex=1.5
plot(sit, add=T, pch=21,cex=0.7,col="black", bg="gray60")


#urabano 
setwd("C:/Users/gessi/Downloads/estagio-docs/amazonia_legal/ibge")
urb <- readOGR(dsn = '.' , layer = 'area_urbanizada_ibge', encoding = "UTF-8")
urb<-spTransform(urb,crs(aml))
plot(aml)

#plot(sit, add=T, pch=20,cex=0.5, col="cyan2", border = NA)
plot(urb,add=T, col = adjustcolor("red4", alpha.f =  0.5), border = NA)


#escuro
plot(urb,add=T, col = "red4",  border = NA)

plot(sit, add=T, pch=21,cex=0.7,col="black", bg="gray60")
plot(aml, add=T) #tamanho é cex=1.5

##assentamneto  e quilombola
setwd("C:/Users/gessi/Downloads/estagio-docs/amazonia_legal/incra")
ass <- readOGR(dsn = '.' , layer = 'assentamento_incra', encoding = "UTF-8")
qui <- readOGR(dsn = '.' , layer = 'quilombola_incra', encoding = "UTF-8")
ass<-spTransform(ass,crs(aml))
qui<-spTransform(qui,crs(aml))
plot(aml)

#plot(sit, add=T, pch=20,cex=0.5, col="gray38", border = NA)
plot(ass,add=T, col = adjustcolor("rosybrown", alpha.f =  0.5), border = NA)
plot(qui,add=T, col = adjustcolor("darkorange3", alpha.f =  0.5), border = NA)


#mais escuro
plot(ass,add=T, col = "rosybrown",  border = NA)
plot(qui,add=T, col = "darkorange3",  border = NA)


plot(sit, add=T, pch=21,cex=0.7,col="black", bg="gray60")

plot(aml, add=T) #tamanho é cex=1.5

#sfb 
sbf <- readOGR(dsn = '.' , layer = 'assentamento_incra', encoding = "UTF-8")
sbf<-spTransform(sbf,crs(aml))

pi<-sbf[sbf$protecao  =="PROTECAO INTEGRAL",]
sde<- sbf[sbf$protecao  =="SEM DESTINACAO",]
mi <- sbf[sbf$protecao  =="USO MILITAR",]
usust <- sbf[sbf$protecao  =="USO SUSTENTAVEL",]
ou <- sbf[sbf$protecao  =="OUTROS USOS",]


plot(aml)
#plot(sit, add=T, pch=20, cex=0.5,col="gray38", border = NA)
plot(pi, add=T, col = adjustcolor("chartreuse", alpha.f =  0.5), border = NA)
plot(sde, add=T, col = adjustcolor("mediumpurple4", alpha.f =  0.5), border = NA)
plot(mi, add=T, col = adjustcolor("darkgreen", alpha.f =  0.5) , border = NA)
plot(usust, add=T, col = adjustcolor("lightseagreen", alpha.f =  0.5), border = NA)
plot(ou, add=T, col = adjustcolor("red", alpha.f =  0.5), border = NA)



#mais escuro
plot(pi, add=T, col = "chartreuse",  border = NA)
plot(sde, add=T, col = "mediumpurple4",  border = NA)
plot(mi, add=T, col = "darkgreen",  border = NA)
plot(usust, add=T, col = "lightseagreen",  border = NA)
plot(ou, add=T, col = "red",border = NA)

plot(aml, add=T) #tamanho é cex=1.5

plot(sit, add=T, pch=21,cex=0.7,col="black", bg="gray60")

###sicar

mf <-readOGR(dsn = '.' , layer = 'mf_sicar', encoding = "UTF-8")
mf<-spTransform(mf,crs(aml))
p<- readOGR(dsn = '.' , layer = 'p_sicar', encoding = "UTF-8")
p<-spTransform(p,crs(aml))
m<- readOGR(dsn = '.' , layer = 'm_sicar', encoding = "UTF-8")
m<-spTransform(m,crs(aml))
g<- readOGR(dsn = '.' , layer = 'g_sicar', encoding = "UTF-8")
g<-spTransform(g,crs(aml))

plot(aml)

#plot(sit, add=T, pch=20, cex=0.5,col="gray38", border = NA)
#plot(mf, add=T, col = adjustcolor("gold", alpha.f =  0.5), border = NA)
#plot(p, add=T, col = adjustcolor("goldenrod3", alpha.f =  0.5), border = NA)
#plot(m, add=T, col = adjustcolor("goldenrod4", alpha.f =  0.5), border = NA)
#plot(g, add=T, col = adjustcolor("saddlebrown", alpha.f =  0.5), border = NA)


#mais escuro
plot(g, add=T, col = "saddlebrown",  border = NA)
plot(m, add=T, col = "goldenrod4",  border = NA)
plot(p, add=T, col = "goldenrod3",  border = NA)
plot(mf, add=T, col = "gold", border = NA)

plot(aml, add=T) #tamanho é cex=1.5

plot(sit, add=T, pch=21,cex=0.7,col="black", bg="gray60")
