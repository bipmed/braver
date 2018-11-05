## ----style, echo = FALSE, results = 'asis'---------------------------------
BiocStyle::markdown()

## ---- eval=FALSE-----------------------------------------------------------
#  Query(geneSymbol = "SCN1A")
#  Query(referenceName = 1, start = 65000, end = 70000)
#  Query(referenceName = 1, start = 7737651)
#  Query(snpId = "rs35735053")

## ---- eval=FALSE-----------------------------------------------------------
#  search(Query(geneSymbol = "SCN1A"))
#  search(Query(referenceName = 1, start = 65000, end = 70000))
#  search(Query(referenceName = 1, start = 7737651))
#  search(Query(snpId = "rs35735053"))

## ---- eval=FALSE-----------------------------------------------------------
#  search(Query(geneSymbol = "SCN1A"), start = 1, length = 10)
#  search(Query(geneSymbol = "SCN1A"), start = 11, length = 10)

## ---- eval=FALSE-----------------------------------------------------------
#  variants <- search(Query(geneSymbol = "SCN1A"))
#  do.call(rbind, lapply(variants, as.data.frame))

## ----sessionInfo, echo=FALSE-----------------------------------------------
sessionInfo()

