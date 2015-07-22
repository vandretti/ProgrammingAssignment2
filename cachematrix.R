# cachematrix.R
#
# This function creates a speical square matrix that is stored in a cache. Also, it
# also provide the following function to operate on this matrix:
#
#   1. set the matrix data
#   2. get the matrix data
#   3. set the inverse of the matrix
#   4. get the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
    inverse <- matrix(,)
    set <- function(y){
        x <<- y
        inverse <<- matrix(,)
    }
    get <- function() x
    setinverse <- function(inv) inverse <<- inv
    getinverse <- function() inverse
    list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


# This function computes the inverse of the special square matrix via the solve()
# function in R. For this assignment, the function assume the input
# is a square matrix, and it is inverteible.

cacheSolve <- function(x, ...) {

        inverse <- x$getinverse()
        if (!is.na(inverse)) {
            message('retrieve inverse matrix from cache')
            return(inverse)
        }

        data <- x$get()
        inverse <-solve(data)
        x$setinverse(inverse)
        inverse
}
