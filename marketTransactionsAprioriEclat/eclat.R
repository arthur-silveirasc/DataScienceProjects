rm(list = ls()) #limpa o ambiente
cat("\014") #limpa o console

setwd("C:\\Users\\Arthur Silveira\\Documents\\Arthur\\Meus Documentos\\Pós\\Módulo II\\DM\\(OK) Aula 08")

# Eclat
# install.packages('arules')
library(arules)

originalDataset = read.csv('Market_Basket_Optimisation.csv', header = FALSE)
dataset = read.transactions('Market_Basket_Optimisation.csv', sep = ',', rm.duplicates = TRUE)
summary(dataset)
itemFrequencyPlot(dataset, topN = 10)

# Treinamento
rules = eclat(data = dataset, parameter = list(support = 0.003, minlen = 2)) #numero min de produtos em cada conjunto

#Visualizando resultados
#Conjunto de produtos mais frequentemente comprados juntos
inspect(sort(rules, by = 'support')[1:10])