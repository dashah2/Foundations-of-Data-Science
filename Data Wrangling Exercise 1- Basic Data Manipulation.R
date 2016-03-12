#install data wrangling packages, "dplyr" and "tidyr"
install.packages("dplyr")
library("dplyr")
install.packages("tidyr")
library("tidyr")

#import data set, which was converted to csv in EXCEL
toy_data <- read.csv("refine.csv")

#convert companies to proper name (Exercise 1)
toy_data$company[1:6] <- "philips"
toy_data$company[7:13] <- "akzo"
toy_data$company[14] <- "philips"
toy_data$company[14:16] <- "philips"
toy_data$company[17:21] <- "van houten"
toy_data$company[22:25] <- "unilever"

#separate Product.code...number to two columns, product_code and product_number (Exercise 2)
toy_data <- separate(toy_data, Product.code...number, c("product_code", "product_number"), sep = "-")

#create new column for product_category
toy_data$product_category <- NA
toy_data$product_category[toy_data$product_code=="p"]<- "Smartphone"
toy_data$product_category[toy_data$product_code=="v"]<- "TV"
toy_data$product_category[toy_data$product_code=="x"]<- "Laptop"
toy_data$product_category[toy_data$product_code=="q"]<- "Tablet"

#combine columns for address, city, country to form address
toy_data <- unite(toy_data, full_address, c(address, city, country), sep = ", ")

#create binary columns for company
toy_data$company_philips <- 0
toy_data$company_akzo <- 0
toy_data$company_van_houten <- 0
toy_data$company_unilever <- 0

#create binary columns for product
toy_data$product_smartphone <- 0
toy_data$product_tv <- 0
toy_data$product_laptop <- 0
toy_data$product_tablet <- 0

#set 1 values for respective companies and products
toy_data$company_philips[toy_data$company == "philips"] <- 1
toy_data$company_akzo[toy_data$company == "akzo"] <- 1
toy_data$company_van_houten[toy_data$company == "van houten"] <- 1
toy_data$company_unilever[toy_data$company == "unilever"] <- 1
toy_data$product_smartphone[toy_data$product_category == "Smartphone"] <- 1
toy_data$product_tv[toy_data$product_category == "TV"] <- 1
toy_data$product_laptop[toy_data$product_category == "Laptop"] <- 1
toy_data$product_tablet[toy_data$product_category == "Tablet"] <- 1

#export .csv file named "refine_clean.csv"
write.csv(toy_data, "refine_clean.csv")
