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

