# Script para Análise de Estrutura Bayesiana, Impactos Causais#
# Avaliação do curso Projetos de análise de dados em R
# dados originais extraídos do primeiro capitulo de minha dissertação
# primeira versão em 2020-02-15
#-----------------------------------------------------------#

############## CARREGANDO OS PACOTES NECESSÁRIOS ##############
library("CausalImpact")

############## ANÁLISES BAYESIANAS, CAUSAL IMPACT #################
#Chamando tabela
files.path <- list.files(path = "CleanCore",
                         pattern = ".txt",
                         full.names = TRUE)
files.path

Causal_Impact_plot <- read.table(header = T, (files.path[2]))
names(plot_mean_year)

##### Pergunta 1) A listagem do Livro Vermelho da Flora Ameaçada do Brasil provocou aumento significativo no número de menções para as angiosperas categorizadas como ameaçadas? ####

P1 <- Causal_Impact_plot[c(1:14),c(1,3)] #Criando objeto com as variaveis Threatened e Least concern. Aqui o grupo LC é considerado grupo controle pois consideramos que a listagem do LVFBr não provocou mudanças no número de menções.
matplot(P1,type = "l")
pre.period <- c(1, 7)
post.period <- c(8, 14)
impact <- CausalImpact(P1, pre.period, post.period)
plot(impact)
summary(impact, "report") #This means that, although the intervention appears to have caused a positive effect, this effect is not statistically significant when considering the entire post-intervention period as a whole p = 0.177 .. Portanto, não foi detectado um efeito par as angiospermas ameçadas de extinção, em outras palavras, o número médio de publicações científicas continua estável mesmo após a categorização de ameaça.
summary(impact)


#### Pergunta 2) A listagem do Livro Vermelho da Flora Ameaçada do Brasil provocou aumento significativo no número de menções para as angiosperas categorizadas como "Data Deficient" ? ####

P2 <- Causal_Impact_plot[c(1:14),c(2,3)] #Criando objeto com as variaveis Data Deficient e Least concern.
matplot(P2,type = "l")
pre.period <- c(1, 7)
post.period <- c(8, 14)
impact <- CausalImpact(P2, pre.period, post.period)
plot(impact)
summary(impact, "report") #This means that, although it may look as though the intervention has exerted a negative effect on the response variable when considering the intervention period as a whole, this effect is not statistically significant.  p = 0.23 .. Portanto, não foi detectado um efeito par as angiospermas "Data Deficient", em outras palavras, o número médio de publicações científicas continua estável mesmo após a categorização de ameaça.
summary(impact)

