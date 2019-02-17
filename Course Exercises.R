#Exercise 1 - Simple vectors
x <- 10:20
y <- x+2
z <- y*3-6
answer <- z/3
print(answer)
answerY <- as.integer((((10:20+2)*3)-6)/3)
print(answerY)

#Exercise 2 - Data Types

cards <- c("Blue-Eyes White Dragon","Exodius","The Winged Dragon of Ra","Raigeki","Slifer the Sky Dragon","Obelisk the Tormentor","Black Luster Soldier","5-Headed Dragon","Exodia the Forbidden One","Dragon Master Knight")
typeof(cards)

atk <- c(3000L,NA,NA,NA,NA,4000L,3000L,5000L,1000L,5000L)
typeof(atk)

yugioh <- c(cards,atk)
typeof(yugioh)
print(yugioh)

#Exercise 3 - Coersion
monster <- c(T, T, T, F, T, T, T, T, T, T)
yugioh <- c(yugioh,monster)
print(yugioh)

coerce.check <- c(atk,monster)
print(coerce.check)

#Exercise 4 - Using Functions

#list environment objects
ls()
lvl <- c(8, 10, 10, 1, 10, 10, 8, 12, 1, 12)
print(sum(lvl))
print(mean(lvl))
print(median(lvl))
print(length(lvl))
print(sd(lvl))
print(round(sd(lvl)))

#Exercise 5 - More Functions

args(sample)
#x, size, replace = FALSE, prob = NULL

args(median)
#x, na.rm = FALSE, ...

median(lvl, na.rm=TRUE)

median(atk,na.rm = TRUE)
median(atk)
# NA or missing values make it difficult for R to do operations on objects because R doesn't know their value
# telling R to ignore them when running an operation is one of the easiest ways to sidestep this
# you will learn about other methods of dealing with missing data further on

#Exercise 6 - More Functions
draw <- function(){
   deck <- c("Duke", "Assassin", "Captain", "Ambassador", "Contessa")
   hand <- sample(deck, size=3, replace = T)
   print(hand)
}
flip <- function(){
   coin <- c("Heads", "Tails")
   theFlip <- sample(coin,100,c(0.3,0.7),replace = T)
   print(theFlip)
}
#Exercise 7 - Vector Recycling
Weight <- c(71, 67, 83, 67)
Height <- c(1.75, 1.81, 1.78, 1.82, 1.97, 2.12, 2.75)
BMI <- Weight/(Height^2)

#Exercise 8 - 
cards <- c("Blue-Eyes White Dragon","Exodius","The Winged Dragon of Ra","Raigeki","Slifer the Sky Dragon","Obelisk the Tormentor","Black Luster Soldier","5-Headed Dragon","Exodia the Forbidden One","Dragon Master Knight")
atk <- c(3000L,NA,NA,NA,NA,4000L,3000L,5000L,1000L,5000L)
names(atk) <- cards
attributes(atk)
names(atk) <- NULL

# Accessing Help. There are two main ways to get help on functions in R
# help(function_name)
# or
# ?function_name
# ?print
# ?sample
# ?ls - searches help for function name
# ??ls - searches CRAN for the keyword

#Vectors - 3 most common attributes
# Names, Dimensions, Class

# Creating empty vectors
vector.a <- vector(length=10)

#Exercise 9 - Indexing and Slicing vectors
atk <- c(3000L,NA,NA,NA,NA,4000L,3000L,5000L,1000L,5000L)
atk[6]
atk[-2]
atk[c(1, 3, 5, 7, 9)]
atk[-c(4,5,6)]
atk[atk>2000]
atk[seq(1,9,2)]

# Generating Sequences
seqof10s <- seq(10, 120, by=10)

#Exercise 10 - Vector Dimensions and Classes
# If you bend a vector into a matrix using Dimensions,
# the the class of the vector changes to matrix. 
# The underlying type of the data remains the same.
ex10Vector <- seq(2,30,2)
attributes(ex10Vector)
dim(ex10Vector) <- c(3, 5)
dim(ex10Vector) <- c(1, 3, 5)
print(ex10Vector)
# R creates 3 dimensional object but because the interface is 2-D, when asked to print it, 
# it returns slice-by-slice image 

# Multi-dimensional data structures can be useful for collecting/storing multi-dimensional data
# e.g. water pressure in different locations in a tank
# or for data that is best stored and accessed in a multidimensional array
# e.g. colors & their RBG spectrums

# Matrix Basics
# By Default, matrices are created by populating column-wise first.
# You can override by specifying byrow=TRUE which will result in populating by row
matrixbyColumn <- matrix(1:12,nrow = 3)
print(matrixbyColumn)
matrixbyRow <- matrix(1:12, nrow = 3, byrow = TRUE)
print(matrixbyRow)

# Additional methods to create matrices
# rbind() - Row bind
# cbind() - Column bind
# eg., matrix <- cbind(vectora, vectorb) creates a matrix by column-wise combining the vectors
# eg., matrix <- rbind(vectora, vectorb) creates a matrix by row-wise combining the vectors
# it is good practice to name the dimensions of your matrices
# colnames() and rownames() can be used for this purpose

colnames(matrixbyColumn) <- c("Col Name 1","Col Name 2", "Col Name 3", "Col Name 4")
print(matrixbyColumn)

rownames(matrixbyRow) <- c("Row name 1", "Row Name 2", "Row Name 3")
print(matrixbyRow)

# Transpose a mtrix to switch the columns and rows
# Transposed_matrix <- t(matrix)

# Creating Matrices in one line of code
# dimnames is an attribute of the matrix function() that allows you to specify all names
# colnames() 
# rownames() 
# allows you to specify names for a single dimension at a time
mega_matrix <- matrix(c(2,3,4,5,6,7,8,9,10,11,12,13),nrow = 4,byrow = TRUE,
                      dimnames = list(c("Name 1","Name 2","Name 3","Name 4"),c("Name 5","Name 6","Name 7")))
print(mega_matrix)

# Exercise 11 - More on Matrices
col1 <- c("dark","dark","dark","dark","dark","light","light","light","light","light")
col2 <- c("king","queen","pawn","pawn","knight","bishop","king","rook","pawn","pawn")
# - or -
player <- c(rep("dark", 5), rep("light", 5))
matrix1 <- cbind(col1,col2)
chess.bind <- cbind("Player" = col1, "Piece" = col2)

colnames(matrix1) <- c("Player","Piece")
print(matrix1)
col3 <- c(col1,col2)
dim(col3) <- c(10,2)
print(col3)
colnames(col3) <- c("Player","Piece")

# From Exercise Notes
player <- c(rep("dark", 5), rep("light", 5))

# the rep() function repeats a value the stated number of times
# use ?rep for more information

piece <- c("king", "queen", "pawn", "pawn", "knight", "bishop", "king", "rook", "pawn", "pawn")
chess <- c(player, piece)

dim(chess) <- c(10, 2)
colnames(chess) <- c("Player", "Piece")

# or

chess.mat <- matrix(chess, nrow = 10, dimnames = list(NULL, c("Player", "Piece"))) 

# Exercise 12
player <- c(rep("dark", 5), rep("light", 5))
piece <- c("king", "queen", "pawn", "pawn", "knight", "bishop", "king", "rook", "pawn", "pawn")
chess <- c(player, piece)
# bend a 1D vector into a 2D matrix
dim(chess) <- c(10, 2)
# give the matrix column names
colnames(chess) <- c("Player", "Piece")
print(chess)


# Exercise 13
# transpose matrix
player <- c(rep("dark", 5), rep("light", 5))
piece <- c("king", "queen", "pawn", "pawn", "knight", "bishop", "king", "rook", "pawn", "pawn")
chess <- c(player, piece)
dim(chess) <- c(10, 2)
chess2 <- t(chess)
turn <- c(3, 5, 2, 2, 7, 4, 6, 5, 2, 1)
chess2 <- rbind(chess2, "Turn"=turn)
rownames(chess2) <- c("Player", "Piece", "Turn")
chess2 <- t(chess2)
a <- chess2[6,2]
b <- chess2[ ,1:2]
# or
b <- chess2[ ,-3]
c <- chess2[ , c("Player", "Piece")]
d <- chess2[1:5, ]
e <- chess2[ , 2, drop = FALSE]
# get all the columns except column 2
f <- chess2[, -2]
# get row 2 columns 1 and 3
print(chess2[2, c(1, 3)])
chess2[7, 3] <- 3
print(chess2[7,3])

nums <- sample(1:100,size = 12)
matrixA <- matrix(nums, nrow = 3, byrow = TRUE, dimnames=list(c("Row 1","Row 2","Row 3"),c("Col 1","Col 2", "Col 3","Col 4")))

