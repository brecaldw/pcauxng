pcauxng <-
  function(data,
           miceargs1 = NULL,
           miceargs2 = NULL,
           prcompargs = NULL,
           nominalvars = NULL,
           ordinalvars = NULL,
           continuousvars = NULL,
           ignorevars = NULL,
           moderator_list = NULL,
           missing_vec = NULL,
           quiet = FALSE) {
    #stopifnot(
    #  'argument "data" is missing, with no default' = !missing(data),
    #  'argument "data" must be a data frame' = is.data.frame(data),
    #  'argument "miceargs1" must be a list' = is.list(miceargs1),
    #  'argument "miceargs2" must be a list' = is.list(miceargs2),
    #  'argument "prcompargs" must be a list' = is.list(prcompargs),
    #  'argument "nominalvars" must be a list' = is.list(nominalvars),
    #  'argument "ordinalvars" must be a list' = is.list(ordinalvars),
    #  'argument "continuousvars" must be a list' = is.list(continuousvars),
    #  'argument "ignorevars" must be a list' = is.list(ignore),
    #  'argument "quiet" must be a logical' = is.logical(quiet)
    #)


    source("./column_mixer_2.R")
    source("./convert_char_to_numeric_by_column.R")
    source("./get_flag.R")
    source("./find_correlation.R")
    source("./custom_multiply_columns.R")
    source("./determine_data_type.R")
    source("./look_for_extinct_cols.R")
    source("./prepare_extinction_vec.R")
    source("./update_extinction_vec.R")
    source("./convert_char_factor_to_numeric.R")
    source("./pearson.R")
    source("./kendall_tau.R")
    source("./rank_multiserial.R")
    source("./goodman_kruskall_lambda.R")
    source("./check_for_three_levels.R")



    options(error = NULL)

    original_columns <- colnames(data)


    # Rewrite this without reference to datawizard
    value <- !is.null(ignorevars)




    if (!is.null(ignorevars)) {
      #ignoredata <- datawizard::get_columns(data, ignorevars)
      #data <- datawizard::data_remove(data, select = ignorevars)
      print("void")
    }



    # get a shadow matrix to enable resetting the NA's instead of reloading
    # data

    miceargs1$data = data
    miceargs1$m = 1
    # rm(data)





    #mice1 <- tryCatch({
    #  do.call(mice::mice, miceargs1)
    #}, error = function(cnd) {
    #  message(cat(conditionMessage(cnd), "Brents Errors from Mice"))
    #}, warning = function(cnd) {
    #  message(cat(conditionMessage(cnd), "Brents Warnings from Mice"))
    #} , finally = {
      # rm(data)
    #})

    mice1 <- do.call(mice::mice, miceargs1)



    first_imp_data <- mice::complete(mice1)




    auxdata <- column_mixer_2(first_imp_data, moderator_list, nominalvars, ordinalvars, continuousvars, missing_vec)
    remove(mice1)



    miceargs2$data <- auxdata

    #mice2 <- tryCatch({
    #    do.call(mice::mice, miceargs2)
    #}, error = function(cnd) {
    #    message(conditionMessage(cnd))
    #}, warning = function(cnd) {
    #    message(conditionMessage(cnd))
    #} , finally = {
    # rm(data)
    #})
    mice2 <- tryCatch({
      do.call(mice::mice, miceargs2)
    }, error = function(cnd){
      print("Brent said that was an error")
      print(cnd)
    }, warning = function(cnd){
      print("Brent Said that was a warning")
      print(cnd)
    }, finally = {
      print("something about the command didn't make sense.")
    })


    #mice2 <- do.call(mice::mice, miceargs2)

    #debugging2_pcauxng(mice2)



    #completed_data <- mice::complete(mice2)
    return(mice2)


}
# END function pcauxng

debugging_pcauxng <- function(x){

  print("Begin debugging for pcauxng")

  completed_data <- mice::complete(x)  # Returns all imputations stacked in long format
  print(completed_data)
  print("End debugging for pcauxng")
  print("")
}
debugging2_pcauxng <- function(mice2){
  print("Begin debugging2 for pcauxng")
  print("The value of mice2 is:")
  print(mice2)
  print("and its class is:")
  print(class(mice2))
  print("End debugging2")
}


  #data_final <- mice::complete(mice2)
  #return(data_final)

  # TODO: generate raw data with component scores and write out
  # TODO: Check for columns with no data and add list to ignore
