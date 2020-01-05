#' @export 
get_color <- function(name, n = NULL, show = FALSE) {
    cols = rcolors[[name]]
    if (is.null(n)) n = length(cols)

    cols = colorRampPalette(cols)(n)
    if (show) show_col(cols)
    cols
}
