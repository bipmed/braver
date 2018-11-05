#' @export
print.Query <- function(x, ...)
{
    cat(sep = "", "Query\n",
        if (!is.null(x$datasetId)) paste0("datasetId: ", x$datasetId, "\n"),
        if (!is.null(x$assemblyId)) paste0("assemblyId: ", x$assemblyId, "\n"),
        if (!is.null(x$snpId)) paste0("snpId: ", x$snpId, "\n"),
        if (!is.null(x$referenceName)) paste0("referenceName: ", x$referenceName, "\n"),
        if (!is.null(x$start)) paste0("start: ", x$start, "\n"),
        if (!is.null(x$end)) paste0("end: ", x$end, "\n"),
        if (!is.null(x$geneSymbol)) paste0("geneSymbol: ", x$geneSymbol)
  )
}

#' @export
print.Variant <- function(x, ...)
{
    cat("Variant
snpIds: ", paste(x$snpIds, collapse = ", "), "
datasetId: ", x$datasetId, "
assemblyId: ", x$assemblyId, "
totalSamples: ", x$totalSamples, "
referenceName: ", x$referenceName, "
start: ", x$start, "
referenceBases: ", x$referenceBases, "
alternateBases: ", paste(x$alternateBases, collapse = ","), "
geneSymbol: ", x$geneSymbol, "
alleleFrequency: ", paste(x$alleleFrequency, collapse = ","), "
sampleCount: ",x$sampleCount, "
coverage: ", pasteStats(x$coverage), "
genotypeQuality: ", pasteStats(x$genotypeQuality), "
clnsig: ", paste(x$clnsig, collapse = ","), sep="")
}
