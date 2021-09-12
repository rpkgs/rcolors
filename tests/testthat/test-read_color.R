test_that("rcolors works", {
  file = system.file("ncl_colors/3gauss.rgb", package = "rcolors")
  cols = read_color(file)

  expect_equal(length(cols), 254)
  expect_equal(cols[1], "#0000FF")
})
