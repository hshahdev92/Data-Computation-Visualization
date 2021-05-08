df_nh <- read.csv("COVID-19_Nursing_Home_Dataset.csv")
df_nh_co_beds <- select(df_nh, c(Provider.Name, Provider.State, County, Number.of.All.Beds, Total.Number.of.Occupied.Beds)) %>%
  mutate(Available_Beds = Number.of.All.Beds - Total.Number.of.Occupied.Beds) %>% 
  na.exclude() %>%
  group_by(Provider.State, County) %>%
  summarise(.groups = "keep",Number_of_Available_Beds_by_County = sum(Available_Beds))



df_nh_pr_beds <- select(df_nh, c(Provider.Name, Provider.State, County, Number.of.All.Beds, Total.Number.of.Occupied.Beds)) %>%
  mutate(Available_Beds = Number.of.All.Beds - Total.Number.of.Occupied.Beds) %>% 
  na.exclude() %>%
  group_by(Provider.State, County, Provider.Name) %>%
  summarise(.groups = "keep",Number_of_Available_Beds_by_Provider = sum(Available_Beds))



df_nh_co_vt <- select(df_nh, c(Provider.State, County, Number.of.Ventilators.in.Facility, Number.of.Ventilators.in.Use.for.COVID.19)) %>%
  na.exclude() %>%
  group_by(Provider.State, County) %>%
  summarise(.groups = "keep",across(everything(),list(sum))) %>%
  na.exclude() %>%
  mutate(Ratio_of_available_vt = Number.of.Ventilators.in.Use.for.COVID.19_1 / Number.of.Ventilators.in.Facility_1)
  
df_nh_co_vt$Ratio_of_available_vt <- round(df_nh_co_vt$Ratio_of_available_vt, 3)
  

df_nh_pr_vt <- select(df_nh, c(Provider.Name, Provider.State, County, Number.of.Ventilators.in.Facility, Number.of.Ventilators.in.Use.for.COVID.19)) %>%
  na.exclude() %>%
  group_by(Provider.State, County, Provider.Name) %>%
  summarise(.groups = "keep",across(everything(),list(sum))) %>%
  na.exclude() %>%
  mutate(Ratio_of_available_vt = Number.of.Ventilators.in.Use.for.COVID.19_1 / Number.of.Ventilators.in.Facility_1)

df_nh_pr_vt$Ratio_of_available_vt <- round(df_nh_pr_vt$Ratio_of_available_vt, 3)

df_nh_co_beds_vt <- full_join(df_nh_co_beds, df_nh_co_vt)
df_nh_pr_beds_vt <- full_join(df_nh_pr_beds, df_nh_pr_vt)

write.csv(df_nh_co_beds_vt,file = "NursingHome_Available_Beds_vt_by_County_Task4.csv")
write.csv(df_nh_pr_beds_vt,file = "NursingHome_Available_Beds_vt_by_Provider_Task4.csv")

test <- select(df_nh, c(County, Number.of.Ventilators.in.Facility))
