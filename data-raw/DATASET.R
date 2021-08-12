catch <-
  readr::read_csv("./data-raw/nigis.csv") %>%
  tidyr::pivot_longer(c(-Year), names_to = "Info", values_to = "Catch_ton") %>%
  dplyr::mutate(Region = stringr::str_extract(Info, "Central|Southern"),
                Info = stringr::str_remove(Info, "Central_|Southern_"),
                Gear = stringr::str_extract(Info, ".+(?=\\_)"),
                Location = stringr::str_extract(Info, "(?<=\\_).+")) %>%
  dplyr::select(Year, Region, Gear, Location, Catch_ton) %>%
  dplyr::mutate(Species = "Fish")

usethis::use_data(catch, overwrite = TRUE)
