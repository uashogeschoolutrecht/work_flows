#######################################################################
# to create a task that runs daily
# Author: Marc Teunis
# Date 22 June, 2020
########################################################################

taskscheduleR::taskscheduler_create(
  taskname = "covid_daily_update3", 
  rscript = here::here("code", "render_covid_reports_with_params.R"),
                     startdate = format(Sys.Date() + 1, "%m/%d/%Y"), 
                     schedule = "DAILY",
                     starttime = "16:30")

## to kill the task 
# taskscheduleR::taskcheduler_stop("covid_daily_update")                     
#taskscheduleR::taskcheduler_runnow("covid_daily_update3")
