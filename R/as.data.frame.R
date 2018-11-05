#' @export
as.data.frame.Query <- function(x)
{
    data.frame(
        datasetId = getOrNA(x$datasetId),
        assemblyId = getOrNA(x$assemblyId),
        snpId = getOrNA(x$snpId),
        referenceName = getOrNA(x$referenceName),
        start = getOrNA(x$start),
        end = getOrNA(x$end),
        geneSymbol = getOrNA(x$geneSymbol)
    )
}

#' @export
as.data.frame.Variant <- function(x)
{
    df <- data.frame(
        snpIds = getOrNA(unlist(x$snpIds)),
        datasetId = getOrNA(x$datasetId),
        assemblyId = getOrNA(x$assemblyId),
        totalSamples = getOrNA(x$totalSamples),
        referenceName = getOrNA(x$referenceName),
        start = getOrNA(x$start),
        referenceBases = getOrNA(x$referenceBases),
        alternateBases = unlist(getOrNA(x$alternateBases)),
        geneSymbol = getOrNA(x$geneSymbol),
        alleleFrequency = unlist(getOrNA(x$alleleFrequency)),
        sampleCount = getOrNA(x$sampleCount),
        clnsig = getOrNA(unlist(x$clnsig))
    )
    df$coverage <- list(unlist(x$coverage))
    df$genotypeQuality <- list(unlist(x$genotypeQuality))
    df
}
