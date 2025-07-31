


# ********************************************************************************
#
# Code below this line is for testing the file Minidata.csv
#
# ********************************************************************************


readLines("C:/Users/brent/Documents/GitHub/pcauxng/R/Minidata.csv", n = 20)

df <- read.csv("C:/Users/brent/Desktop/SDT, SC, & IGD - For Sharing.csv", header = TRUE, sep = ",")



line <- "Age,Gender,Ethnicity,Ethnicity_Elab,EnglishNativeLang,BPNSF_AS1,BPNSF_AF1,BPNSF_RS1,BPNSF_RF1,BPNSF_CS1,BPNSF_CF1,BPNSF_AS2,BPNSF_AF2,BPNSF_RS2,BPNSF_RF2,BPNSF_CS2,BPNSF_CF2,BPNSF_AS3,BPNSF_AF3,BPNSF_RS3,BPNSF_RF3,BPNSF_CS3,BPNSF_CF3,BPNSF_AS4,BPNSF_AF4,BPNSF_RS4,BPNSF_RF4,BPNSF_CS4,BPNSF_CF4,VG_Frequency,VG_YearsPlaying,VG_SessionLength,WeekdayPlaytime_1,WeekdayPlaytime_2,WeekdayPlaytime_3,WeekdayPlaytime_4,WeekendPlaytime_1,WeekendPlaytime_2,WeekendPlaytime_3,WeekendPlaytime_4,GAMS_Intrinsic1,GAMS_Intrinsic2,GAMS_Intrinsic3,GAMS_Integrated1,GAMS_Integrated2,GAMS_Integrated3,GAMS_Identified1,GAMS_Identified2,GAMS_Identified3,GAMS_Introjected1,GAMS_Introjected2,GAMS_Introjected3,GAMS_External1,GAMS_External2,GAMS_External3,GAMS_Amotivation1,GAMS_Amotivation2,GAMS_Amotivation3,GAMS_AttCheck,IGD_1,IGD_2,IGD_3,IGD_4,IGD_5,IGD_6,IGD_7,IGD_8,IGD_9,IGD_10,IGD_11,IGD_12,IGD_13,IGD_14,IGD_15,IGD_16,IGD_17,IGD_18,IGD_19,IGD_20,IGD_21,IGD_22,IGD_23,IGD_24,IGD_25,IGD_26,IGD_27,SCS_1,SCS_2,SCS_3,SCS_4,SCS_5,SCS_6,SCS_7,SCS_8,SCS_9,SCS_10,SCS_11,SCS_12,SCS_13,SCS_14,SCS_15,SCS_16,SCS_17,SCS_18,SCS_19,SCS_20,SCS_21,SCS_22,SCS_23,SCS_24,SCS_25,SCS_26,SCS_27,SCS_28,SCS_29,SCS_30,SCS_31,SCS_32,SCS_33,SCS_34,SCS_35,SCS_36,SCS_AttCheck,AC1_Fail,AC2_Fail,AC3_Fail,Failed_ACs,CompSat,AutoSat,RelSat,CompFrust,AutoFrust,RelFrust,NeedSat,NeedFrust,AvgWeekdayPlaytime,AvgWeekendPlaytime,AvgWeeklyPlaytime,Intrinsic,Integrated,Identified,Introjected,External,Amotivation,IGD,SelfControl,AvgWeeklyPlaytime_Wins,SC_P1,SC_P2,SC_P3,IGD_P1,IGD_P2,IGD_P3"
new_line <- quote_csv_line(line)
cat(new_line, "\n")

