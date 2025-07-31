

goodman_kruskal_lambda <- function(x, y) {
  # Create a contingency table
  tbl <- table(x, y)

  # Calculate column sums
  col_totals <- colSums(tbl)
  row_totals <- rowSums(tbl)
  tbl_total <- sum(col_totals)

  T3 <- max(col_totals)
  T4 <- max(row_totals)

  row_maxima <- c()
  for(i in 1:ncol(tbl)){

    row <- tbl[,i]
    min_val <- max(row)
    row_maxima <- c(row_maxima, min_val)
  }

  col_maxima <- c()
  for(i in 1:nrow(tbl)){
    column <- tbl[i,]
    min_val <- max(column)
    col_maxima <- c(col_maxima, min_val)
  }

  T1 <- sum(row_maxima)
  T2 <- sum(col_maxima)

  lambda <- (T1 + T2 - T3 - T4)/(2*tbl_total - T3 - T4)

  return(lambda)

}

