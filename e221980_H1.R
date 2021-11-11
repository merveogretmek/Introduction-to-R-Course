# HOMEWORK 1

# Question 1

DT <- data.table(ID = c(1:60), gender = c("m", "m", "m", "m", "f", "f"), w = c(1:3)) 
DX <- data.table(gender = c("m", "f"), w = c(1, 2), z = c(4, 2))

#a)
DT23 <- DT[c(2:3), ]

#b) 
DTm <- DT[DT$gender == "m", ]

#c)
DT[order(DT$w)]

#d)
aggregate(DT[ , 3], list(DT$gender), mean)

#e)

DT$gpa <- rnorm(nrow(DT))

#f)

for (i in 1:nrow(DT)) {
  
  if (DT$gender[i] == "m"){
    DT[i, "mw"] <- aggregate(DT[ , 4], list(DT$gender), mean)[2,2]}
  
  else {DT[i, "mw"] <- aggregate(DT[ , 4], list(DT$gender), mean)[1,2]}
  
  i = i + 1
}

#g)
nm <- 0
nf <- 0
for (i in 1:nrow(DT)) {
  
  
  if (DT$gender[i] == "m"){
    nm <- nm + 1}
  
  else {nf <- nf + 1}
  
  i = i + 1
}

# Output: nf = 20, nm 40

# I know this question could have been solved easily with count() function
# but I wanted to solve it by only using R base packages.

#h)

DT$wm <- DT$w == 1

#i)

setkeyv(DT, "ID")

#j)
merge(DT, DX, by = "gender")  #later

#k)

#Question 2

ID <- c(1:1000)

samp <- sample(ID, 100)

logvec <- NULL

for (i in 1:length(ID)){
  logvec[i] <- ID[i] %in% samp
}

# Question 3

ID <- c(1:1000)

samp1 <- runif(min = 1, max = 1000, )
samp2  <- sample(ID, prob = 0.1) 

# Question 4

#a)

findMean <- function(X){
  for (i in 1:ncol(X)) {
    for (j in 1:nrow(X)) {
      sum[j] <- 0 + X[i,j]
    }
  }
  meanvec <- sum[j]/nrow(X)
  return(meanvec)
}
