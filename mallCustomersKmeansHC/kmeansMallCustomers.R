# K-Means Clustering

rm(list = ls())   #limpa o workspace
cat("\014")       #limpa o console
setwd("C:\\Users\\Arthur Silveira\\Documents\\Arthur\\Meus Documentos\\Pós\\Módulo II\\DM\\(OK) Aulas 09 e 10")
# Importing the dataset
dataset = read.csv('Mall_Customers.csv', 
                   header = T)
View(dataset)

# depois de rodar pela primeira vez install.packages, 
#deixar como comentário para evitar repetidas instalações
#install.packages("ggplot2")
library(ggplot2)
ggplot(data=dataset, aes(x=SpendingScore, y=AnnualIncome)) + geom_point()

# Using the elbow method to find the optimal number of clusters
set.seed(1234)
#inicializo um vetor. Recomendável antes de qualquer for
#como quero clusterizar de acordo com o Spending Score, uso ele como referência
wcss = vector()
for (i in 1:10) 
{
  wcss[i] = kmeans(x = dataset$SpendingScore, centers = i)$tot.withinss #sum(kmeans(dataset, i)$withinss)
}
#fazer o mesmo para SpendingScore
#se quiser analisar as duas últimas colunas, x = dataset[,4:5]
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')
#type = 'b': liga os pontos com segmentos de reta

# Fitting K-Means to the dataset
kmeans = kmeans(x = dataset$SpendingScore, centers = 4)

clusters = kmeans$cluster
#criados os clusters, concatená-los com o dataset
data = cbind(dataset,clusters)
View(data)
data$clusters = as.factor(data$clusters)

#plotar
ggplot(data = data, aes(x = SpendingScore, y = AnnualIncome, colour = clusters))+
  geom_point()
#salvar
jpeg("clusters3.jpeg")
ggplot(data = data, aes(x = SpendingScore, y = AnnualIncome, colour = clusters))+
  geom_point()
#para fechar função de salvar, dev.off
dev.off()