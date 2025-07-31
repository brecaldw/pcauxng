
library(mice)


source("./pcauxng.R")
source("./getmiceargs.R")
source("./getprcompargs.R")
source("./column_mixer_2.R")
source("./prep_missing_vec.R")



df1_i <- read.csv("./Maxdata.csv")


miceargs1 <- getmiceargs()
miceargs2 <- getmiceargs()
prcompargs_i <- getprcompargs()



nominalvars_i <- c('Gender', 'Ethnicity', 'EnglishNativeLang')
ordinalvars_i <- c()
ignorevars_i <- c('Ethnicity_Elab')




column_names_csv <- colnames(df1_i)
temp_var <- setdiff(column_names_csv, nominalvars_i)
temp_var2 <- setdiff(column_names_csv, ordinalvars_i)
temp_var3 <- setdiff(column_names_csv, ignorevars_i)
continuousvars_i <- temp_var3


moderator_list_i <- c("BPNSF_AS1","BPNSF_AF1")
missing_vec_i <- prep_missing_vec(df1_i)
quiet_i <- FALSE
miceargs2$m <- 5

data_to_print <- pcauxng(df1_i, miceargs1, miceargs2, prcompargs_i, nominalvars_i, ordinalvars_i, continuousvars_i, ignorevars_i, moderator_list_i, missing_vec_i, quiet_i)

# Original imputation
imp <- mice::mice(df1_i, m = 5, method = "pmm")

# Extract and modify arguments
miceargs <- as.list(imp$call)

# Step 2: Generate and modify predictor matrix
# (You can also extract from imp if it was auto-generated)
pred <- make.predictorMatrix(df1_i)
miceargs$predictorMatrix <- pred
miceargs$m <- 10  # Change number of imputations
miceargs$seed <- 123  # Optional: Add a seed
miceargs$maxit <- 20  # Optional: Change number of iterations

# Re-run mice with new settings
imp2 <- do.call(mice, miceargs)
