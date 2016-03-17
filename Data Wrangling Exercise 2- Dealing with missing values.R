#find names that have no embarked data and add "S"
titanic<-read.csv("titanic_original.csv")
titanic$embarked[titanic$embarked == ""] <- "S"

#use mean of age column to populate empty cells
titanic$age[is.na(titanic$age)] <- mean(titanic$age, na.rm = TRUE)
#could also use mean plus normal distribution so applying the mean ~264 times
#does not overload and adjust the  mean lower:
#titanic$age[is.na(titanic$age)] <- rnorm(length(missing(titanic$age)),
#mean(titanic$age, na.rm = TRUE), sd(titanic$age, na.rm = TRUE)

#set blank values in column, "boat", to NA
NA -> titanic$boat[titanic$boat == ""]

#create dummy variables for cabin numbers by first setting new column = 0
# and then changing rows with no cabin to 0
titanic$has_cabin_number <- 1
titanic$has_cabin_number[titanic$cabin == ""] <- 0

#write csv. file called titanic_clean.csv
write.csv(titanic, "titanic_clean.csv")
