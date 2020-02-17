# Script para Plots Menções Por Ano#
# Avaliação do curso Projetos de análise de dados em R
# dados originais extraídos do primeiro capitulo de minha dissertação
# primeira versão em 2020-02-15
#-----------------------------------------------------------#

############## CARREGANDO OS PACOTES NECESSÁRIOS ##############
library("ggplot2")

############## PLOT DAS MÉDIAS PARA AS 3 CATEGORIAS #################
#Chamando tabela
files.path <- list.files(path = "CleanCore",
                         pattern = ".txt",
                         full.names = TRUE)
files.path

plot_mean_year <- read.table(header = T, (files.path[1]))
names(plot_mean_year)

# Scatter Plot com linhas
ggplot(plot_mean_year, aes(x = Years,y = Means ,group = Category, colour = Category)) + geom_point() + geom_line(aes(lty = Category)) + scale_y_continuous(name = "Average of Mentions", breaks = seq(0,1,0.25)) + theme_classic() + scale_x_continuous(breaks = c(2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018,2019)) + scale_color_manual(values = c('#CCCCCC','#009999','#FF0000'))

# Box plot
ggplot(plot_mean_year, aes(x = Category, y = Means, fill = Category)) +
  geom_boxplot() + theme_classic() + scale_fill_manual(values = c("#CCCCCC", "#009999", "#FF0000")) + geom_jitter(shape = 16, position = position_jitter(0.2)) + scale_y_continuous(name = "Average of Mentions") + scale_x_discrete(name = "")