nominalvars <- c("Ethnicity", "EnglishNativeLang")
ordinalvars <- c("Ethnicity_Elab")
#continuousvars <- c("Age", "BPNSF_AS1", "BPNSF_AF1", "BPNSF_RS1", "BPNSF_RF1", "BPNSF_CS1", "BPNSF_CF1")
continuousvars <- c("Age","BPNSF_AS1","BPNSF_AF1","BPNSF_RS1","BPNSF_RF1","BPNSF_CS1","BPNSF_CF1","BPNSF_AS2","BPNSF_AF2","BPNSF_RS2","BPNSF_RF2","BPNSF_CS2","BPNSF_CF2","BPNSF_AS3","BPNSF_AF3","BPNSF_RS3","BPNSF_RF3","BPNSF_CS3","BPNSF_CF3","BPNSF_AS4","BPNSF_AF4","BPNSF_RS4","BPNSF_RF4","BPNSF_CS4","BPNSF_CF4","VG_Frequency","VG_YearsPlaying","VG_SessionLength","WeekdayPlaytime_1","WeekdayPlaytime_2","WeekdayPlaytime_3","WeekdayPlaytime_4","WeekendPlaytime_1","WeekendPlaytime_2","WeekendPlaytime_3","WeekendPlaytime_4","GAMS_Intrinsic1","GAMS_Intrinsic2","GAMS_Intrinsic3","GAMS_Integrated1","GAMS_Integrated2","GAMS_Integrated3","GAMS_Identified1","GAMS_Identified2","GAMS_Identified3","GAMS_Introjected1","GAMS_Introjected2","GAMS_Introjected3","GAMS_External1","GAMS_External2","GAMS_External3","GAMS_Amotivation1","GAMS_Amotivation2","GAMS_Amotivation3","GAMS_AttCheck","IGD_1","IGD_2","IGD_3","IGD_4","IGD_5","IGD_6","IGD_7","IGD_8","IGD_9","IGD_10","IGD_11","IGD_12","IGD_13","IGD_14","IGD_15","IGD_16","IGD_17","IGD_18","IGD_19","IGD_20","IGD_21","IGD_22","IGD_23","IGD_24","IGD_25","IGD_26","IGD_27","SCS_1","SCS_2","SCS_3","SCS_4","SCS_5","SCS_6","SCS_7","SCS_8","SCS_9","SCS_10","SCS_11","SCS_12","SCS_13","SCS_14","SCS_15","SCS_16","SCS_17","SCS_18","SCS_19","SCS_20","SCS_21","SCS_22","SCS_23","SCS_24","SCS_25","SCS_26","SCS_27","SCS_28","SCS_29","SCS_30","SCS_31","SCS_32","SCS_33","SCS_34","SCS_35","SCS_36","SCS_AttCheck","AC1_Fail","AC2_Fail","AC3_Fail","Failed_ACs","CompSat","AutoSat","RelSat","CompFrust","AutoFrust","RelFrust","NeedSat","NeedFrust","AvgWeekdayPlaytime","AvgWeekendPlaytime","AvgWeeklyPlaytime","Intrinsic","Integrated","Identified","Introjected","External","Amotivation","IGD","SelfControl","AvgWeeklyPlaytime_Wins","SC_P1","SC_P2","SC_P3","IGD_P1","IGD_P2","IGD_P3" )
modvars <- c("BPNSF_AS1", "BPNSF_AF1")


N <- length(continuousvars)
missing_vec <- rep(0, N)
#missing_vec <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)


mixed_df <- column_mixer_2(df, modvars, nominalvars, ordinalvars, continuousvars, missing_vec)

options(max.print=1000000)
print(mixed_df)





# *********************************************************************************
#
#     Everything below this line is for testing purposes and will be removed
#     from the final version of PcAuxNG. (BC 1/26/2025)
#
# *********************************************************************************

