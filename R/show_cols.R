#' Show list of colors
#'
#' @param colors_list A list objects filled with colors_list or a color vector
#' @param margin margin in the left
#' @param family,fontsize font family and size of color names in the left
#'
#' @examples
#' print(names(colors_group))
#' show_cols(colors_group$rainbow, margin = 14)
#' @export
show_cols <- function(colors_list, margin = 8, fontsize = 1, family = NULL) {
  if (!is.list(colors_list)) colors_list <- list(colors_list)
  names <- names(colors_list)
  n <- length(colors_list)
  if (is.null(names)) {
    names <- if (n == 1) {
      margin <- 3
      ""
    } else {
      seq_len(n)
    }
  }

  # par(mfrow = c(n, 1), mar = rep(0.25, 4))
  height <- 0.05
  old <- par(mfrow = c(n, 1), mar = c(height, 0.25, height, margin), mgp = c(0, 0, 0))
  on.exit(par(old))

  suppressWarnings({
    for (i in seq_along(colors_list)) {
      color <- colors_list[[i]]
      name <- names[i]

      ncol <- length(color)
      barplot(rep(1, ncol),
        yaxt = "n",
        space = c(0, 0), border = NA,
        col = color,
        xaxs = "i"
        # xlim = c(2, ncol)
        # , ylab = name
      )
      if (n > 10) abline(v = ncol * .05, col = "white", lwd = 0.7)
      # , family = "Times"
      title <- sprintf(" %s (n = %s)", paste0(rep(" ", 0), name), ncol)
      mtext(title, 4, las = 1, cex = fontsize, adj = 0, family = family) # , family = "Arial"
      # text(-4, 0.5, name, adj = c(0, 0.5))
      # sprintf("\n\n%s", name)
    }
  })
  invisible()
}

#' - `show_cols`: show list of colors
#' - `show_cols_brewer`: show list of colors in RColorBrewer style
#'
#' @export
#' @rdname show_cols
show_cols_brewer <- function(colors_list) {
  nr <- length(colors_list)
  nc <- sapply(colors_list, length) %>% max()
  names <- get_name(colors_list)

  ylim <- c(1, nr)
  plot(1, 1,
    xlim = c(0, nc), ylim = ylim, type = "n",
    axes = FALSE, bty = "n", xlab = "", ylab = ""
  )

  for (i in 1:nr) {
    color <- colors_list[[i]]
    nj <- length(color)
    if (is.null(color)) next
    # shadi <- brewer.pal(nj, colorlist[i])
    rect(
      xleft = 0:(nj - 1), ybottom = i - 1, xright = 1:nj,
      ytop = i - 0.2, col = color, border = "light grey"
    )
  }
  text(rep(-0.1, nr), (1:nr) - 0.6, labels = names, xpd = TRUE, adj = 1)
}


#' @param colors a character vector of colors
#' @param labels boolean, whether to show the hexadecimal representation of the colours in each tile
#' @param borders colour of the borders of the tiles
#' @param cex_label size of printed labels, works the same as cex parameter of [plot()]
#' @param nrow integer, number of rows
#'
#' @export
#' @rdname show_cols
show_col <- function(colors, labels = TRUE, borders = NULL, cex_label = 1, nrow = NULL) {
  n <- length(colors)

  if (is.null(nrow)) {
    ncol <- ceiling(sqrt(n))
    nrow <- ceiling(n / ncol)
  } else {
    ncol <- ceiling(n / nrow)
  }

  colors <- c(colors, rep(NA, nrow * ncol - length(colors)))
  colors <- matrix(colors, ncol = ncol, byrow = TRUE)
  old <- par(pty = "s", mar = c(0, 0, 0, 0))
  on.exit(par(old))

  size <- max(dim(colors))
  plot(c(0, size), c(0, -size),
    type = "n", xlab = "",
    ylab = "", axes = FALSE
  )
  rect(col(colors) - 1, -row(colors) + 1, col(colors), -row(colors),
    col = colors, border = borders
  )
  if (labels) {
    text(col(colors) - 0.5, -row(colors) + 0.5, colors,
      cex = cex_label
    )
  }
}
