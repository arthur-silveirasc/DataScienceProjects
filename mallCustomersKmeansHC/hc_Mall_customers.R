# Hierarchical Clustering

rm(list = ls())   #limpa o workspace
cat("\014")       #limpa o console
setwd("C:\\Users\\Arthur Silveira\\Documents\\Arthur\\Meus Documentos\\Pós\\Módulo II\\DM\\(OK) Aulas 09 e 10")
# Importing the dataset
dataset = read.csv('Mall_Customers.csv', header=T)
View(dataset)

library(ggplot2)
ggplot(data=dataset, aes(x=AnnualIncome, y=SpendingScore)) + geom_point()

# Using the dendrogram to find the optimal number of clusters
dendrogram = hclust(d = dist(dataset[,4:5], method = 'euclidean'), 
                    method = 'ward.D')
plot(dendrogram,
     main = paste('Dendrogram'),
     xlab = 'x',
     ylab = 'Euclidean distances')

# Fitting Hierarchical Clustering to the dataset
hc = hclust(d = dist(dataset[,4:5], method = 'euclidean')) 
y_hc = cutree(hc, 7)
y_hc

data = cbind(dataset[,4:5],y_hc) 
data$y_hc = as.factor(data$y_hc)
View(data)

#plotar
ggplot(data = data, aes(x = AnnualIncome, y = SpendingScore, colour = y_hc))+
  geom_point()

#salvar
jpeg("clustersHCMallCustomers.jpeg")
ggplot(data = data, aes(x = AnnualIncome, y = SpendingScore, colour = y_hc))+
  geom_point()
dev.off()