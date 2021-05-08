library(readxl)
library(readr)
library(dplyr)
wildfiredata <- read.csv(file = "mapdataall.csv")
weather_metrics <- read_excel(path = "Total Acres Burned.xlsx")
AQ_data <- read_excel(path = "Air Quality Index Based Days Quality Data.xlsx")

outputdata <- left_join(wildfiredata, weather_metrics)
outputdata <- left_join(outputdata, AQ_data, by = c("Year"="Years","incident_county" = "County"))

write.csv(outputdata, file = "CA_wildfire_compiled.csv")