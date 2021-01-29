#1. 

library(readr) 
url <- "https://www.openintro.org/data/csv/ncbirths.csv"
births5<-read.table(file = url,header=TRUE,sep=",")
births5$gender.c<-as.factor(x=births5$gender)
births5$habit.c<-as.factor(x=births5$habit)
head(births5)

#2. weight = 0 + 1habit + 2gender + 3weeks + 4mage + 
m3=lm(formula=weight~habit.c+gender.c+weeks+mage,dat=births5)
summary(m3)

#3. 
#Ho: Slope of habitsmoker is different from 0
#For each smoker the decrease in weight is 0.343796lbs which is significant compared to the nonsmoker to say slope of habitsmoker
#is different from 0 which is null hypothesis(Ho).
#A coefficient of -6.746665 with a p-value 0.0002 using a level of significance 0.05 means that such an observed outcome 
#would be very likely to occur under the null hypothesis that slope coefficient of "habit" is different from 0 hence we have enough evidence 
#accept the Ho.

#4. 
m1<-lm(formula=weight~gender.c,data = births5)
summary(m1)

#Residual standard error: 1.496 on 998 degrees of freedom
#Multiple R-squared:  0.01747,	Adjusted R-squared:  0.01648 

m2<-lm(formula=weight~gender.c+habit.c,data = births5)
summary(m2)

#Residual standard error: 1.49 on 996 degrees of freedom
#Multiple R-squared:  0.02254,	Adjusted R-squared:  0.02058 

summary(m3)
#Residual standard error: 1.093 on 993 degrees of freedom
#Multiple R-squared:  0.4754,	Adjusted R-squared:  0.4733 

#prediction fails on average by Residual standard error 1.093, model m3 explains 1.093% variability
#by the R-squared, the model explains 47.54% of the variability in weight.
#and the typical deviation of weights in a prediction is about 1.093lbs.
#Model is improved on adding habit and gender as they contribute to the model since the Adjusted R-squared increases to 0.4733 from 0.01648


#5. 
newdata<-data.frame(habit.c='smoker',gender.c='female',weeks=38,mage=30)
predict(m3,newdata,interval = "prediction")

#Based on the prediction interval the weight of the baby is between 4.406764 lbs and 8.718342lbs ,
#from Assignment1 we get the information that the normal weight of female babies are between ~4-9.8 lbs ,
#hence based on the evidence it can be predicted that the baby will not be below normal weight for a smoker with 95% prediction interval.


#6.

newdata<-data.frame(habit.c='nonsmoker',gender.c='male',weeks=42,mage=30)
predict(m3,newdata,interval = "prediction")
#Based on the prediction interval the weight of the baby is between 6.500494 lbs and 10.79973lbs ,
#from Assignment1 we get the information that the normal weight of male babies are between ~4-10.5 lbs ,
#hence based on the evidence it can be predicted that the baby boy will not be below normal weight for a non smoker with 95% prediction interval.
