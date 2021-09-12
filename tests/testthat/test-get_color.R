test_that("get_color works", {
    cols <- get_color("amwg_blueyellowred", n = NULL, show = TRUE)
    cols  <- get_color("amwg_blueyellowred", n = 20)
    cols2 <- get_color(rcolors$amwg_blueyellowred, n = 20)
    expect_equal(cols, cols2)
})
