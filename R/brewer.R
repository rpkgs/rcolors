# show colors in brewer style
#' @export 
show_col2 <- function(colors) {
    nr    = length(colors)
    nc    = sapply(colors, length) %>% max()
    names = get_name(colors)
    
    ylim = c(1, nr)
    plot(1, 1, xlim = c(0, nc), ylim = ylim, type = "n", 
        axes = FALSE, bty = "n", xlab = "", ylab = "")
    
    for (i in 1:nr) {
        color <- colors[[i]]
        nj <- length(color)
        if (is.null(color)) next
        # shadi <- brewer.pal(nj, colorlist[i])
        rect(xleft = 0:(nj - 1), ybottom = i - 1, xright = 1:nj, 
            ytop = i - 0.2, col = color, border = "light grey")
    }
    text(rep(-0.1, nr), (1:nr) - 0.6, labels = names, xpd = TRUE, adj = 1)
}
