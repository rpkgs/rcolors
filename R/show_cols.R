#' @export
show_cols <- function(colors, margin = 8, fontsize = 0.6) {
    if (!is.list(colors)) colors = list(colors)
    names = names(colors)
    n <- length(colors)
    if (is.null(names)) names = seq_len(n)

    # par(mfrow = c(n, 1), mar = rep(0.25, 4))
    height <- 0.05

    # browser()
    par(mfrow = c(n, 1), mar = c(height, 0.25, height, margin), mgp = c(0, 0, 0))
    temp <- foreach(color = colors, name = names, i = icount()) %do% {
        # browser()
        ncol <- length(color)
        barplot(rep(1, ncol),
            yaxt = "n",
            space = c(0, 0), border = NA,
            col = color,
            xaxs = "i"
            # xlim = c(2, ncol)
            # , ylab = name
        )
        abline(v = ncol*.05, col = "white", lwd = 0.7)
        # , family = "Times"
        title = sprintf(" %s (n = %s)", paste0(rep(" ", 0), name), ncol)
        mtext(title, 4, las = 1, cex = fontsize, adj = 0, family = "Arial")
        # text(-4, 0.5, name, adj = c(0, 0.5))
        # sprintf("\n\n%s", name)
    }
    invisible()
}

#' @export
show_col <- function(colours, labels = TRUE, borders = NULL, cex_label = 1, nrow = NULL) {
    n <- length(colours)

    if (is.null(nrow)) {
        ncol <- ceiling(sqrt(n))
        nrow <- ceiling(n / ncol)
    } else {
        ncol <- ceiling(n / nrow)
    }

    colours <- c(colours, rep(NA, nrow * ncol - length(colours)))
    colours <- matrix(colours, ncol = ncol, byrow = TRUE)
    old <- par(pty = "s", mar = c(0, 0, 0, 0))
    on.exit(par(old))
    size <- max(dim(colours))
    plot(c(0, size), c(0, -size),
        type = "n", xlab = "",
        ylab = "", axes = FALSE
    )
    rect(col(colours) - 1, -row(colours) + 1, col(colours), -row(colours),
        col = colours, border = borders
    )
    if (labels) {
        text(col(colours) - 0.5, -row(colours) + 0.5, colours,
            cex = cex_label
        )
    }
}
