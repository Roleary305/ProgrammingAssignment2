## The following functions allow you to store the inversion of a matrix to prevent the need to re-calculate.

## Pass this function a matrix and it will create a matrix like object that can be used with the cahceSolve function.

makeCacheMatrix <- function(x = matrix()) {

 m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) m <<- solve
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)

}


##cacheSolve will check if the inversion has already been stored, if it has it will return it, if it has not been stored it will calculate using solve() and store it.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
 m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}
