## ----load-pkgs, message=FALSE----------------------------------------------
library(braver)
library(dplyr)
library(knitr)
library(DT)
library(GenomicRanges)

## ----search-genes----------------------------------------------------------
search_brave("scn1a") %>%
    datatable(options = list(scrollX = TRUE), rownames = FALSE)

## ----table, echo=FALSE-----------------------------------------------------
data_frame(
    "Column" = c("referenceName", "start", "referenceBases", "alternateBases", "snpIds", "alleleFrequency", "geneSymbol", "hgvs", "clnsig", "coverage", "genotypeQuality", "datasetId", "totalSamples", "assemblyId"),
    "Name" = c("Chromosome", "Position", "Reference", "Alternative", "dbSNP", "Frequency", "Genes", "HGVS Notations", "Clinical Significance", "Coverage", "Genotype Quality", "Dataset", "Samples", "Assembly"),
    "VCF" = c("CHROM", "POS", "REF", "ALT", "ID", "AF", "ANN 4", "ANN 10", "CLNSIG", "DP", "GQ", "-", "-", "-")
) %>% kable()

## ----search-mixed----------------------------------------------------------
search_brave(c("SCN1A", "1:65000-70000", "1:7737651", "rs35735053")) %>%
    nrow()

## ----search-pagination-----------------------------------------------------
selection <- c("referenceName", "start", "referenceBases", "alternateBases")
search_brave("SCN1A", length = 2) %>%
    select(selection) %>%
    kable()

search_brave("SCN1A", length = 2, start = 3) %>%
    select(selection) %>%
    kable()

## ----sessionInfo, echo=FALSE-----------------------------------------------
sessionInfo()

