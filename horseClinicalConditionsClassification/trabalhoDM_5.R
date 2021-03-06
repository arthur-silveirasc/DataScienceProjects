#Limpar �rea de trabalho ####
rm(list = ls()) #clean up environment
cat("\014")     #clean up console

#Semente para reprodu��o de resultados ####
set.seed(1234)

#Carregamento da Base ####
setwd("C:\\Users\\Arthur Silveira\\Dropbox\\Meus Documentos\\P�s\\M�dulo II\\DM\\Trabalho Final")
data = read.csv(file = "horse.csv", header = T, sep = ",")
View(data)

#An�lise Explorat�ria dos Dados ####
#An�lise tabular ####
str(data) #estrutura da base
summary(data) #resumo das colunas
#atributos com mais NAs: nasogastric reflux ph (246), abdomo_protein (198)
#e abdomo_appearance(165)

#An�lises Gr�ficas ####
#install.packages("ggplot2")
library(ggplot2)
#histogramas de cada atributo para entender dispers�o dos dados
#surgery
a = ggplot(data=data, aes(x = surgery))
a + geom_histogram(stat="count", binwidth = 5, fill="Blue" , colour= "Black")
#equilibrio entre yes e no

#age
b = ggplot(data=data, aes(x = age))
b + geom_histogram(stat="count", binwidth = 5, fill="Blue" , colour= "Black")
#muito mais adultos do que jovens

#rectal_temp
c = ggplot(data=data, aes(x = rectal_temp))
c + geom_histogram(binwidth = .2, fill="Blue" , colour= "Black")
#normal � 37.8. Distribui��o parece com a da normal

#pulse
d = ggplot(data=data, aes(x = pulse))
d + geom_histogram(binwidth = 5, aes(fill=age) , colour= "Black")
#no gr�fico de pulso, muitos adultos na faixa de 50. Ou seja, acima do range
#normal de 30-40

#respiratory_rate
e = ggplot(data=data, aes(x = respiratory_rate))
e + geom_histogram(binwidth = 2, fill="Blue" , colour= "Black")
#muitos acima da taxa normal de 8 a 10
#"usefulness is doubtful due to great fluctuation"

#temp_of_extremities
f = ggplot(data=data, aes(x = temp_of_extremities))
f + geom_histogram(stat="count", binwidth = 5, fill="Blue" , colour= "Black")
#maioria � 'cool'

#peripheral_pulse
g = ggplot(data=data, aes(x = peripheral_pulse))
g + geom_histogram(stat="count", binwidth = 5, fill="Blue" , colour= "Black")
#maioria � normal
#substituir quatro classes por duas, como o enunciado sugeriu?

#mucous_membrane
h = ggplot(data=data, aes(x = mucous_membrane))
h + geom_histogram(stat="count", binwidth = 5, fill="Blue" , colour= "Black")
#maioria � 'normal'

#capillary_refill_time
i = ggplot(data=data, aes(x = capillary_refill_time))
i + geom_histogram(stat="count", binwidth = 5, fill="Blue" , colour= "Black")
#maioria � "less_3_sec"

#pain
j = ggplot(data=data, aes(x = pain))
j + geom_histogram(stat="count", binwidth = 5, fill="Blue" , colour= "Black")
#distribui��o uniforme
#pain n�o deve ser tratada como ordenada ou discreta

#peristalsis
k = ggplot(data=data, aes(x = peristalsis))
k + geom_histogram(stat="count", binwidth = 5, fill="Blue" , colour= "Black")
#maioria � "hypomotile"

#abdominal_distention
l = ggplot(data=data, aes(x = abdominal_distention))
l + geom_histogram(stat="count", binwidth = 5, fill="Blue" , colour= "Black")
#distribui��o uniforme
#"an important parameter"

#nasogastric_tube
m = ggplot(data=data, aes(x = nasogastric_tube))
m + geom_histogram(stat="count", binwidth = 5, fill="Blue" , colour= "Black")


#nasogastric_reflux
n = ggplot(data=data, aes(x = nasogastric_reflux))
n + geom_histogram(stat="count", binwidth = 5, fill="Blue" , colour= "Black")


#nasogastric_reflux_ph
o = ggplot(data=data, aes(x = nasogastric_reflux_ph))
o + geom_histogram(binwidth = .2, fill="Blue" , colour= "Black")
#NAs muito acima do normal (mais de 80% dos registros)
#3 a 4 � o normal

