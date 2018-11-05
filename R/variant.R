#' Create \code{Variant} object. Internal use.
#'
#' @param snpIds Variant IDs
#' @param datasetId Dataset ID
#' @param assemblyId Reference genome version
#' @param totalSamples Total samples in dataset
#' @param referenceName Chromosome (VCF \code{CHROM} column)
#' @param start 0-based start position (VCF \code{POS} column)
#' @param referenceBases Reference bases (VCF \code{REF} column)
#' @param alternateBases Alternate bases (VCF \code{ALT} column)
#' @param geneSymbol Gene symbol (Annotated VCF \code{ANN} column)
#' @param alleleFrequency Allele frequency (VCF \code{AF INFO} field)
#' @param sampleCount Samples that have variant (VCF \code{AF INFO} field)
#' @param coverage Distribution of coverage (VCF \code{DP} field)
#' @param genotypeQuality Distribution of genotype quality (VCF \code{GQ} field)
#' @param clnsig Clinical significance (Annotated VCF \code{CLNSIG} column)
#'
#' @return a \code{Variant} object.
#' @export
Variant <- function(
    snpIds,
    datasetId,
    assemblyId,
    totalSamples,
    referenceName,
    start,
    referenceBases,
    alternateBases,
    geneSymbol,
    alleleFrequency,
    sampleCount,
    coverage,
    genotypeQuality,
    clnsig
)
{
    structure(
        c(list(
            snpIds = snpIds,
            datasetId = datasetId,
            assemblyId = assemblyId,
            totalSamples = totalSamples,
            referenceName = referenceName,
            start = start,
            referenceBases = referenceBases,
            alternateBases = alternateBases,
            geneSymbol = geneSymbol,
            alleleFrequency = alleleFrequency,
            sampleCount = sampleCount,
            coverage = coverage,
            genotypeQuality = genotypeQuality,
            clnsig = clnsig
        )),
        class = "Variant"
    )  
}