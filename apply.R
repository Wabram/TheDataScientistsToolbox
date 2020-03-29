#apply
m <- matrix(c(1:10, 11:20), nrow = 10, ncol = 2)
apply(m, 1, mean)
apply(m, 2, mean)
#lapply
l <- list(a = 1:10, b = 11:20)
lapply(l, mean)
class(lapply(l, mean))
#sapply
l <- list(a = 1:10, b = 11:20) 
l.mean <- sapply(l, mean)
class(l.mean)
#tapply
attach(iris)
colnames(iris)
## mean petal length by species
tapply(iris$Petal.Length, Species, mean)
#by
attach(iris)
colnames(iris)
by(iris[, 1:4], Species, colMeans)
#sqldf
install.packages("sos")
library(sos)
sos::findFn("sqldf")
install.packages("sqldf")
library(sqldf)
?sqldf
attach(iris)
Petal.Length_mean=mean(iris$Petal.Length) 
summarization <- sqldf("select Species, mean(Petal.Length) from Petal.Length_mean where Species is not null group by Species")

#ddply
library(plyr)
attach(iris)
## mean petal length by species
ddply(iris,"Species",summarise, Petal.Length_mean = mean (Petal.Length))


#data.table


#
install.packages("dplyr")
library(dplyr)
group_by()

install.packages("titanic")
library(titanic)
objects(grep("titanic", search()))
df%
group_by(Class, Sex, Age, Survived) %>%
  
  summarise(Count = n())
attach(Titanic)
class(Titanic)
