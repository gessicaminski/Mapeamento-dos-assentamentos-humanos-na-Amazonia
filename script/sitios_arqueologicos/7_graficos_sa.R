
##graficos
# hstograma stakced sitios
setwd("C:/Users/gessi/tabelas/sitios_arqueologicos") 
s <- read.csv("classificacao_estado_sa.csv", sep = ",", dec = ".")




cbp1 <- c("darksalmon","violetred4","brown2" ,  "violetred1","firebrick",
          "chartreuse" ,"lightseagreen", "darkgreen","red","mediumpurple4",
          "rosybrown","darkorange3","gray",
          "gold","goldenrod3","goldenrod4","saddlebrown",
          "blue")


s$est2<- factor(s$est,levels = c("AC", "AM", "AP", "MA", "MT","PA","RR","RO","TO",'AML'))

s$modalidades<- factor(s$modalidades,levels = c( "Homologada","N�o Homologada","Interditada","Dominial", "Reserva Ind�gena",
                                         "Prote��o Integral", "Uso Sustent�vel", "Militar","Outros Usos","Sem Destina��o",
                                         "Assentamento ", "Quilombola","Urbanizada","Rural-Minif�ndio","Rural-Pequena",       
                                         "Rural-M�dia",  "Rural-Grande", "Sem Classifica��o"))


ac<-s[s$est =="AML",]
ac$porc<- (ac$quantidade /(6725)) * 100
ac$porc

ac$porc0<-round(ac$porc, 0)

s$porc2<-round(s$porc, 2)

#excluir linhas que tem GO
#s<-s[!(s$est== 'AML'),]

ggplot(s, aes(fill=modalidades, y=porc, x=est2)) + 
  geom_bar(position="stack", stat="identity")+
  #geom_text(aes(label=quantidade), vjust=0, size=2.5) +
  # scale_color_brewer(palette = "Dark2")+
  # scale_fill_discrete(name = "Classifica��o do uso do Solo")+
  scale_fill_manual(values = cbp1, name = "Classifica��o do Uso da terra")+
  
  
  labs(title = "Localiza��o dos S�tios Arqueol�gicos na Amaz�nia Legal"  )+
  theme(plot.title = element_text(hjust= 0.5, size=12)) +
  
  ##theme(axis.text.x=element_text(size=rel(1), angle=90))+
  xlab("")+
  ylab("% Assentamentos Humanos Pr�-Colombianos ")+
  ggsave("classificacao_estado_sa.png")


#grafico sobreposi��o
todos<- data.frame( x=c('0','1','2','3','4', '5'),
                    classifica��o=c('0','1','2','3','4', '5'), 
                    quantidade = c(1910,2806,1123,669,197,20))

todos$porc<- (todos$quantidade *100)/ (6725)
sum(todos$quantidade)
sum(todos$porc)
todos$porc2<-round(todos$porc, 2)
todos$porc0<-round(todos$porc, 0)

cbp1 <- c("#FDD0A2" ,"#FDAE6B", "#FD8D3C", "#F16913",
      "#D94801", "#A63603", "#7F2704")
          
#quantidade
ggplot(todos, aes(fill=classifica��o, y=quantidade, x=x)) + 
  geom_bar(position="dodge", stat="identity")+
  geom_text(aes(label=quantidade), vjust=0) +
  scale_fill_manual(values = cbp1, name = "Camadas do uso da terra")+
  
  
  labs(title = "Sobreposi��o dos S�tios Arqueol�gicos na Amaz�nia Legal"  )+
  theme(plot.title = element_text(hjust= 0.5, size=12)) +
  xlab("")+
  ylab("S�tios Arqueol�gicos")  +
  ggsave("sobreposicao_sa.png")




## sem destina��o 
setwd("C:/Users/gessi/Downloads/estagio-docs/")
dat <- read.csv("semdestinacao_sa.csv", sep = ";", dec = ".")
Encoding(dat$c1) <- "UTF-8"
dat$q <- as.numeric(dat$q)

#maiscula
dat$c<- toupper(dat$c) 

dat$c<- factor(dat$c,levels = c("SD","SDMF","SDMFP","SDMFM",
                               "SDP","SDPM","SDPG","SDM","SDMG",
                                "SDG","SDAS",
                                "SDTNH", "SDU" ))
   

dat$c1<- factor(dat$c1,levels = c("Sem Destina��o (SD)",
                                 "SD e Minif�ndio",
                                 "SD, Minif�ndio e Pequena Propriedade Rural",
                                 "SD, Minif�ndio e M�dia Propriedade Rural",
                                "SD e Pequena Propriedade Rural",
                                 "SD, Pequena e M�dia Propriedade Rural",
                                 "SD, Pequena e Grande Propriedade Rural",
                                  "SD e M�dia Propriedade Rural",
                                "SD, M�dia e Grande Propriedade Rural",
                                  "SD e Grande Propriedade Rural",
                                 "SD e Assentamento",
                                  "SD e Terra �ndigena N�o Homologada",
                                "SD e Zona Urbana"))
        
  cbp1 <- c("mediumpurple4","khaki1","khaki3","khaki4", "gold1","gold2", "gold3", "goldenrod",
                          "gold4","goldenrod4", "mediumorchid1",  "deeppink3",
                          "gray")
                

ggplot(dat, aes(fill=c1, y=q, x= c)) + 
  geom_bar(position="dodge", stat="identity")+
  geom_text(aes(label=q, vjust =0)) +
  scale_fill_manual(values = cbp1, name = "Classifica��o do uso da terra")+
  
  
  labs(title = "S�tios Arqueol�gicos em �reas Sem Destina��o")+
  theme(plot.title = element_text(hjust= 0.5, size=12)) +
  theme(axis.text.x=element_text(size=rel(1.5), angle=90))+
  xlab("Camadas do Uso da terra")+
  ylab("Quantidade de S�tios Arqueol�gicos ")

