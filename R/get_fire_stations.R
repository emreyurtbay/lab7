### Get the Fire Stations
library (tidyverse)
library (jsonlite)
base_url <- "https://data.okc.gov/services/portal/api/data/records/"
query <- "fire%20stations"
url <- str_c(base_url, query)
# 
lst <- read_json(url)
# FireStations
fire_stations <- data.frame(matrix(unlist(lst$Records), nrow=length(lst$Records), byrow=T))
colnames(fire_stations) <- c("ObjectID", "Station_Number", "Station_Address", "Shape")
fire_stations %>% as_tibble() -> f_s
saveRDS(f_s, file = "fire_stations")