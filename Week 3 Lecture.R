# Week 3 Lecture 1 

# LOOPS, ALGORITHMS and FUNCTIONS

# Loops

# Do not use loops, if possible
# R uses vectors itself
# apply functions instead of loops

# Types: for, while, repeat

# for Loops

for (i in c(1:5)) {
  cat("Iteration:", i, "\n")
}

for (i in data.frame(a=c(1:4), b = LETTERS[1:4])) {
  cat("Iteration:", i, "\n")
}

for (i in c(1:5)) {
  cat("Iteration","\n")
}

rm(list = ls()) # Clean environment

a <- c(1:10)
set.seed(123)
b <- sample(10,10)

c <- a + b

d <- NULL
for (i in c(1:10)) {
  d[i] <- a[i] + b[i] 
} # does the same thing as a + b


set.seed(123)
df <- data.frame(a = c (1:10), b = sample(10,10))

for (i in df){
  cat("Mean value:", mean(i), "\n")
}

sapply(df, mean)                 

# odtuclass'ta devamı

aa <- sample(1:100,100000, replace = TRUE)
aa <- aa - 50

system.time(aa)
