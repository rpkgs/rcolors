#' col2hex
#' 
#' @param col character, color name
#' @return character, hex color
#' 
#' @examples
#' col2hex("grey80")
#' @export 
col2hex <- function(col="grey80") {
  rgb_values <- col2rgb(col)
  hex_value <- rgb(rgb_values[1,], rgb_values[2,], rgb_values[3,], maxColorValue = 255)
  return(hex_value)
}
