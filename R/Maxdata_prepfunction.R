
# This short function is only for testing and will not be a part of Pcauxng

Maxdata_prepfunction <- function(column_string){
  # Step 1: Split on commas
  column_names <- strsplit(column_string, ",")[[1]]

  # Step 2: Trim whitespace
  column_names <- trimws(column_names)

  # Step 3: Add single quotes
  quoted_names <- paste0("'", column_names, "'")

  return(quoted_names)
}
