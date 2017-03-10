#load data set into data frame
titanic <- read.csv("~/Foundations of Data Science/Data Wrangling Exercise 2/titanic_original.csv")

#add "S" to empty cells in embarked column
titanic$embarked <- as.character(titanic$embarked)
titanic$embarked[titanic$embarked==""] <- "S"
titanic$embarked <- as.factor(titanic$embarked)

#add mean of age column to empty cells in age column
titanic$age[is.na(titanic$age)] <- mean(titanic$age, 0, na.rm = TRUE)

#add NA or None to empty cells in boat column
titanic$boat <- as.character(titanic$boat)
titanic$boat[titanic$boat==""] <- "None"
titanic$boat <- as.factor(titanic$boat)

#add new column has_cabin_number with 1 for yes and 0 for none
titanic$has_cabin_number <- ifelse((grepl("[A-Z]", titanic$cabin)),1,0)

#save cleaned up data as titanic_clean.csv
write.csv(titanic, "~/Foundations of Data Science/Data Wrangling Exercise 2/titanic_clean.csv")