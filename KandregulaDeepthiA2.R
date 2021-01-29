#1.

library(readr) 
url <- "https://www.openintro.org/data/csv/ncbirths.csv"
#read a csv file
births<-read_csv(file = url)
head(births)
length(births)


#2. 

#assign the result to a variable Premature Births
table(Premie=births$premie,Habit=births$habit)
#Table of counts with totals
addmargins(table(Premie=births$premie,Habit=births$habit))
#Table of relative frequencies (probabilities)
prop.table(table(Premie=births$premie,Habit=births$habit))
#Table of relative frequencies (probabilities) with totals
addmargins(prop.table(table(Premie=births$premie,Habit=births$habit)))
type<-addmargins(prop.table(table(Premie=births$premie,Habit=births$habit)))
#round the values to 4
round(addmargins(prop.table(table(Premie=births$premie,Habit=births$habit))),4)


#3. 
#Null hypothesis Ho:The variables habit(smoker/nonsmoker) and premature(premie/full-term) are independent
#Alternative hypothesis Ha: The variables habit(smoker/nonsmoker) and premature(premie/full-term) are not independent
#we select chi squared test of independence since both habit and premature are categorical data 
#which are organized as contigency table in #2
Premie=births$premie
Habit=births$habit
chisq.test(Premie,Habit, correct=FALSE)
chisq.test(x=table(Premie,Habit), correct=FALSE)

#4. 

#Based on the result from #3 with a small X-squared statistic = 0.00255 and 1 degree of freedom
#we have p-value=0.9597 is the probability of accepting or rejecting the null hypothesis
#which is statistically significantly greater than the level of significance 0.01 and 
#there is 95.57% chance of Ho and distribution is positively skewed
#hence we fail to reject the null hypothesis Ho that is habit and premie are independent of another

#------------------------PROFESSORs ANSWER--------------------------------------------
#At the 0.01 level of significance ,the results suggest no evidence of a relationship between smoking habits 
#and premature birth(p-value=0.9597) there fore the chi-squared value of 0.0025 obtained from the data is 
#likely to occur by chance if smoking habits and premie are independent.

#5.
#Null hypothesis Ho:Average weights of babies for a woman who smokes and does not smoke during pregnancy are equal
#Alternative hypothesis Ha:Average weights of babies for a woman who smokes and does not smoke during pregnancy are not equal
#we select students t-test as the data is independent, it is often useful to look at the difference
#in outcomes of each pair of observations
#Ho: Mu diff=0 where diff is the difference in average weights of babies
#Ha: Mu diff!=0
births_habit_split<-split(births,births$habit)
smoker<-births_habit_split$smoker
non_smoker<-births_habit_split$nonsmoker
t.test(smoker$weight,non_smoker$weight,conf.level=0.99,alternative = 'two.sided')

#6.
#p-value=0.01945 is the probability of accepting or rejecting the students t-test where the average difference is 
#atleast  t-value(-2.359 in either direction) where p is slightly greater than the level of significance 0.01 
#and close enough to 0 but not statistically significant to reject Ho and we cannot reject Ho null hypothesis 
#indicating there is no difference between Average weights of babies for a woman who smokes 
#and a woman who does not smoke during pregnancy 

#-------------PROFESSORS ANSWER--------------------------------------------------------------
#At the 0.01 level of significance there is not enough evidence to suggest that the mean weight for babies from
#smokers and non smokers is different(pvalue=0.01945).The evidence from the data (t=2.359) is 
#likely to occur by chance given that the two mean weights (smokers vs non smokers ) are the same.


#visualization of our chi-square value in the chi square distribution

#additional for my understanding
#chi-square graph
set.seed(123)
hist(x =rchisq(n = 1000,df = 1))
abline(v = 0.0025, col="red")
