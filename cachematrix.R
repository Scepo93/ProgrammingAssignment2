## Put comments here that give an overall description of what your
## functions do

## function gets matrix and sets variable inverse at NULL  value, and 
## there are functions get,set,setinverse and getinverse in list and it can 
## be used on makecacheMatrix type to set and get matrix values and to get and 
##set inverse Matrix values

makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    set <- function(y){
      x <<- y
      inverse  <<- NULL
    }
    get <- function () x
    setinverse <- function(inverseValues) inverse <<-inverseValues
    getinverse <- function() inverse
    list(set=set,get=get,
         setinverse = setinverse,
         getinverse = getinverse)
}

## function check if there exists value for inverse and if it exists then use that value
##else calculate inverse and store it with x$setinverse
##returns value of inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverse <- x$getinverse()
  if(!is.null(inverse)){
    message("getting cached data")
    return(inverse)
  }
  data <- x$get()
  inverse <- solve(data)
  x$setinverse(inverse)
  inverse
}
