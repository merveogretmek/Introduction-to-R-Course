ID <- c(123, 345, 567, 789, NA)
gender <- c(NA, "F", "F", "M", "M")
age <- c(20:24)
income <- c(1000:1004)
education <- c("high school", "uni", NA, "high school", "high school")

popDat <- data.frame(ID, gender, age, income, education)
popDat
popDatCleaned <- popDat[!is.na(popDat$ID), ]



findFactorial <- function(X) {
  
  if (X < 0) {
    Z <- "Please enter a non-negative number."
  }if (X > 0) {
    
  }
}

findFactorial <- function(X) {
  if (X = 0) {
    Z <- 1
    
  }
  
  if (X < 0) {
    Z <- "Please don't enter a negative number."
  }
  
  if (X != round(X)){
    Z <- "Please enter an integer."
  }
  
  else {
    Z <- 1
    repeat{
      if (X == 0) break
      Z <- Z * X
      X <- X - 1}
  }
    
  return (Z)
}

findFactorial(4)

is.integer(5)


