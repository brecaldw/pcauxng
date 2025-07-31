prep_missing_vec <- function(df){

  column_names_vec <- colnames(df)
  missing_vec <- list()

  for(i in 1:length(column_names_vec)){

    num_NA <- sum(is.na(df[[i]]))
    temp <- c(column_names_vec[[i]], num_NA)
    missing_vec[[i]] <- temp

  }





  #debugging_pmv(num_NA)

  return(missing_vec)
}




debugging_pmv <- function(num_NA){

  print("")
  print("Begin debugging for prepe missing vec")
  print("The NA sum is:")
  print(num_NA)
  print("End of debugging prep missing vec")
}
