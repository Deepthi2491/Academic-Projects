#1.


library(readr) 
url <- "https://www.openintro.org/data/csv/ncbirths.csv"
#read a csv file
births<-read_csv(file = url,header=T,sep=",")
head(births)
length(births)

#2.
births$netgain<-births$gained-births$weight
head(births)

#3. 
births1=births[,c("weight","weeks","mage","netgain")]
round(cor(births1,use="complete.obs"),2)
pairs(births1)
m1=lm(formula=weight~weeks+mage+netgain,dat=births1)
summary(m1)


#4.
#For each additional week the increase in weight is 0.342249lbs and carries enough information and significant to 
#say slope of weeks is different from 0 which is null hypothesis(Ho).p-value of weeks is <2e-16 which is very 
#small using a level of significance 0.05 and greater than zero ,hence we reject the Ho.

#5. 
#A very small p-value of 0.000617 using a level of significance 0.05 means that such an extreme observed outcome 
#would be very unlikely under the null hypothesis that slope coefficient of "mage" is 0.

#6. 
confint(m1) 
summary(m1)
#prediction fails on average by Residual standard error 1.11, model m1 explains 1.11% variability
#by the R-squared, the model explains 44.73% of the variability in weight.
#and the typical deviation of weights in a prediction is about 1.111lbs.


#7.

#. mean residual
mean(resid(m1)) 
#it is as close as zero as we can get.Our residuals for model m1 conform to the first item
#The errors have zero expectation,are uncorrelated and equal variances
install.packages("lmtest")
library(lmtest)

#. heteroscedasticity
#Ho: homoscedasticity
bptest(m1)
#p-value is 0.1812 which is significant with the level of significance 0.05 which means our estimates of slopes 
#can be effected and we are not going reject Ho homoscedasticity therefore we can assume that observed outcome
#would be very likely to occur with homoscedasticity in our population

#. serial correlation
#Ho: No first order autocorrelation
dwtest(formula=m1,alternative="two.sided")
#p-value(0.9324) is greater than the level of significance 0.05 and we not going to reject null hypothesis therefore we 
#can assume that observed outcome would be very likely to occur where there is no first order autocorrelation 

#. normality of residuals
#Ho: Gausssian distributed
shapiro.test(resid(m1))

#we have p-value 0.1713 which we are not going to reject with the level of significance 0.05 based on the test 
#we are not going to reject Ho therefore we can assume that observed outcome would be very likely to occur 
#with gaussian distribution.
