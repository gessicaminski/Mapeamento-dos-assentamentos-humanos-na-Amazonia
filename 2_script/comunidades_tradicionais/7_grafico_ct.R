#amazonia
#abrir tabela de pos colombiano

# hstograma stakced sitios pos colombianos 
setwd("C:/Users/gessi/tabelas/comunidades_tradicionais")
s <- read.csv("classificacao_estado_ct.csv", sep = ",", dec = ".")


sort(unique(s$modalidades))
sum(s$quantidade)#1605258

cbp1 <- c("darksalmon","violetred4","brown2" ,  "violetred1","firebrick",
          "chartreuse" ,"lightseagreen", "darkgreen","red","mediumpurple4",
          "rosybrown","darkorange3","gray",
          "gold","goldenrod3","goldenrod4","saddlebrown",
          "blue")


s$est<- factor(s$est,levels = c("AC", "AM", "AP", "MA", "MT","PA","RR","RO","TO",'AML'))

s$modalidades<- factor(s$modalidades,levels = c( "Homologada","Não Homologada","Interditada","Dominial", "Reserva Indígena",
                                         "Proteção Integral", "uso Sustentável", "Militar","Outros usos","Sem Destinação",
                                         "Assentamento", "Quilombola","Urbanizada","Rural-Minifúndio","Rural-Pequena",       
                                         "Rural-Média",  "Rural-Grande", "Sem Classificação"))

#excluir linhas que tem GO
#s<-s[!(s$est== 'AML'),]
#s<-s[s$modalidades =="AML",]


ggplot(s, aes(fill=modalidades, y=porc, x=est)) + 
  geom_bar(position="stack", stat="identity")+
  #geom_text(aes(label=quantidade), vjust=0, size=2.5) +
  # scale_color_brewer(palette = "Dark2")+
  # scale_fill_discrete(name = "Classificação do uso do Solo")+
  scale_fill_manual(values = cbp1, name = "Classificação do uso do solo")+
  
  
  labs(title = "Localização das Comunidades Tradicionais Atuais na Amazônia Legal"  )+
  theme(plot.title = element_text(hjust= 0.5, size=12)) +
  
  ##theme(axis.text.x=element_text(size=rel(1), angle=90))+
  xlab("Estados")+
  ylab("% Comunidades Tradicionais ")

+
  ggsave("classificacao_estado_ct.png")


#grafico sobreposição
todos<- data.frame( x=c('0','1','2','3','4', '5','6'),
                    classificação=c('0','1','2','3','4', '5','6'), 
                    quantidade = c(263694,363692,261156,108370,29892,2048,107))


todos$porc<- (todos$quantidade *100)/ (1147974)
todos$porc0<- round(todos$porc)
sum(todos$quantidade)
sum(todos$porc)
todos$porc2<-round(todos$porc, 2)
todos$porc0<-round(todos$porc, 0)

todos <- read.csv("sobreposicao_ct.csv", sep = ",", dec = ".")
todos <- subset(todos, select = -c(1))

cbp1 <- c("#DADAEB", "#BCBDDC", "#9E9AC8", "#807DBA",
          "#6A51A3", "#54278F", "#3F007D")
#quantidade
ggplot(todos, aes(fill=classificação, y=quantidade, x=x)) + 
  geom_bar(position="dodge", stat="identity")+
  geom_text(aes(label=quantidade), vjust=0) +
  scale_fill_manual(values = cbp1, name = "Camadas do uso do solo")+
  
  
  labs(title = "Sobreposição das Comunidades Tradicionais Atuais na Amazônia Legal")+
  theme(plot.title = element_text(hjust= 0.5, size=12)) +
  xlab("")+
  ylab("Comunidades Tradicionais ") 
+
  ggsave("sobreposicao_ct.png")




## sem destinação 
dat <- read.csv("semdestinacao_ct.csv", sep = ";", dec = ".")
sum(dat$q)
dat$c1 <- as.character (dat$c1)
Encoding(dat$c1) <- "UTF-8"
dat$q <- as.numeric(dat$q)


