## A pair of functions that cache the inverse of a matrix


## Creates a special matrix object that can cache its inverse
makeCacheMatrix <- function(x = matrix()){
  
  
  ## Initialize the inverse property
  inv <- NULL
  
  ## Method to set the matrix
  set <- function(y){
    x <<- y
    inv <<- NULL
  }
  
  ## Method the get the matrix
  get <- function() {x}
  setInverse <- function(inverse) {inv <<- inverse}
  getInverse <- function() {
    
    ## Return the inverse property
    inv
  }
  
  ## Return a list of the methods
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## Compute the inverse of the special matrix returned by "makeCacheMatrix"
## above. If the inverse has already been calculated (and the matrix has not
## changed), then the "cachesolve" should retrieve the inverse from the cache.


cacheSolve <- function(x, ...){
  
  
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()
  
  ## Just return the inverse if its already set
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  
  ## Get the matrix from our object
  mat <- x$get()
  
  ## Calculate 
  inv <- solve(mat, ...)
  x$setInverse(inv)
  
  ## Set the inverse to the object
  inv
}
