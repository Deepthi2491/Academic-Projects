
#0. Read the dataset. Make sure that the variable "Area" is a factor.

dat<-read.table(file="C:/Users/Deepthi/Desktop/R/assessed_value.csv",header=T,sep=",",colClasses=c("numeric","numeric","factor","factor"))
head(dat)

#1.
m1 <- lm(Assess_year_2~Area, data=dat)
summary(m1)
anova.1 <- aov(Assess_year_2~Area, data=dat)
summary(anova.1)

#2. 

#Yes there is statistically significant difference as a very small p-value of 0.01184 using a level of
#significance 0.05 and F-statistic is 2.495 which is greater than 1 means that there is enough evidence 
#that at least one area mean assessed property value is different from east central area 
#hence we reject the null hypothesis as it is very unlikely that mean assessed property value 
#for the various areas in Wisconsin are all equal.

#For example Areafar west has a significant p-value of 0.00049 using a level of significance 0.05 
#which supports the evidence that the Areafar west differs from east central mean assessed property value.

library(ggplot2)
g0<-ggplot(dat,aes(factor(Area),Assess_year_2))
g0 + geom_boxplot()

#3. 

postHocs<-glht(anova.1, linfct = mcp(Area = "Tukey"))
summary(postHocs)
confint(postHocs)

#Areafar west has statistically significant different mean assessed values
#far west has greater assessed property values compared to east central,far east,near east,near west,west central 
#based on the estimate for each difference .


#4.

#. mean residual
mean(resid(anova.1 )) 
#-4.344689e-13 is as close as zero as we can get.Our residuals for model anova.1 conform 
#to the first item in the Guass-Markov theorem
#The errors have zero expectation,are uncorrelated and equal variances

#. heteroscedasticity
library(lmtest)
#Ho: homoscedasticity
bptest(anova.1 )
#p-value is 0.7112 which is not very significant and greater than the level of significance 0.05 which
#means our estimates of slopes cannot be effected by this problem and we have found enough evidence to 
#not reject Ho homoscedasticity therefore we can assume that observed outcome would be very likely to 
#occur with homoscedasticity in the areas of wisconsin.


#. serial correlation
#Ho: No first order autocorrelation
dwtest(formula=anova.1 ,alternative="two.sided")
#p-value(0.9026) is greater than the level of significance 0.05 and we do not reject null hypothesis 
#therefore we can assume that observed outcome would be very likely to occur where there is 
#no first order autocorrelation 

#. normality of residuals
#Ho: Gausssian distributed
shapiro.test(resid(anova.1 ))
#we have p-value 4.203e-10 which is significant with the level of significance 0.05 based on the test 
#we reject Ho therefore we can support that observed outcome would be very unlikely to occur 
#with gaussian distribution.

hist(resid(anova.1),col="lightblue")


