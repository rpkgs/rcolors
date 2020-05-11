#' @keywords internal
#' @import magrittr
#' @importFrom grDevices colorRampPalette colors
#' @importFrom graphics abline barplot mtext par plot rect text
#' @importFrom utils read.table
"_PACKAGE"

# The following block is used by usethis to automatically manage
# roxygen namespace tags. Modify with care!
## usethis namespace: start
## usethis namespace: end
NULL

.onLoad <- function (libname, pkgname){
    if(getRversion() >= "2.15.1") {
        utils::globalVariables(".")
    }
}
