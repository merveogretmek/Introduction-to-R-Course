# Week 3 Lab1

# Algorithms

V <- c(1:10)

T <- 0
N <- 1

repeat {
  if(is.na(V[N])) break 
  T <- T + V[N]
  N <- N + 1
}

M <- T/(N-1)
M


# Functions

mySum <- function(a,b) {
  z <- a + b 
  return(z)
}

mySum(2,4)

mySum <- function(a, b = 0) {
  z <- a + b 
  return(z)
}

mySum(10)

findMean <- function(V) {
  T <- 0
  N <- 1
  
  repeat {
    if(is.na(V[N])) break 
    T <- T + V[N]
    N <- N + 1
  }
  
  M <- T/(N-1)
  return(M)
}

findMean(V)

aa <- c(1:10, NA)
mean(aa)
mean(aa, na.rm = TRUE)

meanNA <- function(...) {
  z <- mean(..., na.rm = TRUE)
  return(z)
}

meanNA(aa)

meanNA <- function(...) {
  z <- mean(..., na.rm = TRUE)
  y <- function(a) {
    q <- a + 10
    return(q)
  }
  return(z)
}

meanNA(aa)

rm(list = ls())

sumVal <- function(a, b = 10) {
  z <- a + b
  return(z)
}

aa <- 5

sumVal(aa)

z <- 100

sumVal(z) # works because other z is defined in the func. not in the glob. env.

sumVal <- function(a, b = 10) {
  z <- a + b + q
  return(z)
} # gives error because q is not defined anywhere

q <- 10

sumVal(100)

sumVal <- function(a, b = 100){
  q <- 100
  z <- a + b + q
  return(z)
}

sumVal(100)
