# ******************************************************************************
#
# This function takes a column number (integer) and determines if that integer
# is in the vectors 'nominalvars', 'ordinalvars', etc.
#
# ******************************************************************************
determine_data_type <- function(i, nominalvars, ordinalvars, continuousvars){


  type1 <- "nominal"
  if(i %in% nominalvars){
    type1 <- "nominal"
  } else if(i %in% ordinalvars){
    type1 <- "ordinal"
  } else if(i %in% continuousvars){
    type1 <- "continuous"
  }
  return(type1)
}
