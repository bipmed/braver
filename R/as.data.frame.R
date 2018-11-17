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
as_data_frame.Variant <- function(x)
{
    data_frame(
        referenceName = getOrNA(x$referenceName),
        start = getOrNA(x$start),
        referenceBases = getOrNA(x$referenceBases),
        alternateBases = getOrNA(x$alternateBases),
        snpIds = getOrNA(x$snpIds),
        
        alleleFrequency = getOrNA(x$alleleFrequency),
        totalSamples = getOrNA(x$totalSamples),
        
        hgvs = getOrNA(x$hgvs),
        type = getOrNA(x$type),
        clnsig = getOrNA(x$clnsig),
        
        coverage = getOrNA(x$coverage),
        genotypeQuality = getOrNA(x$genotypeQuality),
        
        geneSymbol = getOrNA(x$geneSymbol),
        datasetId = getOrNA(x$datasetId),
        assemblyId = getOrNA(x$assemblyId)
    )
}

#' @export
as.data.frame.Variant <- function(x)
{
    as_data_frame(x) %>%
        as.data.frame()
}
