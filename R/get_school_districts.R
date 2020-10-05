url <- "https://data.okc.gov/services/portal/api/data/records/school%20district%20boundaries"
# 
lst <- read_json(url)
# FireStations
s_d <- data.frame(matrix(unlist(lst$Records), nrow=length(lst$Records), byrow=T))
colnames(s_d) <- c("ObjectID", "District_Code", "District_Name", "Shape")
s_d %>% as_tibble() -> s_d
saveRDS(s_d, file = "school_districts")