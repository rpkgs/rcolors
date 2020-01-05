source("test/main_pkgs.R")
# 1. all colors
{
    n0 = length(rcolors2$rainbow)
    cols <- rcolors
    height <- 10 / n0 * length(cols)
    write_fig(expression(show_cols(rcolors, margin = 18, fontsize = 0.8)), "rcolors.pdf", 8, height, show = TRUE)
}

# 2. groups
outdir = "doc"
foreach(cols = rcolors2, name = names(rcolors), i = icount()) %do% {
    runningId(i)
    height = 10/n0*length(cols)
    outfile = sprintf("%s/%s.pdf", outdir, name)
    write_fig(expression(show_cols(cols, margin = 17, fontsize = 0.8)), outfile, 8, height, show = FALSE)
}

files_pdf <- dir(".", "*.pdf")
files_svg <- gsub(".pdf", ".svg", files_pdf)

library(glue)
library(foreach)
library(iterators)
foreach(pdf = files_pdf, svg = files_svg, i = icount()) %do% {
    runningId(i)
    command = glue("inkscape -l {svg} {pdf}")
    shell(command)
}
