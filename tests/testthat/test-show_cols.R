test_that("show_cols works", {
    expect_silent({
        show_cols(colors_group$rainbow, margin = 14)
        show_cols_brewer(colors_group$brewer)
        show_col(colors_group$banded$`3gauss`)
    })
})