#maiscula
dat$c<- toupper(dat$c) 

dat$c<- factor(dat$c,levels = c("SD" ,    "SDMF" ,  "SDMFPMG",  "SDP",    "SDPMFPMG",   "SDM",    "SDMG" ,  "SDG",   
                                "SDAS",   "SDASMFPMG", "SDQ",    "SDQMFPMG",  "SDTH",   "SDTHMFP", "SDU",    "SDUMFPG" ))

           
       
dat$c1<- factor(dat$c1,levels = c("Sem Destinação (SD)",                                
                                  "SD e Minifúndio" ,                                   
                                  "SD, Minifúndio + Propriedades Rurais",               
                                  "SD e Pequena Propriedade Rural" ,                    
                                  "SD, Pequena + Propriedades Rurais" ,                 
                                  "SD e Média Propriedade Rural" ,                      
                                  "SD, Média e Grande Propriedade Rural" ,
                                  "SD e Grande Propriedade Rural" ,  
                                  "SD e Assentamento" ,                                 
                                  "SD, Assentamento + Propriedades Rurais" ,           
                                  "SD e Quilombola"  ,                                  
                                  "SD, Quilombola + Propriedades Rurais",              
                                  "SD e Terra Indígena Homologada",                     
                                  "SD,Terra Indígena Homologada + Propriedades Rurais",
                                  "SD e Zona Urbana"  ,                                  
                                  "SD, Zona Urbana e + Propriedades Rurais" ))                             
                             

cbp1 <- c("mediumpurple4","khaki1","khaki3", "gold1", "gold3", "goldenrod","goldenrod4",
          "gold4", "mediumorchid1", "mediumorchid4", "orange","orange3","maroon3", "maroon4",
          "gray", "gray47")

ggplot(dat, aes(fill=c1, y=q, x= c)) + 
  geom_bar(position="dodge", stat="identity")+
  geom_text(aes(label=q, vjust =0, size=1)) +
  scale_fill_manual(values = cbp1, name = "Classificação do uso do solo")+
  
  
  labs(title = "Assentamentos Pós-colombianos em áreas Sem Destinação")+
  theme(plot.title = element_text(hjust= 0.5, size=12)) +
  theme(axis.text.x=element_text(size=rel(1.5), angle=90))+
  xlab("")+
  ylab("Quantidade de Comunidades Tradicionais ")

+
  ggsave("semdestinacao_ct.png")



## geral-rural
##stacked 1 camada 
#excluir linhas 
datt <- read.csv("geral_rural_ct.csv", sep = ";", dec = ".")
#datt <- datt[-c(1, 12:21), ]
datt <- datt[-c(1,15,24,25), ]
#datt <- datt[-c(15), ]


datt$s<- factor(datt$s,levels = c("1CSAR","2CSAR","3CSAR","1CR","CS1CR","CS2CR","CS3CR","CS4CR"))

datt$cr<- factor(datt$cr,levels = c("Sem Classificação",                                     
                                    "Sem Destinação",
                                    "Proteção Integral",                                     
                                    "uso Sustentável",                     
                                    "Militar" ,                                              
                                    "Outros usos",
                                    "Assentamento",
                                    "Quilombola"  ,
                                    "Urbanizado",
                                    "Terra Índigena Homologada" ,                            
                                    "Terra Índigena Não Homologada",
                                    "2 Camadas-Sem Área Rural" ,
                                    "3 Camadas-Sem Área Rural",
                                    "Minifúndio" ,                                           
                                    "Pequena Propriedade Rural",                             
                                    "Média Propriedade Rural" ,
                                    "Grande Propriedade Rural",
                                    "2-5 Camadas sobreepostas que contém  uma camada rural" ,
                                    "2-5 Camadas sobrepostas que contém duas camadas rurais",
                                    "3-5 Camadas sobrepostas que contém três camadas rurais",
                                    "4-6 Camadas sobrepostas que contém quatro camadas rurais"))

