library(purrr)
write_fig(expression(show_cols(rcolors, fontsize = 0.8)), "rcolormap.svg", 8, 60)

{
    par(mar = c(0.25, 2, 0.25, 0.25), mgp = c(0, 0, 0))
    par(las=1)
    barplot(rep(1, 72),
            # yaxt = "n",
            space = c(0, 0), border = NA,
            col = color,
            xaxs = "i"
            # xlim = c(2, 72)
            # las=2
            # ylab = name
            # , ylab = list(name, angle = 90)
    )
    # axis(2, at = 0.5, labels = name, srt = 45, tck = 0)
    mtext(name, 2, las = 1)
    # text(-2, 0.5, "try", adj = c(0,0.5))
}


# las
# numeric in {0,1,2,3}; the style of axis labels.
#
# 0:
#     always parallel to the axis [default],
# 1:
#     always horizontal,
# 2:
#     always perpendicular to the axis,
# 3:par("usr")
#     always vertical.
