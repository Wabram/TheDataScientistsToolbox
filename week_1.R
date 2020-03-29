## R programming
str(con)
con<-url("http://www.jhsph.edu","r")
X<-readLines(con)
head(X)

?lapply


## Getting data
# from MariaDB
func_RMySQL<-ls("package:RMySQL") # 60 functions
func_DBI<-ls("package:DBI") # 66 functions
ucscDb <- dbConnect(MySQL(),user="genome",host="genome-mysql.cse.ucsc.edu")
result2 <- dbGetQuery(ucscDb, "show;")
dbDisconnect(ucscDb)
result2

# merging
mergedData2<-merge(reviews,solutions,by.x="solution_id",by.y="id", all=TRUE)
head(mergedData2[,1:6],3)


## EDA
qplot(displ, hwy, data= mpg)
qplot(displ, hwy, data= mpg, geom=c("point","smooth"))
# K-means clustering -- clustering into relevent groups thet are similar each other the bunch of observations
set.seed(1234)
par(mar=c(0,0,0,0))
x<-rnorm(12, mean=rep(1:3,each=4),sd=0.2)
y<-rnorm(12,mean=rep(c(1,2,1),each=4),sd=0.2)
plot(x,y,col="blue",pch=19,cex=2)
text(x+0.05,y+0.05, labels = as.character(1:12))


## Reproducible




## Statistical Inference
source("https://bioconductor.org/biocLite.R")
biocLite("UsingR")
library(bootstrap)
try(data(package = "datasets"))
temp <- jackknife(x, median)
c(temp$jack.bias, temp$jack.se)

B<-1000
resamples<-matrix(sample(x,
                         n*B,
                         replace=TRUE),
                  B,n)
medians<-apply(resamples,1,median)
sd(medians)
quantile(medians,c(.025,.975))
hist(medians)

library(boot)
stat <- function(x, i) {median(x[i])}  
boot.out <- boot(data = InsectSprays[,1],
                 statistic = stat,
                 R = 72)
boot.ci(boot.out)

data(InsectSprays)
summary(InsectSprays)
boxplot(count ~ spray, data = InsectSprays)


subdata <- InsectSprays[InsectSprays$spray %in% c("B", "C"),]
y <- subdata$count
group <- as.character(subdata$spray)
testStat <- function(w, g) mean(w[g == "B"]) - mean(w[g == "C"])
observedStat <- testStat(y, group)
permutations <- sapply(1 : 10000, function(i) testStat(y, sample(group)))
observedStat
mean(permutations > observedStat)
hist(permutations)
?line


## Practical machine learning
### gbm package
### pamr package
biocLite("caret")
library(caret)
library(kernlab)
data(spam)
?createDataPartition
inTrain<-createDataPartition(y=spam$type,p=0.75,list=FALSE)
training<-spam[inTrain,]
testing<-spam[-inTrain,]

M<-abs(cor(training[,-58]))
diag(M)<-0
which(M>0.8,arr.ind=T)

# Adaboost on Wikipedia
# webee.technion.ac.il/people/rmeir/BoostingTutorial.pdf