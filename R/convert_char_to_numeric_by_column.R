
# ****************************************************************************
#          This function takes as input a data frame that has a mix
#           of data types, such as nominal, ordinal and continuous.
#           If a particular column is found to contain character data
#           (e.g. T,F, or A,B,C), and if the values are found to be
#           factor data, the data will be converted to numeric data.
#                                                     BC 1/25/2025
# ****************************************************************************

convert_char_to_numeric_by_column <- function(df) {

  # BEGiN ChatGPT
  df[] <- lapply(df, function(column) {
    if (is.character(column)) {
      as.numeric(factor(column, levels = unique(column)))
    } else {
      column
    }
  })
  return(df)
  # END ChatGPT
}




