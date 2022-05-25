##abrir shape das comunidades tradicionais
setwd("C:/Users/gessi/shape_bruto/end_com_trad")
end <- readOGR(dsn = '.' , layer = 'end_com_trad1')

##amazonia legal
setwd("C:/Users/gessi/shapes_amazonia_legal/")
aml <- readOGR(dsn = '.' , layer = 'amazonia_legal_ibge')

#cotar para a amazonia legal 
loc <- crop(end, aml, snap = 'out')

#salvar endereços das comunidades tradicionais para amazonia legal
writeOGR (loc, ".", "com_tradicionais_ibge", driver = "ESRI Shapefile")

#transformar em dataframe - csv
end <- as.data.frame (loc,encoding = "UTF-8")
select(starwars, -c(1, 2, 3))

#salvando em csv
setwd("C:/Users/gessi/tabelas/comunidades_tradicionais/")
write.csv(end,'enderecos_int_aml.csv')

#excluindo coluna 
end <- subset(end, select = - X)
end <- subset(end, select = - coords.x2)
end <- subset(end, select = - coords.x1)
end <- subset(end, select = - VAL_COMP_E)
end <- subset(end, select = - NOM_COMP_E)
end <- subset(end, select = - NOM_COMP_1)
end <- subset(end, select = - VAL_COMP_1)
end <- subset(end, select = - NOM_COMP_2)
end <- subset(end, select = - VAL_COMP_2)
end <- subset(end, select = - NOM_COMP_3)
end <- subset(end, select = - VAL_COMP_3)
end <- subset(end, select = - NOM_COMP_4)
end <- subset(end, select = - VAL_COMP_4)
end <- subset(end, select = - DSC_MODIFI)
end <- subset(end, select = - X)
end <- subset(end, select = - COD_MUNICI)
end <- subset(end, select = - COD_DISTRI)
end <- subset(end, select = - COD_SUBDIS)
end <- subset(end, select = - NOM_TIPO_S)
end <- subset(end, select = - CEP)
end <- subset(end, select = - NOM_TITULO)
end <- subset(end, select = - ALTITUDE)
end <- subset(end, select = - NUM_ENDERE)
end <- subset(end, select = - NOM_SEGLOG)
end <- subset(end, select = - DSC_LOCALI)

end <- subset(end, select = - Name)
end <- subset(end, select = - descriptio)
end <- subset(end, select = - timestamp)
end <- subset(end, select = - begin)
end <- subset(end, select = - end)
end <- subset(end, select = - altitudeMo)
end <- subset(end, select = - tessellate)
end <- subset(end, select = - extrude)
end <- subset(end, select = - visibility)
end <- subset(end, select = - drawOrder)
end <- subset(end, select = - icon)
end <- subset(end, select = - layer)
end <- subset(end, select = - path)
end <- subset(end, select = - encoding)

#salvando em csv
write.csv(end,'enderecos_com_trad.csv')