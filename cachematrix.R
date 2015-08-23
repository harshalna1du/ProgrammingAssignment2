## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This is a function that stores other functions that are used for operations in the cacheSolve function.
makeCacheMatrix <- function(x = matrix()) 
{

  ## Initialize the inverse value to NULL otherwise call to get_inverse will fail when no Inverse has been cached.
  InverseValue <- NULL
  
  
  set <- function(y)
  {

    x <<- y

  }
  
  ## returns the value of x passed which will be a matrix
  get <- function() 
  {
    x
  }
  
  ## Saves Inverse value which will be saved in Global Environment (assumingw we run the code in that). 
  ## Not having << will result in InverseValue being set in scope of the set_inverse function
  set_inverse <- function(SuppliedInverseValue)
  {
    InverseValue <<- SuppliedInverseValue
  }
  
  ## Return the value of Inversevalue. The program will look for variable in the environment stack, 
  ## going up from function to global environment
  get_inverse <- function()
  {
    InverseValue
  }
  
  ## list used to give access tot he fucntions. Withot this, the valiable of type makeCacheMatrix
  ## will not be able to access the functions in it.
  list(set=set, get=get, set_inverse=set_inverse, get_inverse=get_inverse)
  
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) 
{
  ## This is passed the variable  created when we run the function makeCacheMatrix
  ## This variable will be pased to X when cacheSolve() is called.
  
  
  ## get the value of inverse. This will be null if we have not calculated inverse yet by calling cacheSolve().  
   current_Inverse<-x$get_inverse()
   
   ## the first time, we should not enter this condition since current_Inverse will be NULL
   if(!is.null(current_Inverse))
    {
      message("Getting Inverse from cache since current inverse is NULL.")
      ## this will return the cached value of Inverse that was saved by set_inverse() 
      return(x$get_inverse())
   }
   else
   {
    ## Get the matrix that needs to be inversed. THis matrix was created when we called the 
    ## function makeCacheMatrix() the first time which created the variabe of type list that was passed to cacheSolve 
     
    ValueToInverse<-x$get()
    
    # calculate the inverse and save in Cache
    x$set_inverse(solve(ValueToInverse))
    
    #return the saved value
    return (x$get_inverse())
   }
}

## Testing Notes. Remove # before the commands to run
## Create a 2 by 2 Matrix
#testMatrix<-matrix(c(1,2,3,4),2,2) 
## Instantiate a variable  that will store the functions
#mcm_var<-makeCacheMatrix(testMatrix)

## Use the said variable to display the value of matrix
#mcm_var$get()
## First call - calculates cache and stores the value outside of the fucntion scope
#cacheSolve(mcm_var)

## Second call retrieves the cached value
# cacheSolve(mcm_var)


