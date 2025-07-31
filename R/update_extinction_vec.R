

update_extinction_vec <- function(i, j, column_i, column_j, extinction_vec, missing_vec, correl, thresh){


  #debugging_uev(i, j, missing_vec)

  if(correl >= thresh){

    a <- missing_vec[[i]][[1]]
    b <- missing_vec[[j]][[1]]

    if(a >= b){
      extinction_vec[i] <- 1
    } else {
      extinction_vec[j] <- 1

    }
  }


  return(extinction_vec)
}

debugging_uev <- function(i, j, missing_vec){

  print("")
  print("update extinction vec debugging begins here:")
  print("i")
  print(i)
  print("j")
  print(j)
  print("The missing vec is:")
  print(missing_vec)
  print("End of update extinction vec debugging:")
}