cbp1 <- c("blue","mediumpurple4", "chartreuse" ,"lightseagreen",
          "darkgreen", "red","rosybrown","darkorange3","gray",
          "darksalmon","violetred4", "palegreen2","palegreen3",
          "gold","goldenrod3","goldenrod4","saddlebrown","sienna1","sienna3","tomato3", "tomato4")


ggplot(datt, aes(fill=cr, y=q, x= s)) + 
  geom_bar(position="stack", stat="identity")+
  #geom_text(aes(label= sum(q, vjust =0)) +
  # geom_text(aes(label=q), size = 2, hjust = 0.5, vjust = 3, position =     "stack") +
  #geom_text(aes(label=q),size = 3, position = position_stack(vjust = 0.5))+   
  scale_fill_manual(values = cbp1, name = "Classificação do uso do solo")+
  
  
  labs(title = "Distribuiçao das Comunidades Tradicionais Atuais na Amazônia Legal")+
  theme(plot.title = element_text(hjust= 0.5, size=12)) +
  # theme(axis.text.x=element_text(size=rel(1.5), angle=90))+
  xlab("")+
  ylab("Quantidade de Comunidades Tradicionais")

+
  ggsave("geral_rural_ct.png")


##comunidades indigenas  
setwd("C:/Users/gessi/Downloads/estagio-docs/")
todos <- read.csv("indigena_pc.csv", sep = ";", dec = ".")
sum(dat$q)
#$c1 <- as.character (dat$c1)
#Encoding(dat$c1) <- "UTF-8"
#dat$q <- as.numeric(dat$q)

#maiscula
dat$c<- toupper(dat$c) 

dat$c<- factor(dat$c,levels = c( "TIND",     "TINDUS"  , "TINDUSOT", "TINDAS"  , "TINDASOT", "TINDUSU" ,
                                 "TINDSD" ,  "TINDSDP",  "TINDPROT"   ))



dat$c1<- factor(dat$c1,levels = c( "Terra Indígena (TIND)",               
                                   "TIND e Uso Sustentável" ,             
                                   "TIND, Uso sustentável + outros " ,    
                                  "TIND e Assentamento",                 
                                   "TIND,  Assentamento + outros",        
                                    "TIND, Uso Sustentável e Zona Urbana ",
                                   "TIND e Sem Destinação"  ,             
                                   "TIND, Sem Destinação + outros"  ,     
                                   "TIND, Proriedades Rurais + outros"  ))                             

cbp1 <- c("darksalmon","lightcoral","maroon", 
          "magenta3", "plum4", "purple1","orchid3",
          "plum3","rosybrown3")

ggplot(dat, aes(fill=c1, y=q, x= c)) + 
  geom_bar(position="dodge", stat="identity")+
  geom_text(aes(label=q, vjust =0, size=1)) +
  scale_fill_manual(values = cbp1, name = "Classificação do uso do solo")+
  
  
  labs(title = "Comunidades Tradicionais Atuais em Terras Indígenas")+
  theme(plot.title = element_text(hjust= 0.5, size=12)) +
  theme(axis.text.x=element_text(size=rel(1), angle=90))+
  xlab("")+
  ylab("Quantidade de Comunidades Tradicionais ")

+
  ggsave("indigenapc.png")

 
# indigena 2- não usei 
pos1 <- read.csv("aml_geral_ct.csv", sep = ",", dec = ".") 
pos1 <- pos1[-c(6:18), ]

cbp1 <- c("darksalmon","violetred4","tan4" ,  "violetred1","firebrick")

ggplot(pos1, aes(fill=modalidade, y=quantidade, x= modalidade)) + 
  geom_bar(position="dodge", stat="identity")+
  geom_text(aes(label=quantidade, vjust =0)) +
  scale_fill_manual(values = cbp1, name = "Classificação do uso do solo")+
  
  
  labs(title = "Assentamentos Pós-colombianos em Terras Índigenas")+
  theme(plot.title = element_text(hjust= 0.5, size=12)) +
  theme(axis.text.x=element_text(size=rel(1), angle=90))+
  xlab("")+
  ylab("Quantidade de Comunidades Tradicionais ")
+
  ggsave("indgena_pos.png")



 