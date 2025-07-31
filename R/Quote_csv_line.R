

# Begin Chat GPT
quote_csv_line <- function(line) {
  values <- strsplit(line, ",")[[1]]  # Split by commas
  quoted_values <- paste0('"', values, '"')  # Add quotes
  result <- paste(quoted_values, collapse = ",")  # Recombine with commas
  return(result)
}
# End Chat GPT