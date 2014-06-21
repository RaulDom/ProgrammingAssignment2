## Put comments here that give an overall description of what your
## functions do

## There are the two functions corresponding to thesecond programming assignment,
## the first creates an special matrix and the second is a function that determines
## the inverse of one of this special matrix

## This function creates an objet that contains one numeric matrix (it should be invertible) and the
## functions to get the values. Also contains the function to set the inverse matrix
## in one variable in another enviroment to cache the result.

makeCacheMatrix <- function(x = matrix()) {
  
  i <- NULL
  
  set <- function(y){
    x <<- y
    i <<- NULL
  }
  get  <- function() x
  
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)

}


## Write a short comment describing this function
## This function obtain the inverse matrix of one special matrix created by the makeCacheMatrix() function.
## First search if exist a cache with the result, if no exixt then obtain the inverse matrix and cache the result.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  i <- x$getinverse()
  if(!is.null(i)){
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  #print(data)
  i <- solve(data)
  x$setinverse(i)
  i
}
