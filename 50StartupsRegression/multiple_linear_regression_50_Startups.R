# Regressão Linear Múlitpla
rm(list = ls())   #limpa o workspace
cat("\014")       #limpa o console

# importa base de dados
setwd("C:\\Users\\Arthur Silveira\\Dropbox\\Meus Documentos\\Pós\\Módulo II\\DM\\Aulas 11 e 12")
dataset = read.csv('50_Startups.csv')
View(dataset)

# Saber a quantidade de estados que existe no vetor
str(dataset$State)
# Encoding variável categórica
dataset$State = factor(dataset$State)
is.factor(dataset$State)
# Se quisermos fazer com dummy
# install.packages("psych")
# library(psych)
# a = dummy.code(dataset$State)
# dataset$State = NULL
# dataset = data.frame(dataset, a)

# Divisão em base de treino e teste
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting
# Ponto: usar todas as colunas (atributos)
regressor = lm(formula = Profit ~ ., data = training_set)

# modelo
# Os asteriscos ao lado do p-value indicam valores muito próximos de zero
# (ou seja, atributos úteis ao modelo)
summary(regressor)

# previsão da base de teste
y_pred = predict(regressor, newdata = test_set)

#R2
R2Test = 1 - (sum((test_set$Profit - y_pred )^2) / 
                sum((test_set$Profit - mean(test_set$Profit))^2)) ; R2Test
#R2 ajustado
numDados = nrow(test_set)
numDados
numRegressores = length(test_set) - 1
numRegressores
R2TestAdjusted = 1 - (1-R2Test)*(numDados-1)/
  (numDados-numRegressores-1) ; R2TestAdjusted

# Como R2 está muito maior que R2 ajustado, pode ter um regressor que não ajude
# no modelo. O p-value pode dar uma indicação do pior e melhor regressor.
# Gastos com P&D e Marketing aumentam o R2 e o R2 ajustado. A adição dos outros
# diminui o valor do R2 ajustado. POr isso, o melhor modelo de regressão 
#considera apenas o P&D e o Marketing

#gráfico de barras do melhor modelo para a base de teste
counts <- rbind(y_pred, test_set$Profit)
barplot(counts, main="Previsões X Targets (Base de Teste)",
        xlab="Índice da linha de teste", col=c("darkblue","red"),
        beside=TRUE)
legend("topleft", legend = c("Previsões", "Targets"),cex=0.5, fill=c("darkblue","red"))

#gráfico de resultados
library(ggplot2)
targetForecast = data.frame(test_set$Profit, y_pred)
ggplot(targetForecast, aes(y_pred, test_set.Profit)) + geom_point() +
  geom_abline(intercept = 0)