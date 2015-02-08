####################################
### RIA - CH.2 - Data Structures ###
####################################

gc(rm(list=ls()))
graphics.off()

# matrix is a two-dimensional array where each element has the same mode
#(numeric, character, or logical). Matrices are created with the 'matrix()' function

# option byrow indictes whether the matrix should be filled in by row (byrow=TRUE) or
# by column (byrow=FALSE). Default is by column.

y <- matrix(1:20, nrow=5, ncol=4) # creates a 5x4 matrix.
cells <- c(1,26,24,68)
rnames <- c("R1", "R2")
cnames <- c("C1", "C2")
mymatrix <- matrix(cells, nrow=2, ncol=2, byrow=TRUE,
                   dimnames=list(rnames, cnames))
mymatrix

mymatrix <- matrix(cells, nrow=2, ncol=2, byrow=FALSE,
                   dimnames=list(rnames, cnames))
mymatrix

# This shows how to create a matrix. Then set one up with values and
# and create different matrices by specifying byrow=TRUE or FALSE.

# Using Matrix Subscripts

x <- matrix(1:10, nrow=2)
x
# We have two rows, 5 columns. Byrow by default is true, so it'll populate
# the numbers sequentially by row.

x[2,]
# This gives us just row 2, all columns

x[1,4]
# This gives us just row 1, column 4 = 7.

x[1, c(4,5)]
# This gives us the observations from row 1, columns 4 & 5.

## Arrays ##

# Arrays are similar to matrices, but can have more than two dimensions. 
# They're created with an array function. It looks like this;
# myarray <- array(vector, dimensions, dimnames)
# where vector contains the data for the array, dimensions is a numeric
# vector giving the maximal index for each dimension, and dimnames is an
# optional list of dimension labels. The following listing gives us
# an example of creating a three-dimensional (2x3x4) array of numbers.

dim1 <- c("A1", "A2")
dim2 <- c("B1", "B2", "B3")
dim3 <- c("C1", "C2", "C3", "C4")
z <- array(1:24, c(2,3,4), dimnames=list(dim1, dim2, dim3))
z
# so first, the vector is the numbers 1 through 24. That's the 'data'
# we'll use. The second is a vector for the dimension. It says we want a
# 2x3 matrix, and we want 4 of them. The next this is a specification for 
# how we want the dimensions named. It says the rows should be called A1-A2.
# The columns should be B1-B3. And the matrices should be labelled C1-C4.

z[1,2,3]
# This says, give me the observation from the 1st row, 2nd column, from the 3rd matrix.

## Data Frames ##

# Data frame is more general than a matrix because it can contain different
# modes of data (numeric, character, logical, etc.).
patientID <- c(1,2,3,4)
age <- c(25,34,28,52)
diabetes <- c("Type1", "Type2", "Type1", "Type1")
status <- c("Poor", "Improved", "Excellent", "Poor")
patientdata <- data.frame(patientID, age, diabetes, status)
patientdata
# This shows us the dataframe we created using data.frame().
patientdata[1:2]
# This gives us columns 1 through 2.
patientdata[,2]
# This gives us column 2.
patientdata[2,]
# This gives us row 2.
patientdata$age
# This gives us all the values for the variable 'age'
table(patientdata$diabetes, patientdata$status)
# This gives us a cross-tab of diabetes by status.

### If you attach or detach data or us 'with()', it allows you to reference
# the variables without having to write the dataset$ part first. The attach() 
# attaches the data to the search path. The detach detaches it. The with function
# lets you specify the dataset first.
with(patientdata, {
  summary(age)
  plot(status, age)
})

# How to create a factor.
status1 <- factor(status, order=TRUE,
                 levels=c("Poor", "Improved", "Excellent"))


## Lists ##

# Lists are a complex type. It is an ordered collection of objects(components)
# It allows you to gather a variety of (possibly unrelated) objects under 
# one name. It could contain a combo of vectors, matrices, data frames, and other lists.

## Creating a List
g <- "My First List"
h <- c(25,26,18,39)
j <- matrix(1:10, nrow=5)
k <- c("one", "two", "three")
mylist <- list(title=g, ages=h, j, k)
mylist
# so we have a list with 4 components; a string, a numeric vector,
# matrix, and a character vector.  
# You can specify elements of the list with a name or number within
# double brackets.
mylist[[2]]
mylist[["ages"]]
# Returns the second element, or ages (the same)

### Some Useful Functions ###
length(y) # Number of elements/components
dim(y)    # Dimensions of an object.
str(y)    # Structure of an object.
class(y)  # Class or type of an object.
mode(y)   # How an object is stored.
names(y)  # Names of components in an object.
# c(object, object)  - combines objects into a vector.
# cbind(object, object) creates objects as columns.
# rbind(object object) combines objects as rows.
y # prints the object.
head(y) # lists the first 5 rows of the object.
tail(y) # lists last 5 rows.
ls() # lists current objects in working environment. 
# rm(object, object) Deletes one or more objects from working environment.
# rm(list=ls()) will remove most objects from the working environment.
newy <- edit(y) # edits objects and saves as new object. Opens it up in X11 quarts thing.
fix(y) # edits in place.




