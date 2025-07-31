
# This function was begun on 11/3
# ******************************************************************************
#
#   This function takes as input a data frame along with other metadata and
#   returns a data frame where:
#   1.) The columns have been multiplied by one another, and the resulting
#       product columns have been given meaningful names.
#   2.) Any columns consisting of characters rather than numbers have been
#       converted to a numeric data type.
#   3.) The column multiplication has been carried out according to
#       moderator x non-moderator logic.  Moderators are not multiplied by
#       other moderators, and non-moderators are not multiplied by non-
#       moderators.
#   3.) Any columns pairs whose correlation exceeds the value of "thresh"
#       have not been multiplied.
#   4.) Correlations calculated in (3) above have been done appropriately
#       by data type, according to the paper
#
#
#
# ******************************************************************************



options(error = NULL)

column_mixer_2 <- function(df2, moderator_list, nominalvars, ordinalvars, continuousvars, missing_vec){

  # This is the threshold that, if exceeded, triggers the decision NOT to multiply
  # two columns together.
  thresh <- 0.90

  # In order to iterate over the data frame input, we need to know the number of columns it has.
  nCols <- ncol(df2)

  # The extinction vector is a vector of column numbers that have been determined to correlate
  # (greater than the "thresh" value) with some other column in the data frame.  Here,
  # we are simply creating the extinction_vec.
  extinction_vec <- prepare_extinction_vec(df2)

  # convert columns with char data to columns with
  # numeric data, and replace in the df
  df <- convert_char_to_numeric_by_column(df2)



  # This is the for-next loop that iterates over the data frame (and moderator_list),
  # determining whether each column should be multiplied or not (per their correlation)
  # with non-moderator columns.
  for(element in moderator_list){


    for(i in 1:nCols){

      flag1 <- FALSE
      flag2 <- FALSE
      # This if-statement only executes if column "i" is not listed in "moderator_list".
      if (!(i %in% moderator_list)){



        data_type1 <- determine_data_type(element, nominalvars, ordinalvars, continuousvars)
        data_type2 <- determine_data_type(i, nominalvars, ordinalvars, continuousvars)

        correl <- find_correlation(df[[element]], df[[i]], data_type1, data_type2)

        # Flag1 will be set to "TRUE" if the two columns "df[[element]] and df[[i]]
        # correlate greater that "thresh".

        flag1 <- get_flag(df[[element]], df[[i]], correl, thresh)



        col_index <- which(moderator_list == element)

        # This if-statement updates the extinction vector so that the column with more missing values
        # 'goes extinct' (i.e. won't be multiplied with any other columns in future multiplications).
        # The extinction vector falls out of scope once this instance of column_mixer goes out of scope.



        if(flag1){
          extinction_vec <- update_extinction_vec(col_index, i, df[[element]], df[[i]], extinction_vec, missing_vec, correl, thresh)
        }

        # This flag will be set to TRUE if either the current 'element' or 'i' columns
        # have been listed in the extinction vector.
        flag2 <- look_for_extinct_cols(col_index, i, extinction_vec)


        # Here, we actually multiply the columns
        # and append them to the data frame
        if((!flag1) && (!flag2)){

            # This is the line that multiplies the two
            # columns by one another.
            moderator <- df[[element]]
            non_mod <- df[[i]]
            new_column <- custom_multiply_columns(moderator, non_mod)

            # These next two lines actually create the new column
            # and append it to the existing dataframe with the
            # new column, and an appropriate name indicating
            # which two columns were multiplied.
            col_name_i <- colnames(df)[i]
            new_column_name <- paste("aux", element, col_name_i, sep = "_")
            df <- cbind(df, setNames(data.frame(new_column), new_column_name))

        } # END if(!flag)

      } # END if (!(i ...

    } # END for i ...

  } # END for(element ...

  return(df)
} # END function



