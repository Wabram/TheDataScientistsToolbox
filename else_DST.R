

# merge
fileUrl1 <- "https://www.dropbox.com/s/eoagiqk6m0ll06y/outcome-of-care-measures.csv?dl=0"
fileUrl2 <- ""
download.file(fileUrl1,destfile="./data/outcome-of-care-measures.csv",method="auto") # auto or wininet
download.file(fileUrl2,destfile="./data/.csv",method="wininet") # auto or wininet
reviews <- read.csv("./outcome-of-care-measures.csv")
solutions <- read.csv("./data/.csv")
head(reviews,2)
str(reviews)
head(reviews)
ncol(reviews)
names(reviews)
reviews[, 11] <- as.numeric(reviews[, 11])
hist(reviews[, 11])


library(Hmisc)
timeRanges<- cut2(reviews$time_left,g=6)
table(timeRanges,useNA="ifany")


##SI

library(UsingR)
data(father.son)
x <- father.son$sheight
n <- length(x)
theta <- median(x)
jk <- sapply(1 : n,
             function(i) median(x[-i])
)
thetaBar <- mean(jk)
biasEst <- (n - 1) * (thetaBar - theta) 
seEst <- sqrt((n - 1) * mean((jk - thetaBar)^2))


# line
require(graphics)

plot(cars)
(z <- line(cars))
abline(coef(z))
## Tukey-Anscombe Plot :
plot(residuals(z) ~ fitted(z), main = deparse(z$call))

## Andrew Siegel's pathological 9-point data, y-values multiplied by 3:
d.AS <- data.frame(x = c(-4:3, 12), y = 3*c(rep(0,6), -5, 5, 1))
cAS <- with(d.AS, t(sapply(1:10,
                           function(it) line(x,y, iter=it)$coefficients)))
dimnames(cAS) <- list(paste("it =", format(1:10)), c("intercept", "slope"))
cAS
