#These functions set a matrix in a new environment and return the inverse of the matrix

#This function set any matrix in a new environment and "define" necessary functions for the next function ('set', 'setinv', 'get' and 'getinv')

makeCacheMatrix <- function(x = matrix()) {
v<-NULL
set<-function(y) {
x<<-y
v<<-NULL
}
get<-function() x
setinv<-function(inv){v<-inv}
getinv<-function() v
list(set=set,get=get,setinv=setinv,getinv=getinv)
}


#This function take the information of the above function (the "necessary" functions and the matrix) and return the inverse of the matrix.

cacheSolve <- function(x, ...) {
v<-x$getinv()
if(!is.null(v)){
messsage("getting cached data")
return(v)
}
data<-x$get()
v<-solve(data,...)
x$getinv(v)
v
}
