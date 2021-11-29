# HOMEWORK 1
library(data.table)
library(dplyr)
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

DTM <- rbind(DT, DX, fill = TRUE)

#k)

sum(DTM[which(DTM[,1]<23),3])

#l)

DTS1 <- rbind(subset(DT, gender == "m")[sample(2),],subset(DT, gender == "f")[sample(2),])

#m)

DT[ DT$w %in% tapply(DT$w, DT$gender, min), ]
#n)

aggregate(DT[ , 3], list(DT$gender), mean)

#o)

DT %>%                      
  group_by(gender) %>% 
  summarise(w = n())

DT %>%                      
  group_by(gender) %>% 
  summarise(sd = sd(w))


#Question 2

ID <- c(1:1000)

samp <- sample(ID, 100)

logvec <- NULL

for (i in 1:length(ID)){
  logvec[i] <- ID[i] %in% samp
}

# Question 3

ID <- c(1:1000)

logvec <- sample(c(TRUE,FALSE), size = 1000, replace = TRUE, prob = c(0.1,0.9)) 
logvec

# Question 4

#a) Finding mean

meanCol <- NULL

findMean <- function(dt){
  for (i in 1:ncol(dt)){
    x[i] <- mean(dt[,i])
    i <- i + 1
  }
  return(x)
}

#b) Finding NA

x <- NULL

findMiss <- function(DT){
  for (i in 1:nrow(DT)) {
    x[i] <- is.na(DT[i,])
    i <- i + 1
  }
  sum <- sum(x)
  return(sum)
}

#c) Finding factorial

fact = 1

findFactorial <- function(x){
  if(x < 0) {
    print("Factorial does not exist for negative numbers.")
  } else if(x == 0) {
    print("The factorial of 0 is 1.")
  } else {
    for(i in 1:x) {
      fact = fact* i
    }
    return(fact)
  }
  
}

# Finding integer

findInteger <- function(v){
  for (i in 1:length(v)){
    if (is.na(v[i])){ next
      
  } else if(round(v[i]) == v[i]){
    n <- i
    return(n)
  }
    else if(!isFALSE(all(v != floor(v)))){
    return(NA)}
    
  }
  
}






