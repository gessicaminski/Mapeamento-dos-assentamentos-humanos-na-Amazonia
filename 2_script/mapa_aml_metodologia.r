#abrir amazonia legal
setwd("C:/Users/gessi/Downloads/estagio-docs/lista_de_municipios_da_Amazonia_Legal_2020_SHP")
bio<- readOGR(dsn = '.' , layer = 'amazonia_legal_ibge')

#abrir estados do brasil
setwd("C:/Users/gessi/shapes_amazonia_legal/")
mun<- readOGR(dsn = '.' , layer = 'BR_UF_2020_ibge')

#mesma projeção
mn1<-spTransform(mun,crs(bio))

#plotar mapa

plot(bio, add=T)

plot(bio[bio$SIGLA_UF == "AM",], add=T, col = adjustcolor("darkolivegreen3", alpha.f =  0.7))
plot(bio[bio$SIGLA_UF == "MT",], add=T, col = adjustcolor("darkgreen", alpha.f =  0.7))     
plot(bio[bio$SIGLA_UF == "MA",], add=T, col = adjustcolor("darkgoldenrod3", alpha.f =  0.7))    
plot(bio[bio$SIGLA_UF == "RR",], add=T, col = adjustcolor("gold", alpha.f =  0.7))    
plot(bio[bio$SIGLA_UF == "RO",], add=T, col = adjustcolor("aquamarine2", alpha.f =  0.7))   
plot(bio[bio$SIGLA_UF == "TO",], add=T, col = adjustcolor("mediumpurple1", alpha.f =  0.7))
plot(bio[bio$SIGLA_UF == "PA",], add=T, col = adjustcolor("indianred", alpha.f =  0.7))
plot(bio[bio$SIGLA_UF == "AP",], add=T, col = adjustcolor("lightgoldenrod4", alpha.f =  0.7))
plot(bio[bio$SIGLA_UF == "AC",], add=T, col = adjustcolor("red", alpha.f =  0.7))
 
#separar os outros estados do brasil

s <- mn1 [mn1$SIGLA_UF=="SP",]
p <- mn1 [mn1$SIGLA_UF=="PR",]
a <- mn1 [mn1$SIGLA_UF=="AL",]
b <- mn1 [mn1$SIGLA_UF=="BA",]
c <- mn1 [mn1$SIGLA_UF=="CE",]
d <- mn1 [mn1$SIGLA_UF=="DF",]
e <- mn1 [mn1$SIGLA_UF=="ES",]
f <- mn1 [mn1$SIGLA_UF=="GO",]
g <- mn1 [mn1$SIGLA_UF=="MG",]
h <- mn1 [mn1$SIGLA_UF=="MS",]
i <- mn1 [mn1$SIGLA_UF=="PB",]
j <- mn1 [mn1$SIGLA_UF=="PE",]
k <- mn1 [mn1$SIGLA_UF=="PI",]
l <- mn1 [mn1$SIGLA_UF=="RJ",]
m <- mn1 [mn1$SIGLA_UF=="RN",]
n <- mn1 [mn1$SIGLA_UF=="RS",]
o <- mn1 [mn1$SIGLA_UF=="SC",]
q <- mn1 [mn1$SIGLA_UF=="SE",]

#juntar
est<-rbind( s,p,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,q)
plot(est, add=T)

