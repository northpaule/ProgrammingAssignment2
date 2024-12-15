## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        invx <- NULL
        set <- function(y) {
                x <<- y
                invx <<- NULL
        }
        get <- function() x
        setInverse <- function(solveMatrix) invx <<- solveMatrix
        getInverse <- function() invx
        list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

#The above functions create a special matrix object which
#allows you to cache its inverse.

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        invx <- x$getInverse()
        if(!is.null(invx)){
                message("getting cached data")
                return(invx)
        }
        data_x <- x$get()
        invx <- solve(data_x)
        x$setInverse(invx)
}

#This function calculates the inverse of the special matrix object
#given by the previous functions (makeCacheMatrix).

#If the inverse of a matrix has already been computed (and the matrix
#has not been modified or changed), the cacheSolve should be able to
#retrieve its inverse from the cache.

#Using the solve(x) function in the second half of the code allows
#you to calculate the inverse of a square matrix (Reference:R Programming
#for Data Science by Roger Peng, 2022)

