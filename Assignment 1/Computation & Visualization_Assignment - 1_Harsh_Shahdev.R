
library(readxl)
library(tidyr)
library(dplyr)
library(magrittr)
library(stringr)
library(utils)


# Problem 1

roster <- read.csv("roster.csv")
attendance <- read.csv("attendance.csv")




# Split Customer name into first name, last name
name_data<-as.data.frame(str_split(roster$`names`, ",", simplify = T))
roster$lastname <- name_data$V1
roster$firstname <- name_data$V2
students <- roster[,c(2,3)]



# Calculate number of records by firstname and lastname
attend_data <- (attendance %>%
                  group_by(firstname, lastname) %>%
                  summarise(Count = n())%>%
                  arrange(desc(Count)))



# Joining the data frames to get the attendence of the students

cross <-left_join(students,attend_data, by = c("firstname" = "firstname", "lastname" = "lastname"))
cross[is.na(cross)] <- 0


# Problem 2
# Reading the data from the wine_data.csv file

wine_data <- read.csv("wine_data.csv")


# 1)
# Variety Count of top 10

var_data <- (wine_data %>%
               group_by(variety) %>%
               summarise(Count = n())%>%
               arrange(desc(Count)) %>%
               top_n(10))



# 2)
# Average points of the countries

avg_points_country <- (wine_data %>%
                         group_by(country) %>%
                         summarise(mean = mean(points))%>%
                         arrange(desc(mean)))


# 3)
# Highest average price of the province

avg_price_province <- (wine_data %>%
                         group_by(province) %>%
                         summarise(mean = mean(price))%>%
                         arrange(desc(mean)) %>%
                         top_n(1))


# 4)
# Highest average price of the province in the US 

avg_price_province_US <- (wine_data %>%
                            filter(country == "US") %>%  
                            group_by(province) %>%
                            summarise(mean = mean(price)) %>%
                            arrange(desc(mean)) %>%
                            top_n(1))

# 5)
# Total count of 20 year old wines

old_wine <- as.data.frame(wine_data$designation) 
names(old_wine) <- c("Designation")
old20_data <- as.data.frame(str_extract_all(old_wine,"20.[Yy]e?a?r.[s]?"))
old_count <- count(old20_data)

