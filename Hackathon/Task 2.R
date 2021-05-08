df_nh <- read.csv("COVID-19_Nursing_Home_Dataset.csv")
df_nh_cs <- select(df_nh, c(Provider.Name, Provider.State, County, Shortage.of.Clinical.Staff)) %>%
  filter(Shortage.of.Clinical.Staff == "Y") %>%
  group_by(Provider.State, County) %>%
  summarise(.groups = "keep",WeeksofShortage_of_CS_by_County = n())

df_nh_cs_pr <- select(df_nh, c(Provider.Name, Provider.State, County, Shortage.of.Clinical.Staff)) %>%
  filter(Shortage.of.Clinical.Staff == "Y") %>%
  group_by(Provider.State, County,Provider.Name) %>%
  summarise(.groups = "keep",WeeksofShortage_of_CS_by_Provider = n())




df_nh_ad <- select(df_nh, c(Provider.Name, Provider.State, County, Shortage.of.Aides)) %>%
  filter(Shortage.of.Aides == "Y") %>%
  group_by(Provider.State, County) %>%
  summarise(.groups = "keep",WeeksofShortage_of_AD_by_County = n())

df_nh_ad_pr <- select(df_nh, c(Provider.Name, Provider.State, County, Shortage.of.Aides)) %>%
  filter(Shortage.of.Aides == "Y") %>%
  group_by(Provider.State, County,Provider.Name) %>%
  summarise(.groups = "keep",WeeksofShortage_of_AD_by_Provider = n())




df_nh_ns <- select(df_nh, c(Provider.Name, Provider.State, County, Shortage.of.Nursing.Staff)) %>%
  filter(Shortage.of.Nursing.Staff == "Y") %>%
  group_by(Provider.State, County) %>%
  summarise(.groups = "keep",WeeksofShortage_of_NS_by_County = n())

df_nh_ns_pr <- select(df_nh, c(Provider.Name, Provider.State, County, Shortage.of.Nursing.Staff)) %>%
  filter(Shortage.of.Nursing.Staff == "Y") %>%
  group_by(Provider.State, County,Provider.Name) %>%
  summarise(.groups = "keep",WeeksofShortage_of_NS_by_Provider = n())




df_nh_os <- select(df_nh, c(Provider.Name, Provider.State, County, Shortage.of.Other.Staff)) %>%
  filter(Shortage.of.Other.Staff == "Y") %>%
  group_by(Provider.State, County) %>%
  summarise(.groups = "keep",WeeksofShortage_of_OS_by_County = n())

df_nh_os_pr <- select(df_nh, c(Provider.Name, Provider.State, County, Shortage.of.Other.Staff)) %>%
  filter(Shortage.of.Other.Staff == "Y") %>%
  group_by(Provider.State, County,Provider.Name) %>%
  summarise(.groups = "keep",WeeksofShortage_of_OS_by_Provider = n())



df_nh_co_sh <- full_join(df_nh_ad, df_nh_cs)
df_nh_co_sh <- full_join(df_nh_co_sh, df_nh_ns)
df_nh_co_sh <- full_join(df_nh_co_sh, df_nh_os)

write.csv(df_nh_co_sh,file = "NursingHome_Shortage_by_County.csv")

df_nh_pr_sh <- full_join(df_nh_ad_pr, df_nh_cs_pr)
df_nh_pr_sh <- full_join(df_nh_pr_sh, df_nh_ns_pr)
df_nh_pr_sh <- full_join(df_nh_pr_sh, df_nh_os_pr)

write.csv(df_nh_pr_sh,file = "NursingHome_Shortage_by_Provider.csv")