+
  ggsave("semdestinacao_sa.png")



#ruralll
#excluir linhas 
datt <- read.csv("geral_rural_sa.csv", sep = ";", dec = ".")
#datt <- datt[-c(1, 12:21), ]
datt <- datt[-c(21), ]
datt <- datt[-c(1,13), ]


datt$s<- factor(datt$s,levels = c("1CSAR","2CSAR","1CR","CS1CR","CS2CR","CS3CR"))

datt$cr<- factor(datt$cr,levels = c("Sem Classifica��o",                                     
 "Sem Destina��o",                                        
"Prote��o Integral",                                     
 "Uso Sustent�vel",                                       
"Urbanizado",                                            
 "Assentamento",                                          
"Militar" ,                                              
"Outros Usos",                                           
 "Terra �ndigena Homologada" ,                            
 "Quilombola"  ,                                          
 "2 Camadas-Sem �rea Rural" ,                             
 "Minif�ndio" ,                                           
 "Pequena Propriedade Rural",                             
 "M�dia Propriedade Rural" ,                              
 "Grande Propriedade Rural" ,                             
 "2-4 Camadas sobreepostas que cont�m  uma camada rural" ,
 "2-5 Camadas sobrepostas que cont�m duas camadas rurais",
 "3-5 Camadas sobrepostas que cont�m tr�s camadas rurais"))

cbp1 <- c("blue","mediumpurple4","chartreuse","lightseagreen",
          "gray","rosybrown","darkgreen","red","darksalmon", "darkorange3","palegreen2",
          "gold","goldenrod3","goldenrod4","saddlebrown","sienna1","sienna3","tomato3")


ggplot(datt, aes(fill=cr, y=q, x= s)) + 
  geom_bar(position="stack", stat="identity")+
  #geom_text(aes(label= sum(q, vjust =0)) +
 # geom_text(aes(label=q), size = 2, hjust = 0.5, vjust = 3, position =     "stack") +
  #geom_text(aes(label=q),size = 3, position = position_stack(vjust = 0.5))+   
  scale_fill_manual(values = cbp1, name = "Classifica��o do uso da terra")+
  
  
  labs(title = "Distribui�ao dos S�tios Arqueol�gicos na Amaz�nia Legal")+
  theme(plot.title = element_text(hjust= 0.5, size=12)) +
 # theme(axis.text.x=element_text(size=rel(1.5), angle=90))+
  xlab("Camadas do Uso da terra")+
  ylab("Quantidade de Assentamentos")

+
  ggsave("geral_rural_sa.png")

##comunidades indigenas 
dat <- read.csv("indigena_sa.csv", sep = ",", dec = ".")
sum(dat$q)
#$c1 <- as.character (dat$c1)
#Encoding(dat$c1) <- "UTF-8"
#dat$q <- as.numeric(dat$q)


#maiscula
dat$c<- toupper(dat$c) 

dat$c<- factor(dat$c,levels = c( "TH"  ,     "THUS"  ,   "THUSG" ,   "TNHUS"  ,  "TNHASUSM",
                                 "TNHPI" ,   "TNHUSMG" , "TNHSD"    ))



dat$c1<- factor(dat$c1,levels = c( "Terra Ind�gena Homologada (TH)",
                                   "TH e Uso Sustent�vel",                                        
                                   "TH,Uso Sustent�vel e Grande Propriedade Rural",               
                                   "Terra Ind�gena N�o Homologada (TNH) e Uso Sustent�vel",       
                                   "TNH, Assentamento, Uso Sustent�vel e M�dia Propriedade Rural",
                                    "TNH e Prote��o Integral " ,                                  
                                   "TNH e Propriedades Rurais",                                   
                                   "TNH e Sem Destina��o"  ))                             

cbp1 <- c("darksalmon","lightcoral","maroon", 
          "magenta3", "plum4", "purple1","orchid3",
          "plum3")

ggplot(dat, aes(fill=c1, y=q, x= c)) + 
  geom_bar(position="dodge", stat="identity")+
  geom_text(aes(label=q, vjust =0, size=1)) +
  scale_fill_manual(values = cbp1, name = "Classifica��o do uso do solo")+
  
  
  labs(title = "S�tios Arqueol�gicos em Terras Ind�genas")+
  theme(plot.title = element_text(hjust= 0.5, size=12)) +
  theme(axis.text.x=element_text(size=rel(1), angle=90))+
  xlab("")+
  ylab("Quantidade de S�tios Arqueol�gicos ")

+
  ggsave("indigena.png")




##comunidades indigenas 2- nao usei
setwd("C:/Users/gessi/Downloads/estagio-docs/") #diret�rio que eu quero uilizar
pos1 <- read.csv("aml_geral_sa.csv", sep = ";", dec = ".") 
pos1 <- pos1[-c(6:18), ]

cbp1 <- c("darksalmon","violetred4","tan4" ,  "violetred1","firebrick")

ggplot(pos1, aes(fill=modalidade, y=quantidade, x= modalidade)) + 
  geom_bar(position="dodge", stat="identity")+
  geom_text(aes(label=quantidade, vjust =0)) +
  scale_fill_manual(values = cbp1, name = "Classifica��o do uso da terra")+
  
  
  labs(title = "S�tios Arqueol�gicos em Terras �ndigenas")+
  theme(plot.title = element_text(hjust= 0.5, size=12)) +
  theme(axis.text.x=element_text(size=rel(1), angle=90))+
  xlab("")+
  ylab("Quantidade de Assentamentos ")
+
  ggsave("indgena_sar.png")