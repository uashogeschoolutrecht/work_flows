#these libraries need to be loaded
library(utils)
library(tidyverse)
library(tools)

#read the Dataset sheet into “R”. The dataset will be called "data".
data <- read.csv("https://opendata.ecdc.europa.eu/covid19/casedistribution/csv
", na.strings = "", fileEncoding = "UTF-8-BOM")

write_csv(data, here::here(
  "data-raw",
  "D010",
  paste(Sys.Date(), "covid_ecdc_cases_geography.csv", sep = "_")
  )
)
  
## create MD5 sums for file ( a unique hash 
## that corresponds to the contents of the file)
md5sum(files = here::here(
  "data-raw",
  "D010",
  paste(Sys.Date(), "covid_ecdc_cases_geography.csv", sep = "_")
)) %>% write_lines(
  path = 
    here::here(
      "data-raw",
      "D010",
      paste(Sys.Date(), "md5sums_covid_ecdc_cases_geography.md5", sep = "_")
      ))

  