#Deepthi Kandregula 
#9/15/2020 
#North Carolina births

#1. 

#read from source when compressed
library(readr) 
url <- "https://www.openintro.org/data/csv/ncbirths.csv"
#read a csv file
births<-read_csv(file = url)
head(births)
length(births)

#2.

#assign the result to a variable Premature Births
table(Habit=births$habit, Premie=births$premie)
#Table of counts with totals
addmargins(table(Habit=births$habit, Premie=births$premie))
#Table of relative frequencies (probabilities)
prop.table(table(Habit=births$habit, Premie=births$premie))
#Table of relative frequencies (probabilities) with totals
addmargins(prop.table(table(Habit=births$habit, Premie=births$premie)))
type<-addmargins(prop.table(table(Habit=births$habit, Premie=births$premie)))
#round the values to 4
round(addmargins(prop.table(table(Habit=births$habit, Premie=births$premie))),4)

#3. 

#The probability that a woman who smokes during pregnancy will give birth prematurely is:
round((0.0190/0.1263),4)
#0.1504

#4. 

#The probability that a woman who does not smoke during pregnancy will give birth prematurely:
round((0.1333/0.8737),4)
#0.1526

#5. 

#The probability of giving birth prematurely is higher for a non smoker than a smoker during pregnancy
#The odds ratio for a smoker vs non-smoker giving birth prematurely is:
round(round((0.0190/0.1263),4)/round((0.1333/0.8737),4),4)
#0.1504/0.1526=0.9856

#6. 

table(Habit=births$habit, Premie=births$lowbirthweight)
addmargins(table(Habit=births$habit, Premie=births$lowbirthweight))
prop.table(table(Habit=births$habit, Premie=births$lowbirthweight))
round(addmargins(prop.table(table(Habit=births$habit, Premie=births$lowbirthweight))),4)
#The probability that a woman who smokes during pregnancy will give lowbirthweight is:
round((0.0180/0.1261),4)
#0.1427
#The probability that a woman who does not smoke during pregnancy will give lowbirthweight is:
round((0.0921/0.8739),4)
# 0.1054
#The odds ratio for a smoker vs non-smoker giving lowbirthweight is:"
#0.1427/0.1054=1.35389

#7. 

group <- (births$lowbirthweight)
low <- births[which(group =="low"),]
notlow <- births[which(group =="not low"),]
boxplot(list(NotLow=notlow$weight,Low=low$weight), ylab ="Smoking Habit",  main = "Effect of smoking on birth weight", xlab =" Birth weight in pounds",horizontal= TRUE)

#. 7a.

#low birth weights are negatively skewed,not low birth weights are normally distributed"

#. 7b. 

#source link: https://www.uofmhealth.org/health-library/te6295#:~:text=The%20average%20birth%20weight%20for,usually%20lighter%20than%20later%20siblings.
# From the studies of University of Michigan the below link states below:
# The average birth weight for babies is around 7.5 lb (3.5 kg), although between 5.5 lb (2.5 kg) and 10 lb (4.5 kg) is considered normal. In general:
# Boys are usually a little heavier than girls.
#Hence ,Yes the classification for birth weight agrees with North Carolina births as it has mean eight 7.101 lbs


#8.
group <- (births$gender)
male <- births[which(group =="male"),]
female <- births[which(group =="female"),]
boxplot(list(Male=male$weight,Female=female$weight), ylab ="Gender", horizontal= TRUE, main = "Gender by birth weight", xlab =" Birth weight in pounds")

# From the Box plot we see the below:
# Male babies are slightly heavier than the Female babies as per the outliers
#Female babies are negatively skewed between ~4-9.8 pounds,Male babies are normally distributed between ~4-10.25 pounds
