# Script para manipulação de dados e Criação de Dataframes
# Avaliação do curso Projetos de análise de dados em R
# dados originais extraídos do primeiro capitulo de minha dissertação
# primeira versão em 2020-02-15
#-----------------------------------------------------------#

############## CARREGANDO OS PACOTES NECESSÁRIOS##############


############## CRIANDO OBJETOS ##############
#Listando os arquivos do diretório data com a extensão .txt
files.path <- list.files(path = "Core",
                         pattern = ".txt",
                         full.names = TRUE)
files.path

#usando o conteúdo desse vetor na função read.txt()
DD <- read.table(header = T, (files.path[1]))
LC <- read.table(header = T, (files.path[2]))
TH <- read.table(header = T, (files.path[3]))

############## PRIMEIRAS INSPEÇÕES ##############
head(DD)
dim(DD)
summary(DD)

head(LC)
dim(LC)
summary(LC)

head(TH)
dim(TH)
summary(TH)

############## SUMÁRIO DOS DADOS ##############
# Contando o numero de Variáveis, ou seja, número de espécies.
names(TH)[-1]
length(names(TH)[-1]) #Temos 1998 Angiospermas ameaçadas :(

# Contando o numero de Variáveis, ou seja, número de espécies.
names(DD)[-1]
length(names(DD)[-1]) #Temos 493 Angiospermas classificadas como Data_Deficient :(

# Contando o numero de Variáveis, ou seja, número de espécies.
names(LC)[-1]
length(names(LC)[-1]) #Temos 1472 Angiospermas classificadas como Least_Concern Uffa!

############## SUMÁRIO DAS MÉDIAS POR ANO ##############
MeansLC <- rowMeans(LC[,-1])
MeansDD <- rowMeans(DD[,-1])
MeansTH <- rowMeans(TH[,-1])

MeansLC
MeansDD
MeansTH

############## CRIANDO UM DATAFRAME DE MÉDIAS PARA PLOT ##############
#Novo conjunto de variáveis
Years <- c(2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019, 2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019)

#Novo conjunto de variáveis categóricas, !NÂO CONSEGUI REDUZIR ESSES PASSOS!
Category <- c("Threatened","Threatened","Threatened","Threatened","Threatened","Threatened","Threatened","Threatened","Threatened","Threatened","Threatened","Threatened","Threatened","Threatened", "Data Deficient", "Data Deficient","Data Deficient","Data Deficient","Data Deficient","Data Deficient","Data Deficient","Data Deficient","Data Deficient","Data Deficient","Data Deficient","Data Deficient","Data Deficient","Data Deficient", "Least Concern", "Least Concern",  "Least Concern", "Least Concern", "Least Concern", "Least Concern", "Least Concern", "Least Concern", "Least Concern", "Least Concern", "Least Concern", "Least Concern", "Least Concern", "Least Concern")

#Criando o DF
Media_DF <- data.frame(c(Years), c(MeansTH, MeansDD, MeansLC), c(Category))

# Renomenado as colunas
colnames(Media_DF)
names(Media_DF)[names(Media_DF) == "c.Years."] <- "Years"
names(Media_DF)[names(Media_DF) == "c.MeansTH..MeansDD..MeansLC."] <- "Means"
names(Media_DF)[names(Media_DF) == "c.Category."] <- "Category"
Media_DF
write.table(Media_DF, file = "C:/R/Avaliacao_curso/CleanCore/01_Mean_per_Year.txt") #Exportando para pasta o destino

######## CRIANDO UM DATAFRAME DE MÉDIAS PARA AnÁLISE BAYESIANA ########
#Criando Dataframe
Caus_Impact <- data.frame(MeansTH, MeansDD, MeansLC)
write.table(Caus_Impact, file = "C:/R/Avaliacao_curso/CleanCore/02_Causal_Impact.txt") #Exportando para pasta o destino
