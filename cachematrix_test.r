# Testing Notes. Remove # before the commands to run
# Create a 2 by 2 Matrix
testMatrix<-matrix(c(1,2,3,4),2,2) 
# Instantiate a variable  that will store the functions
mcm_var<-makeCacheMatrix(testMatrix)

# Use the said variable to display the value of matrix
mcm_var$get()
# First call - calculates cache and stores the value outside of the fucntion scope
cacheSolve(mcm_var)

# Second call retrieves the cached value
cacheSolve(mcm_var)

