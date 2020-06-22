#these libraries need to be loaded
library(utils)
library(tidyverse)
library(tools)

#read the Dataset sheet into “R”. The dataset will be called "data".
library(readxl) 
library(httr) #create the URL where the dataset is stored with automatic updates 
#every day 

## data -1 day
#yesterday <- (format(Sys.time(), "%Y-%m-%d")) 

#yesterday <- yesterday %>% 
#  lubridate::as_date()

#url <- paste(
#  "https://www.ecdc.europa.eu/sites/default/files/documents/COVID-19-geographic-disbtribution-worldwide-",format(yesterday, "%Y-%m-%d"), ".xls", sep = "") 
#download the dataset from the website to a local temporary file 
#GET(url, authenticate(":", ":", type="ntlm"), 
#write_disk(tf <- tempfile(fileext = ".xls"))) #read the Dataset sheet into “R” 

##readxl::read_excel(url)


#data <- read_excel(tf) 



#read the Dataset sheet into “R” data <- read_excel(tf) 
data <- readr::read_csv(
  here::here(
    "data-raw",
    "D010",
    "2020-06-19_covid_ecdc_cases_geography.csv"), 
                 na = "")

#write_csv(data, here::here(
#  "data-raw",
#  "D010",
#  paste(Sys.Date(), "covid_ecdc_cases_geography.csv", sep = "_")
#  )
#)
  
## create MD5 sums for file ( a unique hash 
## that corresponds to the contents of the file)
# md5sum(files = here::here(
#   "data-raw",
#   "D010",
#   paste(Sys.Date(), "covid_ecdc_cases_geography.csv", sep = "_")
# )) %>% write_lines(
#   path = 
#     here::here(
#       "data-raw",
#       "D010",
#       paste(Sys.Date(), "md5sums_covid_ecdc_cases_geography.md5", sep = "_")
#       ))
# 
#   