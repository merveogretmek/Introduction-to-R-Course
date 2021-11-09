# Week 2 Lecture

rm(list = ls()) # Cleans global environment

# DATA OBJECTS

# Vector 1-dim
# Matrix 2-dim each column same type of data
# Array n-dim

# Data frames 2-dim columns: variables, rows: obs - columns can have diff data types

#--- Until now all of them in base R ---

# Data table 2 dim - comes with data.table package

# List 1-dim - elements could be any type of data 

#VECTORS

# functs: c, rep, seq, runif

a <- c(1, 2, 3)
b <- c(1L, 2L, 3L) # integer vector
c <- c(TRUE, TRUE, FALSE) # logical vector
d <- c("this", "that", "these") # character vector

class(a)
class(b)
class(c)
class(d)

str(a)

summary(a) # Summary statistics

a <- rep(c(1:2), times = 3)
a <- rep(c(1:2), each = 3)
a <- rep(c(1:2), len =3)

a <- seq(from = 1, to = 2, by = 0.1)
a <- seq(1, 2, 0.3)

a <- seq(1, 2, length.out = 7) # seven elements with equal increments

set.seed(123) # initial number for number generator

a <- sample(c(1:6), size = 1, replace = TRUE)

a <- sample(c(1:6), size = 6, replace = TRUE, prob = c(0.2, rep(0.1, 5)))

id <- c(1:1000)
ids <- sample(id, size = 20, replace = FALSE)

a <- runif(10) # default: min=0, max=1 -> random number from uniform dist.

a <- sample(c(1:100), size = 10, replace = FALSE)
class(a)

a <- as.integer(runif(10, min = 0, max = 100)) # to get integer values

b <- round(runif(10, 0, 100), 2) # to get two decimal points

# Sample with probabilities

a <- sample(c(1:2), size = 100, replace = FALSE) # gives error

a <- sample(c(1:2), size = 100, replace = TRUE,
            prob = c(0.9, 0.1))
sum(a == 1)
sum(a == 2)


# Empty vectors

a <- vector(mode = "integer", length = 10)

a <- vector(mode = "numeric", length = 10)

a <- numeric(length = 10)


# Indexing with vectors

a <- c(1, 2, 5)

a[1] # first element
a[3] # third element
a[c(1,3)] # first and third elements

b <- a[c(1,3)]

a[c(TRUE, FALSE, TRUE)] # first and third elements

a[3] <- 10 # new element

a[4] <- 5 # new element

a[10] <- 20 # missing values become NA

b <- a > 10

a[b] 
#or
a[a > 10]

b <- is.na(a) # replacing NA with 0
b
a[b] <- 0
a
#or
a[is.na(a)] <- 0


# Matrix

a <- matrix(c(1:12), nrow = 4, ncol = 3, byrow = TRUE) # numbers are used to fill in rows first

b <- matrix(c(1:12), nrow = 4, ncol = 3, byrow = FALSE) # numbers are used to fill in columns first

b[2,1] # row, column
b[c(2,3), 1]
b[c(F,T,T,F),1]

class(a)


# Data frame

aa <- data.frame(a = 1:4, 
                 b = c("a", "b", "c", "d"),
                 z = c(1, 3, 5, NA))
class(aa)
str(aa)
summary(aa)

ss <- is.na(aa$z) # checks for missing values
ss <- !ss # opposite

bb <- aa[ss,] # take only available values
bb <- aa[!is.na(aa$z),]

# Indexing with columns

aa$a # as a vector
aa[, 1] # as a vector
aa[["a"]] # as a vector
aa[, "a"] # as a vector

# Chaining
aa[c(2,3), "a"]
aa[c(2,3),]$a
aa[c(2,3),][,"a"]

# Adding new variables

aa$q <- c(10, 11, 13, 14)
aa$w <- 10 # fills whole column with 10
aa$e <- c("e", "f") # recycles until column is full
aa$f <- c("e", "f", "g") # gives error
aa$h <- aa$a * aa$z 

# Deleting variable

aa$e <- NULL

# Adding missing value

aa$h <- NA

# Changing order

bb <- aa[, c("a", "q", "z", "b")]


# Lists

a <- list(a = c(1:10),
          b = c("a"),
          c = c(TRUE, FALSE))

class(a)
str(a)

# A list can include a list:
b <- list(d= c(1:5), e = a)
str(b)

a$a
a$b

b$d
b$e$c
b$e$c[1]

sum(a$a > 5) # how many of them are greater than 5

class(a[1])
a[1]
a[[1]]

class(a[1])
class(a[[1]])

a[[1]][2]
