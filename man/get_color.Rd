% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_color.R
\name{get_color}
\alias{get_color}
\title{Get and interpolate colors}
\usage{
get_color(col, n = NULL, show = FALSE)
}
\arguments{
\item{col}{color name in the \code{rcolors} or a vector of colors}

\item{n}{Integer, default is length of \code{col}}

\item{show}{Boolean, whether to visualize those colors?}
}
\description{
Get and interpolate colors
}
\details{
\verb{supported col names}: 270 ncl colors (\code{names(rcolors)}) and 35
RColorBrewer colors (\code{names(colors_group$brewer)}).
}
\examples{
print(names(rcolors[1:6]))
print(names(colors_group$brewer))
get_color("amwg_blueyellowred", n = 20)
}
\seealso{
\code{\link[=show_cols]{show_cols()}}
}