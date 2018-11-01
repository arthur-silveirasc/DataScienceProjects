ReplaceMissingPerClass = function(data, classIndex)
{
#índices das colunas numéricas
numericColumns = c()
for(i in 1:ncol(data))
{
  if(is.numeric(data[,i]))
  {
    numericColumns = c(numericColumns, i)
  }
}

#substitui missing de colunas numéricas pela média total do atributo
for(i in numericColumns){
  data[is.na(data[,i]), i] <- floor(mean(data[,i], na.rm = TRUE)) #arredonda para baixo: inteiro
}

#colunas categoricas
nominalColumns = c()
for(i in 1:ncol(data))
{
  if(is.factor(data[,i]) && i!=classIndex) #não pego a segunda pq é a minha classe
  {
    nominalColumns = c(nominalColumns, i)
  }
}

#substitui missing de colunas numéricas pelo valor mais frequente para classe específica
for(i in nominalColumns)
{
  #decobre a linha que tem o valor faltante
  missingRow <- data[which(is.na(data[,i])),]
  
  #se não existir missing, passo para o próximo
  if(nrow(missingRow) == 0)
    next
  
  #descobre os indices das linhas
  missingIndex = as.numeric(rownames(missingRow))
  
  #descobre as classes das linhas
  missingClass = missingRow[,classIndex]
  
  for(j in 1:length(missingIndex))
  {
      #calcula a maior ocorrencia naquele grupo
      class <- data[which(data[,classIndex] == missingClass[j]),]
      mostFrequent = tail(names(sort(table(class[,i]))), 1)
      
      #substitui o valor faltante pela média do grupo
      data[missingIndex[j],i] <- mostFrequent
  }
}

#### Transforma atributos categóricos em numéricos ####
for(i in nominalColumns)
{
  data[,i] = as.integer(data[,i])
}

return(data)
}