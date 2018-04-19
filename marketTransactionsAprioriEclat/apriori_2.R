rm(list = ls()) #limpa ambiente
cat("\014") #limpa console

setwd("C:\\Users\\Arthur Silveira\\Documents\\Arthur\\Meus Documentos\\Pós\\Módulo II\\DM\\(OK) Aula 08")

# Apriori
#install.packages("arules")
library(arules)

# Base original
originalDataset = read.csv("Groceries_dataset.csv", header = FALSE)
View(originalDataset)

#Matriz Esparsa
dataset = read.transactions('Groceries_dataset.csv', sep = ',', 
                            rm.duplicates = TRUE,
                            cols=1) #remove entradas duplicadas em cada transação
# na coluna 1 estão os ids das transações
summary(dataset) #Detalhes da matriz
itemFrequencyPlot(dataset, topN = 10) #Top 10 products

#Treinamento
rules = apriori(data = dataset, 
                parameter = list(support = 0.001, confidence = 0.02))

#SUPPORT
#otimizar venda de produtos comprados pelo menos 3 vezes ao dia; Por semana: 3*7;
#Support (mínimo): 3*7/7501 ~ 0.003
#CONFIDENCE
#Baixa: regras que não fazem sentido; Alta: regras óbvias;
#Comece com o valor default (0.8) e vá diminuindo (tentativa e erro).
#Atenção: um valor de 0.8 é muito alto e não gerará nenhuma regra nesse caso. 
#Um valor de 0.8 significa que todas as regras geradas devem estar corretas em 80% das transações.

# Visualizar resultados
inspect(sort(rules, by = 'lift')[1:10])