#rectal_exam_feces
p = ggplot(data=data, aes(x = rectal_exam_feces))
p + geom_histogram(stat = "count", binwidth = .2, fill="Blue" , colour= "Black")
#4 � poss�vel obstru��o

#abdomen
q = ggplot(data=data, aes(x = abdomen))
q + geom_histogram(stat = "count", binwidth = .2, fill="Blue" , colour= "Black")
#muitos NAs

#packed_cell_volume
r = ggplot(data=data, aes(x = packed_cell_volume))
r + geom_histogram(binwidth = .5, fill="Blue" , colour= "Black")

#total_protein
s = ggplot(data=data, aes(x = total_protein))
s + geom_histogram(binwidth = 2, fill="Blue" , colour= "Black")
#normal � de 6 a 7.5

#abdomo_appearance
t = ggplot(data=data, aes(x = abdomo_appearance))
t + geom_histogram(stat = "count", binwidth = 2, fill="Blue" , colour= "Black")
#muitos NAs

#abdomo_protein
u = ggplot(data=data, aes(x = abdomo_protein))
u + geom_histogram(stat = "count", binwidth = 5, fill="Blue" , colour= "Black")

#outcome
v = ggplot(data=data, aes(x = outcome))
v + geom_histogram(stat = "count", binwidth = 5, fill="Blue" , colour= "Black")
#juntar died com euthanized

#surgical_lesion
w = ggplot(data=data, aes(x = surgical_lesion))
w + geom_histogram(stat = "count", binwidth = 5, fill="Blue" , colour= "Black")

#lesion_1
x = ggplot(data=data, aes(x = lesion_1))
x + geom_histogram(stat = "count", binwidth = 5, fill="Blue" , colour= "Black")


#lesion_2
y = ggplot(data=data, aes(x = lesion_2))
y + geom_histogram(stat = "count", binwidth = 5, fill="Blue" , colour= "Black")

#lesion_3
z = ggplot(data=data, aes(x = lesion_3))
z + geom_histogram(stat = "count", binwidth = 5, fill="Blue" , colour= "Black")
#desbalanceado, com prov�vel vari�ncia igual a 0

#cp_data
a1 = ggplot(data=data, aes(x = cp_data))
a1 + geom_histogram(stat = "count", binwidth = 5, fill="Blue" , colour= "Black")
#"of no signifcance"

# Tratamento da base ####

#Pacotes necess�rios
#install.packages("e1071")
library(e1071)
#install.packages("DMwR")
library(DMwR)
#install.packages("lubridate")
library(lubridate)
#install.packages("caret")
library(caret)

# Valores faltantes ####
#como a quantidade � muito alta para nasogastric (mais de 80% dos registros), 
#o ideal � retirar esse atributo da base
data = data[,-16]
#retirar o cp_data. Segundo o enunciado, n�o � �til
data = data[,-length(data)]
View(data)
#Executar a substitui��o (funcao abaixo - e verificar se o valor foi substituido corretamente)
setwd("C:\\Users\\Arthur Silveira\\Dropbox\\Meus Documentos\\P�s\\M�dulo II\\DM\\Trabalho Final")
source("ReplaceMissingPerClass.R")
data = ReplaceMissingPerClass(data, classIndex = 3)
data = ReplaceMissingPerClass(data, classIndex = 4)
data = ReplaceMissingPerClass(data, classIndex = 5)
data = ReplaceMissingPerClass(data, classIndex = 6)
data = ReplaceMissingPerClass(data, classIndex = 7)
data = ReplaceMissingPerClass(data, classIndex = 8)
data = ReplaceMissingPerClass(data, classIndex = 9)
data = ReplaceMissingPerClass(data, classIndex = 10)
data = ReplaceMissingPerClass(data, classIndex = 11)
data = ReplaceMissingPerClass(data, classIndex = 12)
data = ReplaceMissingPerClass(data, classIndex = 13)
data = ReplaceMissingPerClass(data, classIndex = 14)
data = ReplaceMissingPerClass(data, classIndex = 15)
data = ReplaceMissingPerClass(data, classIndex = 16)
data = ReplaceMissingPerClass(data, classIndex = 17)
data = ReplaceMissingPerClass(data, classIndex = 18)
data = ReplaceMissingPerClass(data, classIndex = 19)
data = ReplaceMissingPerClass(data, classIndex = 20)
data = ReplaceMissingPerClass(data, classIndex = 21)
summary(data)

