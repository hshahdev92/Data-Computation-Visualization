df_nh <- read.csv("COVID-19_Nursing_Home_Dataset.csv")
df_nh_N95 <- select(df_nh, c(Provider.Name, Provider.State, County, One.Week.Supply.of.N95.Masks)) %>%
  filter(One.Week.Supply.of.N95.Masks == "N") %>%
  group_by(Provider.State, County) %>%
  summarise(.groups = "keep",WeeksofShortage_of_N95_by_County = n())

df_nh_N95_pr <- select(df_nh, c(Provider.Name, Provider.State, County, One.Week.Supply.of.N95.Masks)) %>%
  filter(One.Week.Supply.of.N95.Masks == "N") %>%
  group_by(Provider.State, County, Provider.Name) %>%
  summarise(.groups = "keep",WeeksofShortage_of_N95_by_Provider = n())


df_nh_ep <- select(df_nh, c(Provider.Name, Provider.State, County, One.Week.Supply.of.Eye.Protection)) %>%
  filter(One.Week.Supply.of.Eye.Protection == "N") %>%
  group_by(Provider.State, County) %>%
  summarise(.groups = "keep",WeeksofShortage_of_EP_by_County = n())


df_nh_ep_pr <- select(df_nh, c(Provider.Name, Provider.State, County, One.Week.Supply.of.Eye.Protection)) %>%
  filter(One.Week.Supply.of.Eye.Protection == "N") %>%
  group_by(Provider.State, County, Provider.Name) %>%
  summarise(.groups = "keep",WeeksofShortage_of_EP_by_Provider = n())


df_nh_gl <- select(df_nh, c(Provider.Name, Provider.State, County, One.Week.Supply.of.Gloves)) %>%
  filter(One.Week.Supply.of.Gloves == "N") %>%
  group_by(Provider.State, County) %>%
  summarise(.groups = "keep",WeeksofShortage_of_GL_by_County = n())


df_nh_gl_pr <- select(df_nh, c(Provider.Name, Provider.State, County, One.Week.Supply.of.Gloves)) %>%
  filter(One.Week.Supply.of.Gloves == "N") %>%
  group_by(Provider.State, County, Provider.Name) %>%
  summarise(.groups = "keep",WeeksofShortage_of_GL_by_Provider = n())

df_nh_hs <- select(df_nh, c(Provider.Name, Provider.State, County, One.Week.Supply.of.Hand.Sanitizer)) %>%
  filter(One.Week.Supply.of.Hand.Sanitizer == "N") %>%
  group_by(Provider.State, County) %>%
  summarise(.groups = "keep",WeeksofShortage_of_HS_by_County = n())

df_nh_hs_pr <- select(df_nh, c(Provider.Name, Provider.State, County, One.Week.Supply.of.Hand.Sanitizer)) %>%
  filter(One.Week.Supply.of.Hand.Sanitizer == "N") %>%
  group_by(Provider.State, County, Provider.Name) %>%
  summarise(.groups = "keep",WeeksofShortage_of_HS_by_Provider = n())


df_nh_sm <- select(df_nh, c(Provider.Name, Provider.State, County, One.Week.Supply.of.Surgical.Masks)) %>%
  filter(One.Week.Supply.of.Surgical.Masks == "N") %>%
  group_by(Provider.State, County) %>%
  summarise(.groups = "keep",WeeksofShortage_of_SM_by_County = n())

df_nh_sm_pr <- select(df_nh, c(Provider.Name, Provider.State, County, One.Week.Supply.of.Surgical.Masks)) %>%
  filter(One.Week.Supply.of.Surgical.Masks == "N") %>%
  group_by(Provider.State, County, Provider.Name) %>%
  summarise(.groups = "keep",WeeksofShortage_of_SM_by_Provider = n())


df_nh_vt <- select(df_nh, c(Provider.Name, Provider.State, County, One.Week.Supply.of.Ventilator.Supplies)) %>%
  filter(One.Week.Supply.of.Ventilator.Supplies == "N") %>%
  group_by(Provider.State, County) %>%
  summarise(.groups = "keep",WeeksofShortage_of_VT_by_County = n())

df_nh_vt_pr <- select(df_nh, c(Provider.Name, Provider.State, County, One.Week.Supply.of.Ventilator.Supplies)) %>%
  filter(One.Week.Supply.of.Ventilator.Supplies == "N") %>%
  group_by(Provider.State, County, Provider.Name) %>%
  summarise(.groups = "keep",WeeksofShortage_of_VT_by_Provider = n())

df_nh_co_sh <- full_join(df_nh_ep, df_nh_gl)
df_nh_co_sh <- full_join(df_nh_co_sh, df_nh_hs)
df_nh_co_sh <- full_join(df_nh_co_sh, df_nh_N95)
df_nh_co_sh <- full_join(df_nh_co_sh, df_nh_sm)
df_nh_co_sh <- full_join(df_nh_co_sh, df_nh_vt)

write.csv(df_nh_co_sh,file = "NursingHome_Shortage_by_County_Task3.csv")

df_nh_pr_sh <- full_join(df_nh_ep_pr, df_nh_gl_pr)
df_nh_pr_sh <- full_join(df_nh_pr_sh, df_nh_hs_pr)
df_nh_pr_sh <- full_join(df_nh_pr_sh, df_nh_N95_pr)
df_nh_pr_sh <- full_join(df_nh_pr_sh, df_nh_sm_pr)
df_nh_pr_sh <- full_join(df_nh_pr_sh, df_nh_vt_pr)

write.csv(df_nh_pr_sh,file = "NursingHome_Shortage_by_Provider_Task3.csv")
