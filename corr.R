corr <- function(directory, threshold = 0) {
    files <- list.files("specdata", full.names=TRUE)
    dat <- numeric()
    for (i in 1:332) {
        id_nobs <- read.csv(files[i])
        if(sum(complete.cases(id_nobs)) > threshold) {
            cr <- cor(id_nobs$sulfate, id_nobs$nitrate, use = "complete.obs")
            dat <- rbind(dat, cr)
        }
    }
    return(dat)
}
corr2
corr3
corr4
