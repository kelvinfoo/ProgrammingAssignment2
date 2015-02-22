## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## The makeVector function creates a special "vector", which is really a list containing a function to
## set the value of the vector
## get the value of the vector
## set the value of the mean
## get the value of the mean

makeCacheMatrix <- function(x = matrix()) {
m <- NULL
	set <- function(y) {
		x <<- y
		m <<- NULL
	}
	get <- function() x
	setinv <- function(solve) m <<- solve
	getinv <- function() m
	list(set=set, get=get, setinv=setinv, getinv=getinv)
}


## Write a short comment describing this function

## This function will calculate the inverse of the matrix created with the above function.
## It will skip computation and retrieve the result from cache if the function has 
## previously been performed on a similar matrix.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

	m <- x$getinv()
	if(!is.null(m)) {
		message("getting cached data")
		return(m)
	}
	data <- x$get()
	m <- solve(data, ...)
	x$setinv(m)
	m
}

##