matrixB <- matrix(rep(c("item 1","item 2","item 3","item 4","item 5"), 3),ncol = 1)

# Exercise 13 - more matrix stuff
# use runif() to create a matrix
rmatrix <- matrix(round(runif(12,1,100),0), nrow = 3, ncol = 4, dimnames = list(c("X","Y","Z"),c("uno", "dos", "tres", "cuatro")))
# scale the matrix
scaled <- rmatrix/10
submatrix <- scaled[c("X","Y"), ]

# extract 3x3 matric
submatrix2 <- scaled[ ,-4]
uno <- scaled[, "uno"]
# you can only do matrix operations with two matrices when they are of the same size
# R's recycling rules apply when you try to do an operation with a matrix and a vector
# Use rnorm() to create a matrix
# ?rnorm()
new.mat <- matrix(round(rnorm(12,mean=10,sd=2.5),0), nrow = 3, byrow = TRUE)

# element-wise matrix multiplication
scaled * new.mat
# linear algebra, inner matrix multiplication
scaled %*% t(new.mat)

# Video example
matrix.mat <- matrix(c(171.5,292,281.6,460.6,139.3,288),nrow = 3,byrow = T, dimnames = list(c("The Matrix","Reloaded","Revolutions"),c("US","Worldwide")))
# colSums(dataObject) calculates the column sums. Also see. rowSums()
colSums(matrix.mat)
# colMeans(dataObject) calculates the column means. Also see. rowMeans()
colMeans(matrix.mat)
# Udemy recommends adding the sums and means to the original data object
totals <- colSums(matrix.mat)
means <- colMeans(matrix.mat)
matrix.prelim <- rbind(matrix.mat,totals,means)

# Exercise 14 - more matrix operations
# Create a matrix from a normal distribution
mat.rnorm <- matrix(rnorm(25),nrow = 5)
colTot <- colSums(mat.rnorm)
colMeans <- colMeans(mat.rnorm)
# add column sums and means to matrix
mat.rnorm <- rbind(mat.rnorm, colTot, colMeans)
# add row sums and means to matrix
rowTot <- rowSums(mat.rnorm)
rowMeans <- rowMeans(mat.rnorm)
mat.rnorm <- cbind(mat.rnorm, rowTot, rowMeans)

mat.runif <- matrix(runif(25),nrow = 5)
colTot <- colSums(mat.runif)
colMeans <- colMeans(mat.runif)
# add column sums and means to matrix
mat.runif <- rbind(mat.runif, colTot, colMeans)
# add row sums and means to matrix
rowTot <- rowSums(mat.runif)
rowMeans <- rowMeans(mat.runif)
mat.runif <- cbind(mat.runif, rowTot, rowMeans)

#get min and max of each matrix
rnorm.min <- min(mat.rnorm)
rnorm.max <- max(mat.rnorm)
runi.min <- min(mat.runif)
runi.max <- max(mat.runif)

# Categorical and Factor data
# Factors can specify the 1) Levels, 2) Labels *default is set to levels, 3) Order *default is false
# function: factor(x = character(), levels, labels = levels, exclude = NA, ordered = is.ordered(x), nmax = NA)

# Exercise 15 - Creating Factors in R
# Requires chess matrix
player <- c(rep("dark", 5), rep("light", 5))
piece <- c("king", "queen", "pawn", "pawn", "knight", "bishop", "king", "rook", "pawn", "pawn")
chess <- c(player, piece)
dim(chess) <- c(10, 2)
chess2 <- t(chess)
turn <- c(3, 5, 2, 2, 7, 4, 6, 5, 2, 1)
chess2 <- rbind(chess2, "Turn"=turn)
rownames(chess2) <- c("Player", "Piece", "Turn")
chess2 <- t(chess2)
mat.pieces <- chess2[ ,"Piece"]
# convert the vector of Pieces to a factor object with Unordered Levels
mat.pieces <- factor(mat.pieces,levels=c("king","queen","rook","bishop","knight","pawn"),labels = c("King", "Queen", "Rook", "Bishop", "Knight", "Pawn"))
# Change the Levels of the factor object
levels(mat.pieces) <- c("K","Q","R","B","K","P")
# Create a new factor with Ordered Levels
mat.ordered <- factor(mat.pieces, ordered = TRUE, levels = c("K","Q","R","B","K","P"), labels = c("king","queen","rook","bishop","knight","pawn"))
print(mat.ordered)

# Lists
# hierarchical structures or objects of different types
# use function str(list_object) to see a compact summary of the list object
# you can pass Labels to each object in the list by prefixing with intended label
# List_Object <- list(Name="value", Name="value",Name=numeric, Name=list(Name="Value", Name="Value"))
# - or - use the function names(List_Object) <- c("String","String","String","String")
# - Prefered - double bracket notation List_Object[[2]][[3]] returns the object at that location

# Programming
# Relational operators == != < > <= >=
# Evaluate to TRUE or FALSE
# TRUE is evaluated as 1
# FALSE is evaluated as 0
# Logical Operators AND OR NOT
# Allows you to combine multiple relational statements together
# Does X meet condition Y AND condition X?
# (w < 12) & (w >6)
# & returns TRUE iff all values are TRUE
# | returns TRUE if any value is TRUE
# ! returns the opposite of a logical test

# Vectors and logical operators
# proceed element by element, which means you don't need loops to check values
# v <- c(1,3,5,7)
# w <- c(1,2,3,4)
# 3 == v
# FALSE TRUE FALSE FALSE
# 3 == w
# FALSE FALSE TRUE FALSE
# c(11,12,13) >= c(10,12,14)
# TRUE TRUE FALSE
# (v >= 3) & (v < 7)
# Returns 2 sets of 4 booleans and the '&' returns TRUE only when both are TRUE
# [1] FALSE  TRUE  TRUE  TRUE
# [2]  TRUE  TRUE  TRUE FALSE
# [R] FALSE  TRUE  TRUE FALSE
# (v >= 3) | (v < 7)
# [1] FALSE  TRUE  TRUE  TRUE
# [2]  TRUE  TRUE  TRUE FALSE
# [R]  TRUE  TRUE  TRUE  TRUE
# 
# What is the difference between & and && and | and ||
# single operators can return a vector of booleans
# double operators return a single value
((-2:2) >= 0) & ((-2:2) <= 0)
# FALSE FALSE  TRUE FALSE FALSE
((-2:2) >= 0) | ((-2:2) <= 0)
# TRUE TRUE TRUE TRUE TRUE
# Double operators (||, &&) return a single value
((-2:2) >= 0) && ((-2:2) <= 0)
# FALSE
((-2:2) >= 0) || ((-2:2) <= 0)
# TRUE

# R Programming if / else / else if
# if(A){
#   Z
# }
# if(A){
#  Z
# }else{
#  Y
# }
# the value passed to the if statement must be a single value and not a vector of values
# because the statement must evaluate to TRUE or FALSE

# Exercise 17
x <- 101

if((x >= 1) & (x < 60)){
   print("Rotten!")
} else if((x >= 60) & (x < 75)){
   print("Fresh")
} else if((x >= 75) & (x <= 100)){
   print("Certified Fresh!")
} else {
   print("Please input a number between 1 and 100")
}
# setdiff - compares two vectors (sets) 
# setdiff returns the values from the first set that do not match the second set
# which means you can use setdiff to count how many of the elements in the vectors
# don't match. 
myinputs <- c(24,37,4,2,35,39)
lottery <- sample(1:49,6,replace=F) 
# wrongGuesses is the length of the vector returned by setdiff()
wrongGuesses <- length(setdiff(lottery, myinputs))
if(wrongGuesses == 0){
   print("Mom won the lottery!")
} else {
   print("Mom did not win the lottery.")
}

# Loops - cycles - iterations
# ie simulations
# initiation - the instructions of the loop for the values passed to the loop
# decision - the logical test to evaluate on the values passed to the loop
# body - the R code to execute while the decision is true
# for(value in x){
#      y
# }
# words <- c("Word 1","Word 2","Word 3","Word 4","Word 5")
# for (word in words){
#      print("")
# }
# the 'for' loop creates a variable 'word' and sets the value to each incoming value one at a time
# the variables created in the for loops can be named anything except existing environment variables
# you can use the indexing variable to perform functions
# vec.words <- vector(length=5)
# for (i in 1:5){
#      vec.words[i] <- words[i]
# }

# Exercise 18
n <- 10
sum <- 0

for(i in 1:n){
   sum <- sum + i
   print(sum)
} 

