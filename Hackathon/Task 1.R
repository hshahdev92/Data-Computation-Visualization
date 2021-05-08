df_nh <- read.csv("COVID-19_Nursing_Home_Dataset.csv")
library(dplyr)
df_nh_st <- select(df_nh, c(3,6)) %>%
  distinct(Provider.Name,Provider.State) %>%
  group_by(Provider.State) %>%
  summarise(.groups = "keep",NursingHomes_by_State = n())

hist(df_nh_st$NursingHomes_by_State)
write.csv(df_nh_st,file = "NursingHomebyState.csv")


df_nh_co <- select(df_nh, c(Provider.Name, Provider.State, County)) %>%
  distinct(Provider.Name, Provider.State, County) %>%
  group_by(Provider.State, County) %>%
  summarise(.groups = "keep",NursingHomes_by_County = n())

hist(df_nh_co$NursingHomes_by_County)
write.csv(df_nh_co,file = "NursingHomebyCounty.csv")
count(df_nh_co)

unique(df_nh$County)

distinct(df_nh, Provider.State, County)
