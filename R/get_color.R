#' Get and interpolate colors
#'
#' @param col color name in the `rcolors` or a vector of colors
#' @param n Integer, default is length of `col`
#' @param show Boolean, whether to visualize those colors?
#' 
#' @details 
#' `supported col names`: 270 ncl colors (`names(rcolors)`) and 35 
#' RColorBrewer colors (`names(colors_group$brewer)`).
#' 
#' @inherit grDevices::rgb return
#' 
#' @seealso [show_cols()]
#' @examples
#' print(names(rcolors[1:6]))
#' print(names(colors_group$brewer))
#' get_color("amwg_blueyellowred", n = 20)
#' @export
get_color <- function(col, n = NULL, show = FALSE) {
    cols = if (length(col) > 1) col else rcolors::rcolors[[col]]
    if (is.null(n)) n = length(cols)

    cols = colorRampPalette(cols)(n)
    if (show) show_col(cols)
    cols
}
