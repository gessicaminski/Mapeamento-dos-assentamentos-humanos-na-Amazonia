# Mapeamento dos assentamentos humanos na Amazonia
 Estágio-Mapeamento dos assentamentos humanos pré- e pós-colombianos na Amazônia
 
DOWNLOAD DOS DADOS

Dados
•	Sítios Arqueológicos: assentamentos pré-colombianos fornecidos pela Amazon Arch.  Solicitar pelo e-mail:
•	Endereços rurais atuais: utilizado para os assentamentos humanos pós-colombianos do Censo Agropecuário de 2017 do Brasil realizado pelo IBGE. Download: https://biblioteca.ibge.gov.br/index.php/biblioteca-catalogo?view=detalhes&id=73093 
•	Zona urbana: mapa fornecido pelo Instituto Brasileiro de Geografia e Estatística (IBGE). Download: https://www.ibge.gov.br/geociencias/cartas-e-mapas/redes-geograficas/15789-areas-urbanizadas.html?=&t=downloads 
•	Assentamentos e quilombolas: mapa fornecido pelo Instituto Nacional de Colonização e Reforma Agrária (INCRA). Download: https://certificacao.incra.gov.br/csv_shp/export_shp.py 
•	Área de conservação: mapas do Ministério do Meio Ambiente (MMA). Download: https://dados.mma.gov.br/dataset/unidadesdeconservacao 
•	Área sem destinação/Militar/Uso sustentável: Sistema Florestal Brasileiro (SBF). Download: https://www.gov.br/florestal/pt-br/assuntos/cadastro-nacional-de-florestas-publicas/cadastro-nacional-de-florestas-publicas-atualizacao-2018 
•	Áreas rurais: foi selecionado o mapa do Sistema Nacional de Cadastro Ambiental Rural (SICAR).  Download: https://consultapublica.car.gov.br/publico/estados/downloads 
•	Comunidades indígenas: mapa da Fundação Nacional do Índio (FUNAI). Download: https://www.gov.br/funai/pt-br/atuacao/terras-indigenas/geoprocessamento-e-mapas 
•	Amazônia legal: mapa fornecido pelo  IBGE, que engloba nove estados do Brasil pertencentes à bacia Amazônica. Download: https://www.ibge.gov.br/geociencias/cartas-e-mapas/mapas-regionais/15819-amazonia-legal.html 

Obs: Os shapefiles estão disponíveis no link do drive. Alguns desses dados podem ter atualizados e os dados do ano que foram utilizados neste projeto podem não estarem mais disponíveis.

PROCESSAMENTO DOS DADOS
O download dos assentamentos e mapas utilizados para esta pesquisa, estavam disponíveis de diferentes formas e formatos. Assim foi necessário selecionar apenas a área que compõe a Amazônia legal e formatar todos em shapefile  com projeção datum=WGS84 . Posteriormente foi analisado a tabela de atributos de cada mapa e extraídos os itens mais relevantes para desenvolver uma classificação para o mapeamento dos assentamentos humanos da Amazônia Legal.
1-	Colocar os municípios no shape da Amazônia legal
2-	Colocar na mesma projeção  
3-	Dados que foram baixados por estados: unir os shapes
Obs: os dados que foram baixados de áreas rurais foram por municípios e processo de união foi feito no qgis
4-	Cortar os shapes para Amazônia legal 
5-	Criar a tabela 0 e 1. Onde os pontos dos sítios e dos endereços se encontravam em determinada cobertura do solo era colocado 1e onde não estava 0.
6-	Para os dados sem classificação reavaliados foi medido o shape a menos de 100 metros e reclassificados. Isto foi feito no qgis  usando o pacote NN-Join.
7-	A partir desta tabela foram feitas as análises posteriores e gerado os gráficos no R
8-	Os mapas foram feitos no qgis 
Os scripts não são muitos elaborados por que estava em período de aprendizado.

CRIAÇÃO DA TABELA 0 E 1
Para identificar o uso e cobertura do solo onde os sítios arqueológicos e os endereços rurais atuais estão localizadas foi desenvolvida uma tabela preenchida por 0 e 1. Em que foi cruzado os pontos georreferenciados, ou seja a localização dos sítios e dos endereços com os mapas selecionados de uso e cobertura do solo.
 Para cada tipo de cobertura do solo foi criado uma coluna (e.g. PI de proteção integral) e quando as coordenadas de ambos coincidem é inserido o número 1 e onde não coincide é inserido o número 0. No final foi criado uma nova coluna com a soma de quantas vezes o número 1 aparece, ou seja de quantas camadas estavam presentes naquela localização do assentamento. Desta forma foi possível identificar quem não tinha nenhum classificação em que a soma foi igual a 0 e quem está em áreas sobrepostas a soma foi maior que 1.
 Para entender melhor como ocorre essa sobreposição uma nova coluna foi gerada. Em que os dados são lidos linha por linha, se há a presença do número 1 a sigla dessa coluna é gravada, gerando um código que contém as siglas de todas as camadas que estão presentes naquela localização do assentamento (Tabela 1). 

