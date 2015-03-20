## There are two functions written below. They store the matrix defined by the user in a cache. Subsequently the second
##  function returns the inverse of the matrix, either from the cache if it already exists or else calculates the inverse using solve()

## This function takes the matrix defined by the user and stores the matrix in a cache

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL					# creates a null object
        set <- function(y) {	
                x <<- y				# stores the matrix in a different environmnet i.e. the cache
                inv <<- NULL
        }
        get <- function() x      # creates the get function to import the matrix 
        setinv <- function(solve) inv <<- solve  # creates the setinv function to assign inv to solve()
        getinv <- function() inv  # creates the getinv function to calculate the inverse of the matrix
}


## This function either returns the cached inverse of the matrix or else solves the inverse of the user defined matrix

cacheSolve <- function(x, ...) {

        ## Return a matrix that is the inverse of 'x'
        
		inv <- x$getinv()             # assigns inv as the inverse of the matrix
        		if(!is.null(inv)) {
               		 message("getting cached data")  # if the inverse is cached
               		 return(inv)    #the cached inverse is returned
       		 }
       		 data <- x$get()    #  other wise the inverse is calculated using solve()
       		 inv <- solve(data, ...)
       		 x$setinv(inv)
       		 inv
}
