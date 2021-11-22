# Week 6 Lecture

# Datatables

set.seed(123)
nstudent <- 100

DF <- data.frame(id = 1:nstudent,
                 class = c(1:4),
                 gender = sample(c("M","F"), size = nstudent, replace = TRUE),
                 grade = runif(nstudent,50,100))

DT <- as.data.table(DF)

identical(DF,DT) # they are different data types, not identical

# Operating on rows

# enter row number
DT[c(1, 3)] # on datatable we don't need to put the comma
DF[c(1,3)] # on dataframe we get columns instead of rows

# enter a logical vector
DT[grade > 95]

DT95 <- DT[grade > 95]

# Operating on columns

# select variables
DT[c(1:3), c(1:2)]
DT[c(1:3), list(id, class)]
DT[c(1:3, .(id, class))] # can't find function . ?
DT[c(1:3), c("id", "class")]
DT[c(1:3), !c("id", "class")]
DT[c(1:3), id] # outcome is a vector
DT[c(1:3)]$id # outcome is a vector
DT[c(1:3), list(id)] # outcome is a datatable

# Create and modify new variables

DT[grade >= 80, honor := 1] 
DT[is.na(honor), honor := 0]

# Delete variables

DT[, honor := NULL]
names(DT)

# Change names

setnames(DT, "grade", "gpa")
names(DT)

setnames(DT, c("gender", "gpa"), c("sex", "point")) # multiple change
names(DT)

setnames(DT, c("id", "class", "gender", "grade")) # change all

# Aggregation - operating on variables

mean(DT$grade)
mean(DT$grade, na.rm = TRUE)
DT[, mean(grade, na.rm = TRUE)]

DTmean <- DT[, mean(grade, na.rm = TRUE)] 
class(DTmean)

DT[, list(mean(grade),
          min(grade),
          max(grade))]

DT[, list(gmean = mean(grade),
          gmin = min(grade),
          gmax = max(grade))]

DTdes <- DT[, list(gmean = mean(grade),
                   gmin = min(grade),
                   gmax = max(grade))]
class(DTdes)
DTdes$gmax

DT[, gmean := mean(grade)]

head(DT)

DT[, grade_diff := grade - gmean]

DT[, gmean := NULL]
DT[, grade_diff := NULL]

DT[, gmean := mean(grade), by = class] # calculate mean for each class
DT[, grade_diff := grade - mean(grade), by = class]

DT[, grade_diff_gender := grade - mean(grade), by = list(class, gender)] # ASK ??

# DT[i, ji by]
DT[, mean(grade), by = list(class, gender)]
DT[, mean(grade), keyby = list(class, gender)] # ordered by class and gender
DT[, mean(grade), keyby = list(gender, class)] # ordered by gender and class

DT[, mean(grade), keyby = list(class, grade >= 80)]
DT[grade >= 80, mean(grade), keyby = class]

# Selecting rows by .SD
DT[, lapply(.SD, mean),
   by = class, .SDcols = c("grade", "honor")]

sapply(DT, is.numeric)
names(DT)

nvars <- names(DT)[sapply(DT, is.numeric)] 
nvars

DT[, lapply(.SD, mean),
   by = class, .SDcols = nvars] # SD is applicable for any datatable

# keys

setkey(DT, class, gender)
key(DT)

DT[class == 1 & gender == "M", mean(grade)]
DT[list(1, "M"), mean(grade)] # this is faster

library(microbenchmark)

microbenchmark(DT[class == 1 & gender == "M", mean(grade)],
               times = 1000, unit = "ms") # Ask the warning message

microbenchmark(DT[list(1, "M"), mean(grade)],
               times = 1000, unit = "ms")

# Merging dataset
# DT students' data
# DTI instructors' data

DTI <- data.table(iid = c(1:3),
                  igender = c("M","F","F"),
                  inst = c("A", "B", "C"),
                  class = c(1:3))

DTM <- DT[DTI, on = "class"] # got rid of class 4 because DTI doesn't have it 
summary(DTM)

# to get class 4
DTM2 <- DTI[DT, on = "class"]
dim(DTM2)
head(DTM2)[class == 4] # class 4 didn't work for me !!

# Reshaping the data

# Wide format
set.seed(1234)
DTW <- data.table(country = c("TR", "DE", "US"),
                  Y2000 = rnorm(3),
                  Y2001 = rnorm(3),
                  Y2002 = rnorm(3),
                  Y2003 = rnorm(3))

# Above data is called wide data

# Wide-to-long format : melt function
DTL <- melt(DTW, id.vars = "country", 
            variable.name = "year",
            value.name = "gdpgrowth")
str(DTL) #year is factor not numeric because of Y


DTL[, year := as.integer(substr(year, 2, 5))]
str(DTL)

# Long-to-wide format: dcast
DTW2 <- dcast(DTL, country ~ year, value.var = "gdpgrowth")
old_names <- names(DTW2)[c(2:5)]
new_names <- paste0("Y", old_names)
setnames(DTW2, old_names, new_names)

# Special values in datatables

# .I row number
# .N counter
# .GRP group number

# Special functions

# %in% 
# shift 