Tabela 1: Exemplo do modelo da tabela 0 e 1 gerada para identificação do uso e cobertura do solo no qual os sítios arqueológicos e as comunidades tradicionais estão localizados.
CD_MUN	NM_MUN	SIGLA_UF	nome	longitude	latitude	th	tnh	pi	q	p	sm	cod
1302900	Maués	AM	Mandu	-58.0706444	-3.974813889	 0	 0	1	 0	1	2	pip
 
 As ferramentas utilizadas foram o R: uma linguagem versátil para análise de dados, que conta com diversos pacotes que permitem as mais variadas aplicações. E o  Qgis: sistema de informação geográfica que permite a visualização, edição e análise de dados georreferenciados de uma forma ampla e ágil. Ambos são softwares livres.
Todos os scripts e tabelas utilizados e desenvolvidos nessa pesquisa estão disponíveis no GitHub: https://github.com/gessicaminski/Mapeamento-dos-assentamentos-humanos-na-Amazonia 

Dados Sem Classificação 
Para os dados sem classificação em que a soma das camadas foram iguais a 0, foi feita uma reclassificação. Para isto foi criada uma tabela com as distancias de cada ponto para cada camada no Qgis utilizando o plugin NN-JOIN. Os valores resultantes das distâncias estavam no formato de graus decimais e foram transformados em quilômetros, multiplicando por 111,32 km que corresponde a medida do comprimento de um grau e depois multiplicado por 1000 para obter o valor em metros. Posteriormente foram identificadas as camadas em que os pontos estavam a menos de 100 metros de distancias e feita a reclassificação. Alguns estavam somente  em uma camada, outros mais de uma ou nenhuma. 

https://arken.nmbu.no/~havatv/gis/qgisplugins/NNJoin/
https://forest-gis.com/2022/01/como-transformar-medidas-de-resolucao-espacial-angulares-em-metricas.html/

REFERENCIAS 

QGIS. Sistema de Informação Geográfica livre e aberto, [s.d.]. Página inicial. Disponível em: <https://qgis.org/pt_BR/site/>. Acesso em: 05 de jan. de 2022.

INCRA. Instituto Nacional de Colonização e Reforma Agrária [s.d.]. Página inicial. Disponível em: <https://www.gov.br/incra/pt-br/acesso-a-informacao/institucional/o-incra>. Acesso em: 05 de jan. de 2022.

FUNAI. Fundação Nacional do Índio [s.d.]. Página inicial. Disponível em: <https://www.gov.br/funai/pt-br/atuacao/terras-indigenas>. Acesso em: 05 de jan. de 2022.

IBGE. Instituto Brasileiro de Geografia e Estatística [s.d.]. Página inicial. Disponível em: <https://www.ibge.gov.br/>. Acesso em: 05 de jan. de 2022.

SICAR. Cadastro Ambiental Rural, [s.d.]. Página inicial. Disponível em: <https://www.car.gov.br/>. Acesso em: 05 de jan. de 2022.


SFB. Serviço Florestal Brasileiro-MINISTÉRIO DA AGRICULTURA, PECUÁRIA E ABASTECIMENTO, [s.d.]. Página inicial. Disponível em: < https://www.gov.br/florestal/pt-br/assuntos/cadastro-nacional-de-florestas-publicas/cadastro-nacional-de-florestas-publicas-atualizacao-2018 >. Acesso em: 05 de jan. de 2022.


R Core Team (2021). R: A language and environment for statistical computing. R Foundation for Statistical Computing, Vienna. Disponível em: <https://www.R-project.org>. Acesso em: 05 de jan. de 2022.



AMAZONARCH. Amazonian Archaeological Sites Network, [s.d.]. Página inicial. Disponível em: <https://sites.google.com/view/amazonarch/home>. Acesso em: 05 de jan. de 2022.


ARCGIS. Shapefiles, c2021. Disponível em: <https://enterprise.arcgis.com/pt-br/portal/latest/use/shapefiles.htm>. Acesso em: 05 de jan. de 2022.


IBGE-INSTITUTO BRASILEIRO DE GEOGRAFIA E ESTATÍSTICA.
Censo Agropecuário 2017: Resultados Preliminares. Rio de Janeiro, 2018a. 108p.
Disponível em: < https://biblioteca.ibge.gov.br/index.php/biblioteca-catalogo?view=detalhes&id=73093>. Acesso em: 05 de jan. de 2022.
