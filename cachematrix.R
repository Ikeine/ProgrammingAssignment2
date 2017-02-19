## Coursera - R Programming by Johns Hopkins University
## Week 3 Peer-graded Assignment: Programming Assignment 2: Lexical Scoping
## 
## Matrix inversion is usually a costly computation and there may be some benefit to 
## caching the inverse of a matrix rather than compute it repeatedly. 
## This assignment is to write a pair of functions that cache the inverse of a matrix.

## This function creates a special "matrix" object that can cache its inverse.
{
      {
            
      }
}
makeCacheMatrix <- function(x = matrix()) {
      invm <- NULL ##Repository for the inverted matrix.
  
      ## Sets the matrix object.
      set <- function(y) {
            x <<- y
            
            ## Upon setting or re-setting the matrix, the repository for the inverse
            ## is set to NULL, so it has to be calculated again.
            invm <<- NULL  
      }
  
      ## Returns the matrix object.
      get <- function() {
            x  
      }
  
      ## Sets the inverse matrix
      setinvmatrix <- function(invmatrix) {
            invm <<- invmatrix
      }
  
      ## Gets the inverse matrix.
      getinvmatrix <- function() {
            invm
      }
  
      ## Returns a list of functions to operate over the special matrix object.
      list(set = set, get = get, setinvmatrix = setinvmatrix, getinvmatrix = getinvmatrix)
  
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), then the cachesolve
## should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
      ## Asign to invm the inverted matrix of object 'x'
      invm <- x$getinvmatrix()
  
      ## If invm is not NULL, then we can return the existing chached data.
      if(!is.null(invm)) {
            message("getting cached data")
            return(invm)
      }
      
      ## Of if invm is null, then the inverse matrix is recalculated using 'solve'.
      data <- x$get()
      invm <- solve(data, ...)
      
      ## The inverted matrix is stored in the 'cache'
      x$setinvmatrix(invm)
      
      invm
}
