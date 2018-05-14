# Statistical Modelling
Here is enlisted four problems - and its resolutions - regarding key topics in statistical modelling, such as Bayes Theorem, hypotheses testing and Naive Bayes classification.
## Getting Started
### Problem #1 (bayesian statistcs):
Three players get into a room and one blue or red hat is placed on the head of each one. The colour of the hat is determined by a throw of a honest coin. No communication between these players is allowed, except a previous strategy alignment before they get into the room. As soon as these players have the chance to look at the hats of the other two, all three have to guess, simultaneously, the colour of their own hats or pass their own turn. The challenge consists in finding a group strategy that maximizes the probability of, at least, one person guessing and no one giving a wrong answer.

A simple strategy could be that the group agrees on a player, previously selected, guessing her own hat and the other two simply passing their turns. Therefore, the probability of at least one person guessing and no one giving a wrong answer equals to 1/2. Suggest a strategy with a larger success probability than the one given and calculate it.

### Problem #2 (bayesian statistcs):
Mary is going to get married tomorrow at a open air ceremony in the desert. In the last years, it has rained only 5 days per year where the ceremony will take place.

Unfortunately, the weather reports predict a rainy day on the big day. It is known that, when it has indeed rained, the weather reports predicted rain in 90% of these cases and, when it hasn't rained, the forecasts gave rain in 10% of these cases. What is the probability that it won't rain on the wedding day? 

### Problem #3 (Naive Bayes classifier):
The goal here is to classify, using a Naive Bayes classifier, the type of 30m x 30m tranches coverage of a large forest. To do this, it's available a dataset with multiples attributes, which are described in the "UCI Machine Learning Repository_ Covertype Data Set.pdf" file. You must select which attributes you judge most relevant and model them as discrete or continuous random variables, defining them with their respective probability mass - or density - function.

To perform such prediction, use the train dataset "covtype_train.xlsx". The answer of the problem is to be delivered in the last column of the "covtype_test.xlsx" file.

Tips:
1) You don't need to use all the data available in the training dataset, nor even all the dataset attributes;
2) All the columns identified as binary encoding (one-hot enconding) don't need to be used on that form. As a matter of fact, it could be more interesting converting "Wilderness_Area" to one integer variable and do the same process to "Soil_Type";
3) Start distinguishing which attributes you'll model as continuous random variable or as discrete random variables;
4) Then, plot the histograms of these attributes in Excel or Matlab, using the hist. function, and compare then to other distribution plots. Decide which one is the best fit.

### Problem 4 (hypothesis testing)
A seer says that is capable of guessing the shape of a card without looking at it. You propose the following challenge: in a normal deck of 52 cards, you would draw, at random, 100 cards, one by one, ask the shape to the seer and returning it to the deck. From this experiment, you have to model a hypothesis testing to verify if the seer has the gift that she claims to have. In your test, choose the smaller critical region so that the type I error be less than 5%.

### Prerequisites
Excel 2010 and Matlab 2017b
## Authors
* **Arthur Silveira**
## Acknowledgments
Thanks to Alexandre Ashade, Statistical Methods for Decision Supporting teacher of BI-Master 2017.2 course at PUC-Rio (Brazil), for the problems suggested.
