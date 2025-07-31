
replace_NA <- function(df){

  nCol <- ncol(df)
  nRow <- nrow(df)

  for(i in 1:ncol){
    for(j in 1:nrow){
      data <- df[i, j]
      if(is.na(data)){
        df[i, j] <- -999
      }
    } # END FOR j
  } # END FOR i
  return(df)
}
