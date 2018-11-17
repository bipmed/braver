library(braver)

test_that("parseQuery works", {
    expect_equal(parseQuery("scn1a"), Query(geneSymbol = "SCN1A"))
    expect_equal(parseQuery("1:65000-70000"),
                 Query(referenceName = "1", start = 65000, end = 70000))
    expect_equal(parseQuery("1:7737651"),
                 Query(referenceName = "1", start = 7737651))
    expect_equal(parseQuery("rs35735053"), Query(snpId = "rs35735053"))
})
