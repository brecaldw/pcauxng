# ***************************************************************************
#
# This function creates an extinction vector and pre-populates it with zeros.
#
# ***************************************************************************
prepare_extinction_vec <- function(df){

  extinction_vec <- c()
  n <- ncol(df)
  for(i in 1:n){
    extinction_vec <- c(extinction_vec, 0)
  }
  return(extinction_vec)
}