# while loop - loops while it evaluates to TRUE. 
# Useful for when you have an unknown number of iterations
# add a piece of code within the body of the loop to change the internal variable so that 
# it eventually evaluates to FALSE
n <- -12
while (n < 0){
   print(paste("The current value is:",n))
   n <- n + 1
}

# repeat loop - evaluates the logical condition after the body code
# used when the answer you're looking for breaks the loop
# ensures the body is executed at least once
# must ensure there is a 'break' command within the body code
# 'break' can be used within all loop mechanisms

n <- -12
repeat{
   print("Some text")
   n <- n + 1
   if(n >= 0){
      print("Some functions")
      print("Some more stuff before break")
      break
   }
}

# More on Functions
# Defining arguments in functions
# my.fx <- function(variable){
#    internal.varaible <- sample(variable, size=3, replace=T)
#    print(internal.variable)
# }

# shuffle <- function(deck){
#   generate random sequence from 1 to 23 
#   random.card <- sample(1:23, size=23)
#   use the sequence to pull cards from incoming data
#   shuffled <- deck[random.card, , drop=FALSE]
# }

# scope - local versus global
# variables created with a function are local to the function and not global
# you must return values from functions to the global environment to access them
# return()
#
# ensure there are default variables within functions to prevent error messages
# deal <- function(deck = matrix(1:23, nrow=23)){ body code }

# Data Frames
# Vectors and Matrices can only store a single data type and uses coersion to enforce that
# Real world data is often combinations of data types
# Lists are cumbersome to work with for statistical purposes and for ease of use 
# Data Frames act like spreadsheets and can hold different data types 
# NB: must have a single data type within each column. Whereas a row can contain different data types
# NB: Vectors of equal length are required when creating data frames
# NB: vectors passed to data frame become columns with Labels = vector_name
# NB: data frames coerse strings to factors. Turn that off with stringsAsFactors=FALSE
# NB: Use names() to pass a vector of names to use

my.data <- data.frame(vector1,vector2,vector3, vector4)
# - or -
my.data <- data.frame(Column1=vector1,Column2=vector2,Column3=vector3,Column4=vector4)
names(my.data) <- c("Column Label 1","Column Label 2","Column Label 3","Column Label 4")

# explore your data frame
str(my.data)

# Exercise 19
name <- c("Flipper", "Bromley", "Nox", "Orion", "Dagger", "Zizi", "Carrie")
mo <- c(53, 19, 34, 41, 84, 140, 109)
size <- c("medium", "small", "medium", "large", "small", "extra small", "large")
weight <- c(21, 8, 4, 6, 7, 2, 36)
breed <- c("dog", "dog", "cat", "cat", "dog", "cat", "dog")

pets <- data.frame(mo, size, weight, breed)
names(pets) <- c("Months old", "Size", "Weight", "Breed")
rownames(pets) <- name
str(pets)
# the levels() allows you to easily recode factors in your data, not just the label
# but the values in the column as well
levels(pets[ ,"Breed"]) <- c("dog","cat")
pets[ ,"Breed"]

# Tidyverse package
install.packages("tidyverse")

# Import data into R Studio sessions
# read.table("file.name", sep=, header=, stringsAsFactors= )
my.pok <- read.table("pokRdex-comma.csv",
                     sep = ',',
                     header = TRUE,
                     stringsAsFactors = FALSE)

# shortcut function to load csv files
# read.csv("file.name", stringsAsFactors=)
# NB: headers defaults to TRUE
# NB: sep defaults to ','
# NB: skip = n tells function number of lines to skip before reading data
# NB: nrows = n tells function how many rows to read, not including the HEADER row

my.pok <- read.csv("pokRdex-comma.csv",
                     stringsAsFactors = FALSE)

# shortcut function to load tab delimited files
# read.delim("file.name", stringsAsFactors=)
# NB: headers defaults to TRUE
# NB: sep defaults to '\t'
my.pok <- read.delim("pokRdex-tab.txt",
                   stringsAsFactors = FALSE)

# shortcut function to load csv files where semi-colon is separator
# read.csv2("file.name", stringsAsFactors=)
# NB: headers defaults to TRUE
# NB: sep defaults to ';'

# Exporting data
# write.csv(data, file="the_filename.csv", row.names=FALSE)
# NB: set row.names=FALSE 99.99999999% of the time
# write.table()

# Exercise 20
# in the raw data file, the first 23 lines contain documentation not relevant to data import
# the data file is large, so only read 200 employees data
employee.data <- read.csv("employee-data.csv", skip = 23, nrow = 200, stringsAsFactors = FALSE)
names(employee.data) <- c("Employee number", "First name", "Last name", "Birth date", "Gender", 
                          "Job title", "Salary", "From date", "To date")
write.csv(employee.data, file = "employee-exercise.csv", row.names = FALSE)

# Get a sense of your data
# 8 most common functions to get descriptive information about your data
# 1) nrow(...), 2) ncol(...), 3) colnames(...), 4) rownames(...), 5) str(...), 6) summary(...)
# 7) head(...), and 8) tail(...)
# NB: str(...) prvides an overview of the structure of the data frame
# NB: summary(...) provides descriptive statistics on each variable/column that contains numbers
# NB: head(...) grabs the first 6 rows
# NB: tail(...) grabs the last 6 rows

nrow(my.pok)
# [1] 811
ncol(my.pok)
# [1] 28
colnames(my.pok)
#  [1] "id"                      "pokemon"                 "species_id"             
#  [4] "height"                  "weight"                  "base_experience"        
#  [7] "type_1"                  "type_2"                  "attack"                 
#  [10] "defense"                 "hp"                      "special_attack"         
#  [13] "special_defense"         "speed"                   "ability_1"              
#  [16] "ability_2"               "ability_hidden"          "color_1"                
#  [19] "color_2"                 "color_f"                 "egg_group_1"            
#  [22] "egg_group_2"             "url_image"               "generation_id"          
#  [25] "evolves_from_species_id" "evolution_chain_id"      "shape_id"               
#  [28] "shape"  

str(my.pok)

summary(my.pok)

# Indexing and Slicing data frame
library(tidyverse)

# read data set into data frame
my.starwars <- as.data.frame(starwars)
# remove the last 3 columns from the data frame
my.starwars <- my.starwars[ ,-(11:13)]

head(my.starwars) # grab the first 6 rows
tail(my.starwars) # grab the last 6 rows

# Indexing and subsetting data frames
# returns atomic data type
my.starwars[3,9] # returns whatever data type is stored at the index
# chr "Naboo"
my.starwars[3, "homeworld"]
my.starwars[11,3] # returns whatever data type is stored at the index
# num 84

# returns vector
my.starwars[ ,"name"] # returns a vector
my.starwars[["name"]] # returns a vector
my.starwars$name # returns a vector

# returns data frame
my.starwars["name"] # returns a data frame
my.starwars[5 , ] # returns a data frame
my.starwars[c(1:14),c("name","homeworld","species")] # returns a data frame

# Extending a data frame
# Add a variable/column
mark <- c(37.5,34.75,34.25,0,0,0.75,0)
carrie <- c(13.5,22.75,21.25,0,0,0.5,5.74)
# Method 1 - use $
my.starwars$MarkScreenTime <- mark
my.starwars$CarrieScreenTime <- carrie
# Method 2 - use [[]]
my.starwars[[MarkScreenTime]] <- mark
my.starwars[[CarrieScreenTime]] <- carrie
# Method 3 - cbind() recommended when more than 1 variable is added
my.starwars <- cbind(my.starwars, MarkScreenTime=mark, CarrierScreenTime=carrie)

# Remove a variable/column
my.starwars$MarkScreenTime <- NULL
my.starwars[[MarkScreenTime]] <- NULL

# Add observation
# Create a 1 row data frame properly 
# NB: must ensure columns are named to match the target data frame
rogueOne <- data.frame(Title="The Title", Year=2016, Length=133, Gross=1051, MarkScreenTime=0, CarrieScreenTime=0.25) 
# Use rbind(...) to add it 
rbind(my.starwars,rogueOne)

# Exercise 20
# add a new variable to pets data frame
vaccinated <- c("Yes", "Yes", "No", "Yes", "No", "No", "Yes")
petsv <- cbind(pets, "Vaccinated" = vaccinated)
#add an observation to the data frame
milo <- data.frame(row.names = "Milo", Months.old = 67, Size = "small", Weight = 7, Breed = "dog", Vaccinated = "Yes")
petsvm <- rbind(petsv, milo)

ncol(petsvm)
nrow(petsvm)
colnames(petsvm)
rownames(petsvm)
str(petsvm)          # two numeric and three factor variables

