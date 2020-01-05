# NULL name will be replaced with `seq_along(x)`
get_name <- function(x) {
    names(x) %>% { ifelse(is.null(.), seq_along(colors), .) }
}
