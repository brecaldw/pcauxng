
library(mice)




source("./pcauxng.R")
source("./getmiceargs.R")
source("./getprcompargs.R")
source("./column_mixer_2.R")
source("./prep_missing_vec.R")



df1_i <- Cars93

myData[is.na(myData)] <- 0
myAmpData <- ampute(myData, prop = 0.5)
col_names <- colnames(df1_i)

miceargs1 <- getmiceargs()
miceargs2 <- getmiceargs()

prcompargs_i <- getprcompargs()

nominalvars_i <- col_names
ordinalvars_i <- c()
continuousvars_i <- c()
ignorevars_i <- c()
missing_vec_i <- prep_missing_vec(df1_i)
moderator_list_i <- c("Manufacturer", "Model")
quiet_i <- FALSE