class(diamonds)
# alternatively
str(diamonds)
diamonds.df <- as.data.frame(diamonds)
class(diamonds.df)

str(USJudgeRatings)
my.df <- USJudgeRatings
# create a new column and store it in the data frame
my.df$AVRG <- rowMeans(my.df)
# pull the column out of the data frame and pass it to a new one
avrg <- my.df["AVRG"]

# Missing Data
# display as 'NA'
# na.rm = TRUEjust ignores NAs, not recommended
# Where are the NA values?

is.na(my.starwars) # TRUE if value is NA, returns a data frame of TRUE/FALSE
any(is.na(my.starwars)) # TRUE if any values are NA, returns a single TRUE/FALSE

any(is.na(my.starwars[ ,c("name","homeworld","species")])) # subset of columns

# Method 1 - element by element replace 'NA' with a static value
my.starwars$species[is.na(my.starwars$species)] <- "Unknown"
subset(my.starwars, species == "Unknown")

# Method 2 - element by element replace 'NA' with a function return ie. median
my.starwars$height[is.na(my.starwars$height)] <- median(my.starwars, na.rm = T)

# data transformation
# dplyr within tidyverse
library(tidyverse)
# starwars is a Tibble, not a data frame
# Tibbles are more advanced and limit print to console 
star <- starwars
star

view(star) # view all data

# Filter(data, criterion) can use single logical operators & | !
filter(star, species == "Droid")
filter(star, species == "Droid", homeworld == "Tatooine")
filter(star, eye_color == "red" | eye_color == "yellow" | eye_color == "orange", specied == "Human")

# select() allows you select which variables you want and the order they appear
# starts_with() / ends_with() / contains() / matches () / everything()
select(star, name, birth_year, homeworld, species, starships)
select(star, name, homeworld:starships)
select(star, ends_with("color"))

# move columns around
select(star, name, vehicles, starships, everything())

# mutate - create new variables from existing variables AND add to data frame
star <- mutate(star, bmi=mass/((height/100)^2))

# transmute - create only the new variable and remove everything else
star.bmi <- transmute(star, bmi2 = mass/((height/100)^2))

# Arrange data - column-wise sorting
arrange(star, desc(mass))

# Group data and then summarize
summarize(star, avg,height = mean(height), na.rm = T) # returns a single value across all data

# group_by() - use group_by(...) first to segment data into meaningful groups
star.species <- group_by(star, species)
summarize(star, avg,height = mean(height), na.rm = T) # returns values for each group

# Sampling with dplyr
# sample_n(...) - a fixed number of rows / sample_frac(...) a fixed fraction of rows
# NB: by default, sampling does not return values once sampled
# NB: use replace = TRUE if you want to return the value to the data set
# NB: replace = TRUE is called bootstrapping and is useful for calculating standard error & intervals
sample_n(star, 10) # sample 10 rows from data set
sample_frac(star, 0.1) # sample 10/100 of the rows from the data set

# the pipe operator - %>%
# data %>% operation 1 %>% operation 2 %>% operation 3
# used to simplify the code and be easier to read than nesting. While nesting is a valid approach
# nesting can be hard to read and decipher. pipe allows us to type the operations in the way
# we think about the order of the operations

star %>% 
   group_by(species) %>%
   summarise(count = n(), mass = mean(mass, na.rm = T)) %>%
   filter(count > 1)


# Exercise 21
# import data
employee.data <- read.csv("employee-data.csv", skip = 23, stringsAsFactors = FALSE)
# convert data frame to tibble
employee.data <- as_tibble(employee.data)
# convert variables to factors
employee.data$gender <- as.factor(employee.data$gender)
employee.data$title <- as.factor(employee.data$title)

# check to see if there is any NA values in your data
any(is.na(employee.data))

# select keeps the variables you specify and the order
# filter returns a subset of data (salary < 70000)
# arrange sorts the variables (sort by gender and within gender sort by last name)
employee.a <- employee.data %>% 
   select(ends_with("name"), gender, everything()) %>%
   filter(salary >= 70000) %>% 
   arrange(gender, last_name)

good.earners <- employee.a["emp_no"]

# group the data by title and gender
# calculate average yearly salary for all employees in each group
# calculate monthly salary and add new variable to the tribble
# sort the data frame by gender with salaries descending
employee.b <- employee.data %>% 
   group_by(title, gender) %>% 
   summarise(avg.salary = mean(salary)) %>% 
   mutate(monthly = avg.salary/12) %>% 
   arrange(gender, desc(monthly))

# Tidy data
# consistently organized data
# data cleaning
# tidyr package gather() / spread() / unite() / separate()
library(tidyverse)
# number of plays/downloads of songs by artists for a number of weeks
billboard <- read.csv("billboard.csv")
billboard <- as_tribble(billboard)

# common issues with raw data
# 1) values as column names. 
# you can convert columns to rows by creating a new column
billboard %>% 
   gather(x1st.week:x76th.week, key = "week", value = "rank", na.rm = T) %>%
   arrange(artist.inverted)

# 2) multiple variables in the same column
tb <- read.csv("tb.csv")
tb <- as.tibble(tb)
# in the raw data set, age and sex are combined into columns eg., "males 15-24", "males 25-34"
# use gather() to recode the data set so that each value is in separate columns, gender / age group
tb.gathered <- tb %>% gather(m.014:f.65, key = "new_column_name", value = "cases", na.rm = T) %>%
   arrange(country)
tb.gathered # shows that the new column contains two variables, gender and age so we need to split

# use separate() to split data 
tb.separated <- tb.gathered %>% separate(column_to_split, into = c("sex","age"))

# use unite() to merge columns. 
# NB: default separator character is "_"
tb.united <- tb.separated %>% unite("new_column_name", c("col1","col2"))

# spread() inverse of gather()
# some data sets have multiple rows to store data about the same thing. Like a min and max
# it is better to use multiple columns, so use spread()
weather <- read.csv("weather.csv")
weather <- as_tibble(weather)
weather.spread <- spread(weather, key = element, value = value)

# Exercise 21
# parse_number() # pulls out a number from with a string eg, TT55OBS -> 55
# str_replace() # a regular expression function to replace strings via patterns with strings
# str_replace_na() # replace missing values with NA

# When reading complex data, ensure you set stringAsFactors = FALSE to preserve strings
weather.untidy <- read.csv("weather-untidy.csv", stringsAsFactors = FALSE)
weather.untidy <- as_tibble(weather.untidy)

# Step 1 - convert multiple date variables/column into a single ordinal date variable (1-31)
# NB: the gather(...) function needs to do something with the column assignment AND the value
# located at the index within each column. Hence why you create two variables with gather(...)
weather.g1 <- weather.untidy %>% gather("new category var", "value label", d1:d31, na.rm = TRUE)
weather.g2 <- weather.untidy %>% gather(key = day, value = value, d1:d31, na.rm = TRUE)
# Step 2 - convert date strings ('d1') to numbers then restructure the data then sort the data
weather.clean <- weather.g %>% mutate(day = parse_number(day)) %>%
   select(id, year, month, day, element, value) %>%
   arrange(id, year, month, day)

# Step 3 - spread the Min / Max rows into separate columns
weather.final <- weather.clean %>% spread(element, value)

# Tidying the tb data

tb <- read.csv("tb-untidy.csv", stringsAsFactors = FALSE)
tb <- as.tibble(tb)

# standardize the variable/column names for easier processing later
names(tb) <- str_replace(names(tb), "new_sp_", "")
names(tb) <- str_replace(names(tb), "m", "m.")
names(tb) <- str_replace(names(tb), "f", "f.")

# drop the variables/columns with no data
# this is a dumb, brute force way to handle missing data, not applicable in all scenarios
tb$m.04 <- NULL
tb$m.514 <- NULL
tb$f.04 <- NULL
tb$f.514 <- NULL
tb$m.u <- NULL 
tb$f.u <- NULL

# columns are used as categories, gather(...) them into 2 new variables then sort by country
tb.a <- tb %>% gather(m.014:f.65, key = "column", value = "cases", na.rm = TRUE) %>% arrange(country)

# the strings in the new column contain two values, sex and age. Use separate(...) to create two columns
tb.b <- tb.a %>% separate(column, into = c("sex", "age"))

# the numbers in date column need formatting. Add "-" between upper and lower limit
tb.b$age <- str_replace_all(tb.b$age, "0", "0-")
tb.b$age <- str_replace_all(tb.b$age, "15", "15-")
tb.b$age <- str_replace_all(tb.b$age, "25", "25-")
tb.b$age <- str_replace_all(tb.b$age, "35", "35-")
tb.b$age <- str_replace_all(tb.b$age, "45", "45-")
tb.b$age <- str_replace_all(tb.b$age, "55", "55-")
tb.b$age <- str_replace_all(tb.b$age, "65", "65-100")

