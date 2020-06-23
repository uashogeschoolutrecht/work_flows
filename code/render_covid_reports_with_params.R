#############################################
# knit covid graphs with different params
# for automated reporting
# Author: Marc Teunis
# Date: 22 June 2020
#############################################

## Automated report is stored in "./Rmd/automated_reports
rmarkdown::render(
  params = list(month = paste("May June"), 
                geo_id = as.character("NL BE")),
  input = here::here(
    "Rmd",
    "covid_cases.Rmd"),
  output_file = 
    here::here(
     "Rmd",
     "automated_reports",
      paste0("covid_cases.Rmd", Sys.Date())   
))

