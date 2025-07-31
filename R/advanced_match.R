# ****************************************************************
#
# this function is strictly for testing, and will not be in the
# final PcAux.
#
# ****************************************************************

advanced_match <- function(list_of_columns, df){


  names_of_columns <- names(df)

  flag <- FALSE
  for(i in 1:length(list_of_columns)){
    if(list_of_columns[i] %in% names_of_columns){
      NULL
    } else {flag <- TRUE}
  }


  if(flag == TRUE){
    stop("ERROR: There is a mismatch between the names of the columns specified by the user and the names of the columns in the actual dataframe.")
  }


  value_to_return <- match(list_of_columns, names_of_columns)

  return(value_to_return)
}