#Concatena��o de dados #### 
#concatenar os valores 1(died) e 2(euthanized)
for (i in 1:nrow(data))
{
  if (data$outcome[i] == 2)
  {
    data$outcome[i] = 1
  }
}
#transformar os valores 3 (lived) em 2
for (i in 1:nrow(data))
{
  if (data$outcome[i] == 3)
  {
    data$outcome[i] = 2
  }
}
View(data$outcome)

#transformar outcome em fator 
data$outcome = as.factor(data$outcome)
summary(data)

#colocar outcome como �ltima coluna da base
outcome = data$outcome
data = data[,-22]
data = cbind(data,outcome)
rm(outcome); #eliminar vari�vel tempor�ria 
View(data)

#Procura por atributos (colunas) com vari�ncia 0 ####
nearZeroVarianceIndexes = nearZeroVar(data);nearZeroVarianceIndexes
#atributos lesion_2 e lesion_3
data = data[,-nearZeroVarianceIndexes]
View(data)

#Matriz de correla��o #####
#analisar atributos altamente correlacionados para poss�vel exclus�o
#install.packages("corrplot")
library(corrplot)
correlation = cor(data[,-length(data)]) #td a base, excluindo a classe
corrplot(correlation, method = 'number', type = "upper", 
         tl.cex = 0.5, tl.col = 'black') # plotar matriz de correla��o
#matriz com poucas correla��es altas. No m�ximo, surgery com surgery_lesion
#n�o vamos retirar nenhum atributo

#Balanceamento ####

#oversampling
balancedData <- SMOTE(outcome~.,data,perc.over = 300)

#Classifica��o ####
#Classificadores se mostraram com alta acur�cia (90%, em m�dia) 
#e kappa elevado (m�dia de 80%). Random forest obteve melhor desempenho, 
#seguido por SVM. �rvore de decis�o e KNN ficaram atr�s.

#SVM ####
#Gera aleatoriamente os indices para base de teste (30% para teste)
indexes = sample(1:nrow(balancedData), size=0.3*nrow(balancedData))
#separa de fato a base
train = balancedData[-indexes,]
test = balancedData[indexes,]

#"comece a separa��o na base de treino"
system.time(svm_model <- svm(outcome ~., train, probability =T))
#"use o modelo aprendido para aplic�-lo na base teste"
predictionsSVM <- predict(svm_model, test, probability =T)
cm = table(predictionsSVM,test$outcome); cm
#"me d� a m�dia dos valores diferentes entre o que foi previsto pelo SVM
# e os valoresda base teste (o que eu errei)"
acuracy = 1 - mean(predictionsSVM != test$outcome); acuracy

probabilidades = attr(predictionsSVM, which = "probabilities")
predictionsAndProbabilities = cbind(test$colunaOutcome, predictionsSVM, probabilidades)
View(predictionsAndProbabilities)

#"m�trica que avalia o n�vel de concord�ncia de uma tarefa classifica��o"
kappa(cm)[1]

# Decision Tree ####
#install.packages("tree")
library(tree)
system.time(tree_model <- tree(outcome ~., train))
predictionsDtree <- predict(tree_model, test, type = "class")
table(predictionsDtree, test$outcome)
acuracy = 1 - mean(predictionsDtree != test$outcome); acuracy
summary(tree_model)
plot(tree_model)
text(tree_model)

# Random Forest ####
#install.packages("randomForest")
library(randomForest)
system.time(forest_model <- randomForest(outcome ~., data = train, 
                                         importance = TRUE, do.trace = 100))
predictionsForest = predict(forest_model, test)
table(predictionsForest, test$outcome)
acuracy = 1 - mean(predictionsForest != test$outcome); acuracy
plot(forest_model)

# KNN ####
#install.packages("class")
library(class)
system.time(knn_model <- knn(train[,-length(train)], 
                             test[,-length(test)], 
                             cl=train$outcome, k = 5))
#o teste j� foi passado no treinamento. 
#a resposta do modelo j� s�o as previs�es
table(knn_model, test$outcome)
acuracy = 1 - mean(knn_model != test$outcome); acuracy