generate_test_dataframe <- function(n_nominal, n_ordinal, n_continuous, n_rows) {
  # Initialize an empty list to store the columns
  columns <- list()
  
  # Generate nominal columns
  categories <- sample(LETTERS[1:3], n_rows, replace = TRUE)
  for (i in 1:n_nominal) {
    # Randomly assign nominal categories (e.g., 3 categories: "A", "B", "C")
    
    col_name <- paste0("nominal_", i)
    columns[[col_name]] <- c(categories)
  }
  
  categories <- columns[[col_name]]
  col_name <- paste0("nominal_", i+1)
  columns[[col_name]] <- c(categories)
  
  # Generate ordinal columns
  for (i in 1:n_ordinal) {
    # Randomly assign ordinal values (e.g., 1, 2, 3 representing ordered categories)
    ordinals <- sample(1:5, n_rows, replace = TRUE)
    col_name <- paste0("ordinal_", i)
    columns[[col_name]] <- c(ordinals)
  }
  
  # Generate continuous columns
  for (i in 1:n_continuous) {
    # Randomly assign continuous values (e.g., from a normal distribution)
    continuous <- round(rnorm(n_rows, mean = 0, sd = 1), 2)
    col_name <- paste0("continuous_", i)
    columns[[col_name]] <- c(continuous)
  }
  
  # Combine all columns into a dataframe
  df <- as.data.frame(columns)
  
  return(df)
}

amputate <- function(df){
  
  for(i_row in 1:nrow(df)){
    for(j_col in 1:ncol(df)){
      random_number <- runif(1, 0, 100)
      print("random number")
      print(random_number)
      if(random_number > 90){
        df[i_row, j_col] <- NA
      }# END if random_number
    }# END for j_row
  }# END for i_col
  return(df)
}# END function

filter_input_columns <- function(original_df, input_df) {
  # Get column names of the original data frame
  original_cols <- colnames(original_df)
  
  # Subset the input data frame to keep only columns that exist in the original data frame
  filtered_input_df <- input_df[, original_cols, drop = FALSE]
  
  return(filtered_input_df)
}

# Example usage
set.seed(999)  # For reproducibility
test_df <- generate_test_dataframe(n_nominal = 2, n_ordinal = 2, n_continuous = 2, n_rows = 10)
print(test_df)

nominalvars_input <- c("nominal_1", "nominal_2", "nominal_3")
ordinalvars_input <- c("ordinal_1", "ordinal_2")
continuousvars_input <- c("continuous_1", "continuous_2")
modvars_input <- c("nominal_1", "nominal_2")

nominalvars <- advanced_match(nominalvars_input, test_df)
ordinalvars <- advanced_match(ordinalvars_input, test_df)
continuousvars <- advanced_match(continuousvars_input, test_df)
modvars <- advanced_match(modvars_input, test_df)

nominalvars_input <- c("Qual")
ordinalvars_input <- c("ID", "male", "incident")
continuousvars_input <- c("grade","gpa", "age", "ext1", "ext2", "ext3", "ext4", "int1", "int2", "int3", "int4", "int5", "int6", "ext5", "ext6")
modvars_input <- c("int1", "int2")
test_df <- data.frame(sample1)
nominalvars <- advanced_match(nominalvars_input, test_df)
ordinalvars <- advanced_match(ordinalvars_input, test_df)
continuousvars <- advanced_match(continuousvars_input, test_df)
modvars <- advanced_match(modvars_input, test_df)

missing_vec <- c(0, 1, 3, 0, 0, 0, 0)







test_df <- amputate(test_df)
library(mice)


test_main_pcauxng <- function(test_df, modvars, nominalvars, ordinalvars, continuousvars, missing_vec, nImps){
  
  # Check_vars will go here
  
  temp_mids <- mice(test_df, method = "pmm", m = 1)
  test_df <- complete(temp_mids)
  
  processed_df <- test_df
  
  mixed_df <- column_mixer_2(processed_df, modvars, nominalvars, ordinalvars, continuousvars, missing_vec)
  
  pca_result <- prcomp(mixed_df)
  
  pca_df <- pca_result$x
  
  mids_object <- mice(pca_df, method = "pmm", m = nImps)
  miced_df <- complete(mids_object)  # Default: extracts the first imputed dataset
  
  processed_df <- filter_input_columns(processed_df, mixed_df)
  
  imputed_df <- processed_df
  return(imputed_df)
}

source("find_correlation.R")

final_df <- test_main_pcauxng(test_df, modvars, nominalvars, ordinalvars, continuousvars, missing_vec, 20)

print(final_df)



