library(data.table)
library(foreach)
library(iterators)

# 从ncl官网获取270 colors
urls <- fread("./data-raw/url_ncl_colors.txt", header = FALSE)$V1

url = "https://www.ncl.ucar.edu/Document/Graphics/ColorTables/Files/hlu_default.rgb"
outdir = "data-raw/ncl_colors/"

temp <- foreach(url = urls, i = icount()) %do% {
    file_org = sprintf("%s/%s", "./data-raw/ncl_colormaps/", basename(url))
    file = sprintf("%s/%s", outdir, basename(url))
    if (file.exists(file_org)) {
        file.rename(file_org, file)
    } else {
        tryCatch({
            if (!file.exists(file)) download.file(url,  file)
        }, error = function(e){
            print(e)
        })
    }
}

## grouped colors: rcolor2
library(xml2)
library(httr)
library(purrr)
p <- read_html("https://www.ncl.ucar.edu/Document/Graphics/color_table_gallery.shtml")

groups = xml_find_all(p, "//h2") %>% xml_text() %>% gsub(" color tables", "", .) %>%
    gsub("/", "_", .) %>% tolower()
ts = xml_find_all(p, "//table")[-1] %>% set_names(groups) # first is content
colornames <- lapply(ts, function(tb) {
    xml_text(tb) %>% gsub("\\n\\d{1,} colors\n", "", .) %>% {strsplit(., "\n")[[1]]}
})
rcolors2 <- map(colornames, ~rcolors[.x])
usethis::use_data(rcolors2, overwrite = TRUE)