# Data Visualization
# grammar of graphics and the 7 layers of visualizations
# ggplot2 package
# a method to explore and a method to explain and persuade
# 1) Data*
# 2) Aesthetics*
# 3) Geometries*
# 4) Facets
# 5) Stats
# 6) Coordinates
# 7) Themes
hdi <- read.csv("hdi-cpi.csv", stringsAsFactors = FALSE)
hdi <- as_tibble(hdi)

# supply the first two required layers for ggplot()
# No plot is produced
sc <- ggplot(hdi, aes(CPI.2015,HDI.2015))

# add the default geometry layer
sc + geom_point()

# Facets require discrete variables like factors
sc + geom_point() + facet_grid(Region ~.)

# Add some color and the Stats layer
sc + geom_point(aes(color=Region), size = 2) + facet_grid(Region ~.) + stat_smooth()

# Set the Coordinates layer of the graph. Use to focus on specific locations of the data
sc + geom_point(aes(color=Region), size = 2) + facet_grid(Region ~.) + stat_smooth() + coord_cartesian(xlim = c(0.75,1))

# Apply Themes layer. Load the ggplot themes package for more.
sc + geom_point(aes(color=Region), size = 2) + stat_smooth() + theme_minimal()

# Types of Data & Measurement levels
# Categorical / Numerical
# Numeric - discrete vs continuous
# - discrete data has discrete units, like integers are countable
# - continuous data allows observations to take on any value along with decimals
# Types of variables
# Nominal > Ordinal > Interval > Ratio
# category assignment (no order) > 
#  groups & categories (ordered) > 
#   Numbers w/ (no true zero) > 
#    Numbers with true 0

# Histograms
titanic <- read.csv("titanic.csv", stringsAsFactors = FALSE)
titanic <- as_tibble(titanic)

titanic$Survived <- as.factor(titanic$Survived)
titanic$Pclass <- as.factor(titanic$Pclass)
titanic$Sex <- as.factor(titanic$Sex)
titanic$Embarked <- as.factor(titanic$Embarked)

# Passanger age is only continuous variable
hist <- ggplot(data = titanic, aes(x=Age))
hist + geom_histogram()

# Adjust the range of values that fall into each bin
hist + geom_histogram(binwidth = 5)

hist + geom_histogram(binwidth = 5, color="darkslategray", fill="darkslategray4", alpha=0.5) +
   ggtitle("Age Distribution on the Titanic") +
   labs(y="Number of Passangers", x="Age (years)")

hist + geom_histogram(binwidth = 5, color="darkslategray", fill="darkslategray4", alpha=0.5) +
   ggtitle("Age Distribution on the Titanic") +
   labs(y="Number of Passangers", x="Age (years)") +
   theme_minimal()

# Exercise 22
library(tidyverse)
install.packages("ggthemes")
library(ggthemes)

emp <- read.csv("employee-data.csv", skip = 23, stringsAsFactors = FALSE)
emp <- as.tibble(emp)

# Perform proper data pre-processing before moving forward with visulations
emp$gender <- as.factor(emp$gender)
emp$title <- as.factor(emp$title)

emp.a <- filter(emp, salary > 45000)

# Data pre-processing complete.
hist <- ggplot(emp.a, aes(salary))
hist + geom_histogram(binwidth = 5000, color = "darkslategray",
                      fill = "darkseagreen2", alpha = 0.7) +
   labs(title = "Employee Salaries",
        x = "Salary", y = "Number of employees") +
   theme_solarized_2(light = FALSE, base_size = 15, base_family = "serif")

# Bar Chart
# Y - countable variable
# X - categorical / nominal variable

bar.chart <- ggplot(titanic, aes(x=Survived))
bar.chart + geom_bar() + theme_economist() +
   labs(y="Passanger Count", title="Survival Rate")

# Use aesthetics to map variables onto other variables
# Map the Sex variable onto the Survived Variable
bar.chart <- ggplot(titanic, aes(x=Survived, fill=Sex))
bar.chart + geom_bar() + theme_economist() +
   labs(y="Passanger Count", title="Survival Rate")

bar.chart <- ggplot(titanic, aes(x=Sex, fill=Survived))
bar.chart + geom_bar() + theme_economist() +
   labs(y="Passanger Count", x="Gender", title="Survival Rate")

bar.chart <- ggplot(titanic, aes(x=Sex, fill=Survived))
bar.chart + geom_bar() + theme_light() +
   labs(y="Passanger Count", x="Gender", title="Survival Rate") +
   facet_wrap(~Pclass)

# ~ means 'by' (Sex ~ Pclass) means create facets based on sex and then by class
bar.chart <- ggplot(titanic, aes(x=Sex, fill=Survived))
bar.chart + geom_bar() + theme_light() +
   labs(y="Passenger Count", x="Gender", title="Survival Rate") +
   facet_wrap(Sex ~ Pclass)

hist <- ggplot(data = titanic, aes(x = Age, fill = Survived))
hist + geom_histogram(binwidth = 5, color = "white") +
   labs(title = "Age Distribution",
        x = "Age", y = "Number of Passenger") +
   theme_light() +
   facet_wrap(~ Sex) # must start with tilda ~ with just one variable

# Exercise 23
library(tidyverse)
library(ggthemes)

bar <- ggplot(emp.a, aes(title, fill = gender))
bar + geom_bar() + theme_fivethirtyeight() + scale_fill_manual(values = c("chartreuse4", "darkorange")) +
   labs(title = "Job Positions by Gender",
        y = "Employee count",
        x = "Job position")

# theme_fivethirtyeight() does not allow us to name the x- and y-axis; you can change it to one that works
# trying to pass the legend.position= argument into any available theme won't work; if you want to customise 
# your theme beyond font type and size, you would need to create a theme for yourself with the theme() function;
# it takes an abundance of arguments allowing you to modify virtually every aspect of your visualisation

bar <- ggplot(emp.a, aes(gender, fill = title)) 
bar + geom_bar() + theme_fivethirtyeight() + 
   scale_fill_manual(values = c("magenta", "darkorange", "midnightblue","springgreen4", "brown1", "gold")) +
   labs(title = "Job Positions by Gender")

# The aes(x = gender, fill = title) mapping is a lot more difficult to read;

# look up scale_fill_manual, and scale_color_manual functions
# Can you set title and x and y axis names? Why? Try using a different theme. Can you do it now? 
# What happens if you try to set the theme() argument legend.position = "right". Why do you think that is? 
# Change the mappings so that gender is plotted and the bars are filled with position segmentation. 
# Do you find this graph useful and easy to read? 
# Perhaps the only thing it convinces us in is that the data has been simulated. 

# Box and Whisper plots
# Grouped numerical data in terms of quartiles

box.plot1 <- ggplot(titanic, aes(x = Survived, y = Age))
box.plot1 + geom_boxplot() +
   labs(title="Survival Rate on Titanic") +
   theme_light()

# the default interquartile range is set to 1.5. You can change it with
# geom_boxplot(..., coef = "1.75")

# geom_jitter() to overlay observation
box.plot1 <- ggplot(titanic, aes(x = Survived, y = Age))
box.plot1 + geom_boxplot() + geom_jitter(width = 0.2, aes(color = Sex)) +
   labs(title="Survival Rate on Titanic") +
   theme_light()

# Outlier formatting
box.plot1 <- ggplot(titanic, aes(x = Survived, y = Age))
box.plot1 + geom_boxplot(outlier.colour = "red", outlier.shape = 4) + 
   geom_jitter(width = 0.2, aes(color = Sex)) +
   labs(title="Survival Rate on Titanic") +
   theme_light()

# Many boxplots look better horizontal
box.plot1 <- ggplot(titanic, aes(x = Survived, y = Age))
box.plot1 + geom_boxplot(outlier.colour = "red", outlier.shape = 4) + 
   geom_jitter(width = 0.2, aes(color = Sex)) +
   labs(title="Survival Rate on Titanic") +
   theme_light() + coord_flip()

# Exercise 24 Boxplot
library(tidyverse)
library(ggthemes)
install.packages("wesanderson")
library(wesanderson)

emp <- read.csv("employee-data.csv", skip = 23, stringsAsFactors = FALSE)
emp <- as.tibble(emp)
emp$gender <- as.factor(emp$gender)
emp$title <- as.factor(emp$title)

emp.a <- filter(emp, salary > 45000)

