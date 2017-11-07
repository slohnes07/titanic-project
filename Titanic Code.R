install.packages("dplyr")
library("dplyr")
install.packages("tidyr")
library("tidyr")
search()
titanic_org <- file.choose()
titanic_csv <- read.csv(titanic_org, header = TRUE, stringsAsFactors = FALSE)
head(titanic_csv)
titanic_df <- tbl_df(titanic_csv)
glimpse(titanic_df)
unique(titanic_df$embarked)
titanic_df$embarked[titanic_df$embarked == ""]<- "S"
mean_age <- mean(titanic_df$age, na.rm = TRUE)
unique(titanic_df$age)
titanic_df$age[is.na(titanic_df$age)] <- mean_age
unique(titanic_df$boat)
titanic_df$boat[titanic_df$boat == ""] <- "None"
titanic_df <- mutate(titanic_df, has_cabin_number = ifelse(cabin == "",0,1))
write.csv(titanic_df, file = "titanic_clean.csv")
