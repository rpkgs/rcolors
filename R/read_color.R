#' read colors from ncl
#'
#' @param file ncl rgb file
#'
#' @inherit grDevices::rgb return
#'
#' @import magrittr
#' @keywords internal
#' @export
read_color <- function(file) {
  tryCatch(
    {
      d <- read.table(file, skip = 1) %>% set_names(c("r", "g", "b"))
      max_value <- max(sapply(d, max))
      max_value <- ifelse(max_value <= 1, 1, 255)
      # pmax(d$r, d$g, d$b) %>% print()
      colors <- with(d, rgb(r, g, b, maxColorValue = max_value))
      colors
    },
    error = function(e) {
      # print(file)
      message(sprintf("[%s]: %s", basename(file), e$message))
    }
  )
  # colors
}