boxx <- ggplot(emp.a, aes(x = title, y = salary))
my.bp <- boxx + geom_boxplot(outlier.color = "orangered1", outlier.shape = 3) +
   geom_jitter(width = 0.2, aes(color = gender)) +
   ggtitle("Salary distribution", subtitle = "based on position and gender") +
   ylab("Salary") + xlab("Job position") + 
   theme_economist_white() + 
   theme(legend.position = "right", axis.text.x = element_text(angle = 90, hjust = 1)) +
   coord_flip() # this can be added if the axis.text.x doesn't make sense to you; it's also easier to read

my.bp + scale_color_manual(values=wes_palette(name = "Darjeeling", n = 2))

# or

my.bp + scale_color_brewer(palette="Set1")

# the palette is part of the package which you should already have on your
# machines because it comes with the tidyverse

# Scatterplot - two numeric variables
hdi <- read.csv("hdi-cpi.csv", stringsAsFactors = FALSE)
hdi <- as_tibble(hdi)

sp <- ggplot(hdi, aes(CPI.2015,HDI.2015))
sp + geom_point(aes(color = Region)) + theme_light() +
   labs(x = "Corruption Perception Index",
        y = "Human Development Index",
        title = "CPI AND HDI 2015")

# NB: 0-25 built in shapes. 0-4 simple, 5-9 pointy, 10-14 look electrical, 15-19 filled platonic, 
# NB: only shapes 21-25 support the "fill=" attribute

# scale_shape_manual() : to change point shapes
# scale_color_manual() : to change point colors
# scale_size_manual() : to change the size of points
# scale_shape_manual(values=c(3, 16, 17))+
# scale_color_manual(values=c('#999999','#E69F00', '#56B4E9'))
# c('#142459','#176BA0','#19AADE', '#1AC9E6', '#1AC9E6','#1DE4BD','#6DFDD2','#C7F9EE')) 
# c('#29D66B','#7D3AC1','#AF4BCE', '#DB4CB2', '#EB548C','#EA7369','#F0A58F','#FCEAE6')) 
# c('#820401','#CD2323','#DE542C', '#EF7E32', '#EE9A3A','#EABD38','#E7E34E','#F7F4BF')) 

sp + geom_point(aes(color = Region), shape = 24, fill="white", size=2, stroke=1) + 
   scale_color_manual(values=c('#7D3AC1','#AF4BCE', '#DB4CB2', '#EB548C','#EA7369','#F0A58F')) +
   theme_light() +
   labs(x = "Corruption Perception Index",
        y = "Human Development Index",
        title = "CPI AND HDI 2015")

# ADD STATS layer
# refer to ggplot2 cheatsheet for more stats layers
sp + geom_point(aes(color = Region), shape = 24, fill="white", size=2, stroke=1) + 
   scale_color_manual(values=c('#7D3AC1','#AF4BCE', '#DB4CB2', '#EB548C','#EA7369','#F0A58F')) +
   theme_light() +
   labs(x = "Corruption Perception Index",
        y = "Human Development Index",
        title = "CPI AND HDI 2015") +
   stat_smooth(se=FALSE)

# overly saturated scatterplots benefit from stat_density2d()

sp + geom_point(aes(color = Region), shape = 24, fill="white", size=2, stroke=1) + 
   scale_color_manual(values=c('#7D3AC1','#AF4BCE', '#DB4CB2', '#EB548C','#EA7369','#F0A58F')) +
   theme_light() +
   labs(x = "Corruption Perception Index",
        y = "Human Development Index",
        title = "CPI AND HDI 2015") +
   stat_density2d(color="gray")


# Statistics
# Population (N) vs sample(n)
# all possible observations N -> parameters
# subset of observations n -> statistics
# a truly random sample can be obtained when each observation is determined by chance and all observations are equally likely
# a representative sample is a sample that accurately reflects the population

# Mean, Median, Mode
# Mean - sample average sum(n)/n
# the sample mean is very sensitive to outliers
# use mean() to calculate the mean 
# the median is the central observation in the ranked observations
# use median()
# the mode is the most frequent observation in the sample
# to identify the mode of a sample, 
# 1) build a contingency table or crosstab table a contingency table, which contains the observations and the counts
# contigency <- table(data)
# 2) query the column with the highest count
# names(contingency)[which(x==max(x))]
# if there is no max(x) then there is no mode for the sample
# NB: mode is not useful beyond 3

# For large data sets, use the summary() function to get central tendancy in one command

# measures of asymetry - skew
# Positive or right skew - mean > median - data clusters more before mean and has a long trailing/right tail
# the outliers are located in the right tail
# Negative or left skew - mean < media - data clusters after mean and has a long leading/left tail
# the outliers are located in the left tail
# Zero skew - symmetrical mean = media

col.1 <- c(1,1,1,1,2,2,2,2,2,2,3,3,3,3,4,4,5,5,7)
col.2 <- c(1,1,2,2,3,3,3,4,4,4,4,4,5,5,5,6,6,7,7)
col.3 <- c(1,2,3,3,4,4,4,5,5,5,5,6,6,6,6,6,6,7,7)

df <- data_frame(col.1,col.2,col.3)

pl.1 < ggplot(df, aes(x=col.1)) +
   geom_histogram(binwidth=1, color="white", fill="red4") +
   theme_light() + labs(title="Positive Skew")

pl.2 < ggplot(df, aes(x=col.2)) +
   geom_histogram(binwidth=1, color="white", fill="red4") +
   theme_light() + labs(title="Zero Skew")

pl.3 < ggplot(df, aes(x=col.3)) +
   geom_histogram(binwidth=1, color="white", fill="red4") +
   theme_light() + labs(title="Negative Skew")

# Exercise 26
# Load the two data sets into R: "skew_1.csv", and "skew_2.csv". 
# Identify the skew of the data sets, both visually, and numerically. 
# Try to interpret what you are seeing.

### Visual examination of the skew

sk1 <- read.csv("skew-1.csv")
sk2 <- read.csv("skew-2.csv")

skew1 <- ggplot(data = sk1, aes(x = `Dataset 1`))
skew1 + geom_histogram(binwidth = 100,
                       color = "darkslategray", 
                       fill = "darkslategray4", 
                       alpha = 0.5) +
   theme_light()

# The skew of this dataset is positive


skew2 <- ggplot(data = sk2, aes(x = `Dataset 2`))
skew2 + geom_histogram(binwidth = 100,
                       color = "darkslategray", 
                       fill = "darkslategray4", 
                       alpha = 0.5) +
   theme_light()

# The skew of this dataset is negative

### Numerical examination of the skew 

library(psych)

describe(sk1)
#    vars  n   mean     sd median trimmed    mad min max range skew kurtosis    se
# X1    1 30 370.03 263.96    339  346.25 275.02  48 870   822 0.57    -0.98 48.19
describe(sk2)
#    vars  n   mean     sd median trimmed    mad min max range  skew kurtosis    se
# X1    1 30 603.73 240.54  654.5  612.88 196.44 119 995   876 -0.33    -0.75 43.92
describe(col.2)
#    vars  n mean  sd median trimmed  mad min max range skew kurtosis   se
# X1    1 19    4 1.8      4       4 1.48   1   7     6    0       -1 0.41
# Note: sometimes, using a graph to identify the skew can be misleading.	
# The sk2 dataset has a relatively strong negative skew ( -0.33 ). 	
# However, from a histogram with a few bins, you cannot clearly determine the skew.	
# For best results, use a more precise measure of skewness, such as R's calculations, instead of a simple graph	

# Measures of Variability
# Variance - Stdnard Deviation - Coefficient of Variation / relative std. dev.
# most often use sample formulas
# recall that sample variance (squares the differences)^2 to eliminate negative values
# taking the square root of the variance, produces the standard deviation sqrt(variance) = std.dev
# the Coefficient of Variation is unitless and allows you to compare the variance of multiple variables
# of different units of measurement. std.dev / mean

# an efficient way to calculate central tendancy and variability of a data frame is to use
# lappy() / sapply() / etc
# sapply(data, mean)
# sapply(data, var)
# sapply(data, sd)
# coef.var <- sapply(data, sd) / sapply(data, mean)

# Covariance and correlation
# explore the relationship between variables

homes <- read.csv("landdata-states.csv", stringsAsFactors = FALSE)
homes <- as_tibble(homes)

homes %>% subset(Date == 2001.25) %>% ggplot(aes(y = Structure.Cost, 
                                                 x = log(Land.Value))) +
   geom_point() + theme_light() + labs(x = "Land Value (log)",
                                       y = " Structure Cost (USD)",
                                       title = "Relationship")

