## code to prepare `DATASET` dataset goes here
library(purrr)
files <- dir("data-raw/ncl_colors/", full.names = TRUE) %>%
    set_names(gsub(".rgb", "", basename(.)))
rcolors <- lapply(files, read_color)


# colors from RColorBrewer
d <- RColorBrewer::brewer.pal.info# %>% data.table()
names_brewer <- rownames(d)
colors_brewer <- foreach(name = names_brewer, ncolor = d$maxcolors, i = icount()) %do% {
    RColorBrewer::brewer.pal(ncolor, name)
} %>% set_names(names_brewer)

rcolors %<>% c(colors_brewer)
usethis::use_data(rcolors, overwrite = TRUE)

info <- map(rcolors2, ~data.table(name = names(.))) %>%
    c(., list(brewer = data.table(name = names_brewer))) %>%
    melt_list("grp")

fwrite(info, "data-raw/rcolors_group_info.csv")

colors_group = split(rcolors[info$name], info$grp)
usethis::use_data(colors_group, overwrite = TRUE)
