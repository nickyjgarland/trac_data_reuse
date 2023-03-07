#set dependencies
library(dplyr)

#import data
burial<-read.csv("data/rrs_burial_data.csv")
core<-read.csv("data/rrs_core_data.csv")
site<-read.csv("data/rrs_site_data.csv")

#join data and filter out non-burial data
rrsp_burial<-full_join(core, site) %>% full_join(., burial) %>% 
  filter(!BURIALS_SUMMARY %in% c("No data"))

#determine number of entries in reconstructed database
nrow(rrsp_burial)

#export data to csv file
write.csv(rrsp_burial, "data/rrsp_burial.csv")
