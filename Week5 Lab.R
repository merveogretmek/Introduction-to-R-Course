# Week 5 Lab

library(data.table)

set.seed(123)
ns <- 100
DF <- data.frame(id = c(1:ns),
                 class = c(1:4),
                 grade = c(1:100),
                 gender = c("F","M"))

DT <- as.data.table(DF) # create new object in computer memory (two objects)

setDT(DF) # nothing happens in computer memory, just converts to datatable

# Same dataset, add new variable

DT[, honor := grade >= 80]
names(DT)
summary(DT$honor)
head(DT, n = 10)

DT[, honor := ifelse(grade >= 80, 1, 0)]
summary(DT$honor)

# If you are using dataframe you have to type df$ because it works in global env. 
#In datatable, it works in datatable so we don't need the $ sign.

head(DT)

head(DT[honor == 1])
DTH <- head(DT[honor == 1])
class(DTH)

DT[gender == "F" & grade >= 80, fhonor:= 1]
head(DT)

DT[is.na(fhonor), fhonor := 0]
head(DT)

DT[, fhonor2 := ifelse(gender == "F" & grade >= 80, 1, 0)]
DT


# Create two variables

DT[, c("honor","hhonor") :=
     list(ifelse(grade >= 80 & grade < 90, 1, 0),
          ifelse(grade >= 90, 1, 0))]
DT

# More clear

DT[, honor := ifelse(grade >= 80 & grade < 90, 1, 0)]
DT[, hhonor := ifelse(grade >= 90, 1, 0)]

DT[, honors2 := ifelse(grade >= 90,2,
                       ifelse(grade >= 80,1,0))]


# Chaining Operations

DT[, error := rnorm(100)]
DT[, sqerr := error^2]

DT[, error := rnorm(100)][, sqerr:= error^2][, mean(sqerr)]

head(DT)