# Covariance measures the amount of correlation between two variables
# Covariance can be postive > 0 > negative
# Covariance of 0 indicates the variables are independent
# Covariance depends on the scale of the variables
# Correlation Coefficient removes the scale, standardizes the covariance
# Correlation Coeeficient = Covariance / product of the variance of each variable

cor(homes$Structure.Cost, homes$Land.Value)
# correlation ranges between -1 and 1
# 1 - one variable explains the other variable, as one goes up, so does the other
# 0 - no relationship, independent
# -1 - perfect relationship but inverse, as one goes up, the other goes down

cor.test(homes$Structure.Cost, homes$Land.Value)
# t = 42.013, df = 7801, p-value < 2.2e-16
# alternative hypothesis: true correlation is not equal to 0
# 95 percent confidence interval:
#    0.4112874 0.4474795
# sample estimates:
#    cor 
# 0.4295559 

# Exercise 27
# Task 1: What are the types of data and the levels of measurement of the following variables: Cust ID, Mortgage, Year of sale. 
# Task 2: Create a histogram which represents the Price variable. Use the default binwidth values first and then set bins of length $100,000. Use the data on all apartments, no matter if sold or not.
# Task 3: Interpret the results.
# Task 4: Create a scatter plot showing the relationship between Price and Area. Use the data on all apartments, no matter if sold or not. Interpret the results.
# Task 5: Calculate the mean, median, mode, skewness, and standard deviation of Price for all apartments, no matter if sold or not.
# Task 6: Interpret the measures.
# Task 7: Calculate the correlation between Price and Area. Is the result in line with the scatterplot?

library(tidyverse)

product <- read_csv("practical-product.csv")
customer <- read_csv("practical-customer.csv")

# Task 1

# Cust ID - Categorical/Nominal. This variable has the same properties as ID.
# Mortgage - Categorical/Nominal.	This is a Binary variable. Like a Yes/No question or Gender.
# Year of sale - Numerical, discrete/Interval.	Year is a numerical variable. It is always discrete. The level of measurement is questionable, but we would treat it as interval, as the 0 year would be the time when the Big Bang happened. The current BC-AD calendar was arbitrary chosen (similarly to degrees Celsius and Fahrenheit).

# Task 2 - start by visually inspecting the frequency distribution of the data
# Use a historgram first to get a feel for the skewness. Is it positive or negative or symmetrical

hg <- ggplot(data=product, aes(x = Price))

hg + geom_histogram(color = "darkslategray", 
                    fill = "darkslategray4", 
                    alpha = 0.5) + 
   ggtitle("House Prices Frequency Distribution") + 
   labs(y = "Number of Houses", 
        x = "Price") + 
   theme_minimal() +
   scale_x_continuous(labels = NULL) 

hg + geom_histogram(binwidth = 100000, 
                    color = "darkslategray", 
                    fill = "darkslategray4", 
                    alpha = 0.5) + 
   ggtitle("House Prices Frequency Distribution") + 
   labs(y = "Number of Houses", 
        x = "Price") + 
   theme_minimal() +
   scale_x_continuous(labels = NULL) # this gets rid of the scientific notation on the x axis

# Task 3

# The two histograms point to similar insights - most of the apartment prices are concentrated in the interval ($217,000 to 317,000)	

# Task 4 - choose a relationship to inspect. Look at the scatterplot between Price and Area
# Does the correlation look positive or negative?
# Does the correlation stay constant, ie., a cone

sp <- ggplot(product, aes(`Area (ft.)`, Price))
sp + geom_point() + 
   theme_light() + 
   labs(x = "Area in Square Feet", 
        y = "Price in USD", 
        title = "Relationship between Price and Area") +
   scale_y_continuous(labels = NULL) # this gets rid of the scientific notation on the y axis

# The scatter plot shows a very strong linear relationship between Price and Area. This was to be expected as often Real Estate companies price their property per square foot.	
# Notice how for cheaper apartments (lower areas respectively), the points are closer so the variance is smaller. However, the bigger the apartment, the bigger the difference in the price.	

# Task 5 
# When performing exploratory data analysis, the psych package has useful tools
library(psych)

# either of these gives you a decent summary and the mean, median, skew, and standard deviation of the data of interest

# describe() returns all descriptive statistics about a variable
describe(product$Price)
#    vars   n     mean       sd   median  trimmed      mad      min      max    range skew kurtosis   se
# X1    1 267 281171.9 89119.12 249075.7 269244.3 65200.96 117564.1 538271.7 420707.7 1.08     0.38 5454

# summary only provides measures of central tendancy, not variability or skew
summary(product$Price)
#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 117564  217553  249076  281172  326965  538272 

# create a function that returns the mode
mode <- function(x){ 
   ta <- table(x) # creates a contingency table of all observations as columns and frequency counts
   tam <- max(ta) # grab the max frequency count
   if (all(ta == tam))
      mod <- NA
   else
      if(is.numeric(x))
         mod <- as.numeric(names(ta)[ta == tam])
   else
      mod <- names(ta)[ta == tam]
   return(mod)
}

mode(product$Price)

# Task 6

# We will only comment on the skew, as it is a bit tougher. 
# The skew is right (positive). This means that most aparments are relatively cheap with a tiny portion that is more expensive.														

# Task 7

cor.test(product$`Area (ft.)`, product$Price)
# t = 50.118, df = 265, p-value < 2.2e-16
# alternative hypothesis: true correlation is not equal to 0
# 95 percent confidence interval:
#    0.9381545 0.9613697
# sample estimates:
#    cor 
# 0.9510874 
# Yes, the result is in line with the scatter plot. The two variables are strongly correlated.

# Inferential Statistics 
# predict population values from sample data
# Distributions
# a histogram provides quick look at the distribution of a variable
# Broadly, distributions are defined by a function that shows the possible values for a variable
# and how often they occur
# Normal Distribution - is continuous and cannot be represented by bins. The normal distribution
# is symmetrically distributed around the mean.
# in a more formal sense, the normal distribution describes how likely a score will occur
# the probabilities of observations n/total 
# Probability distributions
# The standard normal distrubtion is a case of the normal distribution with mean = 0 and std = 1
# when your data approximates a normal distribution you can convert your observations into a 
# standard normal variable or a standardized variable called a z-score
# z-score = ( original variable - mean ) / std.dev
# once you have a z-score for your observation, you can look up the probability of that score in 
# the standard normal probability table
# Importantly, you use the probability of the z-score to assess whether the score came from a certain
# type of probability distribution

# Standard Error and Confidence Intervals
# Each time you sample, you generate means/std that estimate the population parameter
# If you keep taking samples, you produce a distribution of means and std called sampling distribution
# as you approach infinity, the mean of the sampling distribution will reach the population average
#
# With one variable, you can calculate the variability of the observations within the sample
# With the sampling distribution, you can calculate the variability of the sampling distribution

# Sample Error = std.dev of the means
# NB: with more than 30 observations (n>=30), you can reasonably assume that the sample mean is coming from the sampling distribution with a mean equal to the population mean
# variance / sqrt(n)
# Standard Error 1) if large, indicates our sample statistic may be far from the true population value, 2) if small, indicates our sample statistic is closer to the population value, a good estimation!

# Thus, standard error tells us the level of certainty with which we can generalize from a sample to a population
# From a decision-making context, the Standard Error tells us how certain we can be about drawing conclusions from our sample data.

# Confidence Intervals - boundaries that designate a range of values that the population parameter is likely to fall. With one variable, it isn't that useful. In multivariate contexts it helps determine if there are significant difference between groups.
# for example, a sample mean is 8. How likely does that mean come from the sampling distribution of the mean of the population your investigating
# Step 1 - I want the range within which the true value of the parameter will be for a certain number of samples: 95% or 99%
# Step 2 - If the range is large, it is uninformative because you are unsure where the population value is
#          If the range is small, you can be much more confident that for 95% of the samples, the sample mean is a decent estimate of the population mean
# visually represent the Confidence interval as well as the values to quickly gauge whether it is likely
# to be significant or not. Only a p-value can tell you whether it is signficant or not

