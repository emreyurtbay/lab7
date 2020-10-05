library(rvest)
library(tidyverse)

url <- "http://www.tornadohistoryproject.com/tornado/Oklahoma/1998/table"
ok_tornado <- read_html(url) %>%
  html_nodes("#results") %>%
  html_table(header = TRUE) %>%
  .[[1]] %>%
  janitor::clean_names() %>%
  select(date:lift_lon)

for (i in 1999:2017) {
  url <- paste0("http://www.tornadohistoryproject.com/tornado/Oklahoma/",i,"/table")
  ok_t <- read_html(url) %>%
    html_nodes("#results") %>%
    html_table(header = TRUE) %>%
    .[[1]] %>%
    janitor::clean_names() %>%
    select(date:lift_lon)
  ok_tornado <- bind_rows(ok_tornado, ok_t)
}

saveRDS(ok_tornado, file = "ok_tornadoes")