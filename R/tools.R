vegetation <- c(
    "MPL_BrBG", "NEO_div_vegetation_a", "NEO_div_vegetation_b", "NEO_div_vegetation_c",
    "NEO_modis_ndvi", "NOC_ndvi", "vegetation_ClarkU", "vegetation_modis"
)


# NULL name will be replaced with `seq_along(x)`
get_name <- function(x) {
    names(x) %>% { if(is.null(.)) seq_along(x) else . }
}
