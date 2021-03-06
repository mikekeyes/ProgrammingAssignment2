## Functions to store the inverse of a matrix to 
## a cache to to eliminate the need for re-calculations


## function containing functions to store (set) and retrieve (get) 
## values from the cache
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setmatrix <- function(matrix) m <<- matrix
    getmatrix <- function() m
    list(set = set, get = get,
         setmatrix = setmatrix,
         getmatrix = getmatrix)
}


## function to return the inverse of a matrix
## first checks if result exists in the Cache
## if not, then it calculates the result and stores
## result in the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        ## get the matrix if it is cached
    m <- x$getmatrix()

    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    ## not cached, get the matrix
    data <- x$get()
    ## invert the matrix
    m <- solve(data)
    ## cache the inverted matrix
    x$setmatrix(m)
    ## return the inverted matrix
    m
}
