## code to prepare `DATASET` dataset goes here
files <- dir("data-raw/ncl_colors/", full.names = TRUE) %>%
    set_names(gsub(".rgb", "", basename(.)))
rcolors <- lapply(files, read_color)

usethis::use_data(rcolors, overwrite = TRUE)