# Hypothesis Testing
# Steps in Data-driven decision-making
# 1) Research Question 2) Generate Theory 3) Formulate Hypothesis 4) Find correct test 
# 5) Execute test 6) Make a decision
# 
# True Hypotheses can be tested.
# There are two hypotheses: 1) The alternative hypothesis, what we predict will be TRUE, 2) The Null Hypothesis, what we predict will be FALSE
# We cannot prove the alternative hypothesis is TRUE, we can reject an hypothesis that the alternative hypothesis isn't true.
# we are attempting to REJECT the Null hypothesis to support the alternative hypothesis.
# How likely does our sample come from the Null sampling distribution vs the H1 sampling distribution
# There are two kinds of hypotheses: 1) two-tailed (can be on either side) 2) one-tailed, in one direction
# In a two-tailed, you don't care whether statistic is more or less than the sampling mean, just whether it's different
# in a one tailed, your indicating the sample statistic must be in one tail or the other
# it's important when interpreting regarding the area under the curve.
# 3 components to hypothesis testing:
# 1) Null to reject
# 2) rejection region (one-tailed v two-tailed)
# 3) significance level (alpha) - the signifcance level is the probability of rejecting the Null hypothesis if it true. (typical values are 0.01, 0.05, 0.1)
# Example, student grades are not 70%. H0 = grades = 70%, H1 != 70%
# if the Null is the rejection region, you reject the Null in favor of the alternative

# Type 1 and Type 2 Errors
# alpha & beta
# power = 1 - beta

# Exercise 28
# Z-Test for mean, population variance known
# Using the data from the lesson, test the null hypothesis at 10% significance

# sample mean: $100,200
# population sd: $15,000
# standard error: $2,739
# sample size: 30
# z-score: -4.67 
# H0 (Glassdoor data): $113,000
# two-sided test

sal <- read.csv("ztest-a.csv")
summary(sal)

z.test <- function(a, mu, sd){
   zeta <- (mean(a) - mu) / (sd/sqrt(length(a)))
   return(zeta)
}

z.test(a = sal$salary, mu = 113000, sd = 15000)

# Z = 4.67
# z = 1.65 (fromt the z-table)
# alpha = 0.05 (two-sided test)

# 4.67 > 1.65 
# therefore, the null is rejected

# P-value
# you reject the Null hypothesis when the probability of obtaining your observed value is less than the alpha level you decided at the start of the test. 
# recall the alpha level you select is also the chance of obtaining a Type 1 error.
# So for example, you obtain a z-score of 2.58 and you decide to set your alpha to 0.05. When you calculate the probability you get p=0.0049. So you can reject the Null hypothesis
# Almost all statistical tests calculate a p-value. p < a reject Null

# Test for mean with unknown population variance
# T-test
# Email open rate. is Competitor vs Our Own, higher or lower?
# H0: mean open <= 0.4
# H1: mean open > 0.4
# alpha: 0.05

library(psych)
open.rate <- read.csv("ttest-a.csv")

my.t.test <- function(a, hmean){
   t <- (mean(a) - hmean) / (sd(a)/sqrt(length(a)))
   return(t)
}

my.t.test(open.rate$Open.rate, 0.4)
d.f <- length(open.rate$Open.rate)-1
# T = -0.5295018
# d.f. = n-1 = 9
# alpha: 0.05
# T 0.53 < t 1.83 .:. cannot reject Null hypothesis.
# p-value = 0.065
# we cannot say Email Open rate of competitor is higher than 40%

# Exercise 29
# What if the question was: is the competitor open rate EXACTLY 40%. What would be the decision then?

# 1. Test at 5% significance. Comment on the decision with the appropriate statistical jargon.
# 2. Test at 1% significance. Comment on the decision with the appropriate statistical jargon.

# Hint: Think about what type of test would be suitable here (one- or two-sided).

library(psych)

open.rate <- read.csv("ttest-a.csv") # load your data
describe(open.rate) # understand your data

my.t.test(open.rate$Open.rate, 0.4)

# H0 = open rate is NOT 40%
# H1 = open rate is 40%
# The problem is a two-sided test
# T = 0.53
# t1 = 2.26 Accept the null. At the 5% significance level we cannot say that the competitor's open rate is 40%
# t2 = 3.25 Accept the null. The test on that sample shows that at 1% significance, our competitor's open rate is not 40%.

# Comparing Means - Dependent Samples
# Before & After trials. Is the drug having an effect?
# H0: There is no effect and weight is unchanged mean B >= mean A : mean.B - mean.A >= 0 : D0 >= 0
# H1: There is an effect and weight goes down. mean B < mean A : mean.B - mean.A < 0 : D1 < 0 
# n = 10, df = 9
# one-sided t-test at alpha 0.05

library(pastecs)
library(psych)

magn <- read.csv("dependent-samples.csv")

# ALWAYS inspect your data to look for normality before submitting to z-test/t-test/ANOVA/MANOVA
# Is it normally distributed?
# are the variances across groups equal?
describe(magn)
# alternative stat.desc(magn)
#        vars  n mean   sd median trimmed  mad min max range  skew kurtosis   se
# Before    1 10 1.38 0.40   1.45    1.39 0.37 0.7 2.0   1.3 -0.19    -1.16 0.13
# After     2 10 1.71 0.28   1.70    1.68 0.07 1.3 2.4   1.1  1.13     1.14 0.09
# Skew is a measure of symmetry where skew = 0 means perfectly symmetrical
# The normal distribution has a skew = 0
# kurtosis is a measure of the combined sizes of the two tails, the amount of probability in the tails.
# kurtosis is typical compared the kurtosis of the normal distribution = 3.
# If kurtosis is greater than 3 than more probability in the tails
# If kurtosis is less than 3 than there is less probability in the tails
# Most often, kurtosis is measured against the normal distribution.  If the kurtosis is close to 0, then a normal distribution is often assumed.  These are called mesokurtic distributions.  If the kurtosis is less than zero, then the distribution is light tails and is called a platykurtic distribution.  If the kurtosis is greater than zero, then the distribution has heavier tails and is called a leptokurtic distribution

# alternative paramter must be one of “two.sided”, “less”, “greater”
# based on whether mean.B - mean.A is expected to be higher or lower than 0
dep.t.test <- t.test(magn$Before, magn$After, paired = TRUE, alternative = "l")
dep.t.test
# t = -2.2949, df = 9, p-value = 0.0237, alpha = 0.01 (more conservative) fail to reject the Null
# 

# Exercise 30
# A health guru on the internet designed a weight-loss program. 
# You are wondering if it is working. You are given a sample of some people who did the program. 
# You can find the data in kg if you prefer working with kg as a unit of measurement.

# State the null hypothesis.
# Calculate the appropriate statistic
# Decide if this is a one-sided or a two-sided test. What is the p-value?
# Based on the p-value, decide at 1%,5% and 10% significance, if the program is working. Comment using the appropriate statistical jargon.

library(pastecs)
library(psych)

weight <- read.csv("weight-data-exercise-kg.csv")
# Is it normal?
# are the variances relatively equal?
# is the sample size larger than 30?
describe(weight)
#        vars  n   mean    sd median trimmed  mad   min    max range  skew kurtosis   se
# before    1 10 106.43 10.51 107.77  106.80 7.62 88.84 120.99 32.15 -0.29    -1.23 3.32
# after     2 10 105.29 10.73 104.94  105.36 8.31 87.36 122.65 35.29 -0.17    -1.06 3.39
# n=10 which means you can't use skew, kurtosis. but variances look good.

# we are subtracting the means of after from before, and expect > 0, so use "g" in ttest
dep.t.test <- t.test(weight$before, weight$after, paired = TRUE, alternative = "g")
dep.t.test

# H0: The difference between the before and the after conditions is less than or equal to 0
# t = 2.01
# The test is one-sided. We want to know if people are actually losing weight. p = 0.038
# At 1% significance we accept the null hypothesis. The data shows that the program is not working.
# At 5% significance, we reject the null hypothesis. Therefore, the program is successful.
# At 10% significance, there is enoug statistical evidence that the program is working.

# comparing two means - independent samples - unknown population variance

grades <- read_csv("independent-samples.csv")
# Engineering and Management are types of courses, not varaibles on their own
# use gather to recode the data frame to a "course" variable and a "grade" variable
grades <- gather(grades, Engineering, Management, 
                 key = "course",
                 value = "grades")

# R uses Welch T-test when samples are different sizes
# You can override Welch adjustment with "var.equal=TRUE" when variances are equal
ind.t.test <- t.test(grades~course, data = grades, mu=-4)
ind.t.test
# t = -2.4332, df = 164.71, p-value = 0.01604
# NB: when the t-score is negative, the true value of the difference is smaller than the hypothesized
# value. In the example, a smaller value than -4 is a larger absolute number.

# Linear Regression Model
# A linear regression is a linear approximation of a causal relationship between two or more variables
# y = B0 + B1x1 + E population parameters
# y.hat = b0 + b1x1 - sample estimates

# Correlation vs Regression
# Correlation measures the degree of relationship, so can be stated in reverse. Is represented by a single point.
# Regression analysis measures the effect of one variable on another variable, Cannot be stated reversed because the predictor variables causes some effect in the dependent variable. Is represented as the best fitting line in a set of data.

# Geometrical Representation
# 

# 





