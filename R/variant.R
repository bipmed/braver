#' Create \code{Variant} object. Internal use.
#'
#' @param id Variant ID
#' @param datasetId Dataset ID
#' @param totalSamples Total samples in dataset
#' @param assemblyId Reference genome version
#' @param snpIds IDs from dbSNP
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
#' @param hgvs Variant using HGVS notation - DNA level (Annotated VCF \code{ANN} field)
#' @param type Feature type - e.g. transcript, motif, miRNA, etc. (Annotated VCF \code{ANN} field)
#'
#' @return a \code{Variant} object.
#' @export
Variant <- function(
    id,
    datasetId,
    totalSamples,
    assemblyId,
    snpIds,
    referenceName,
    start,
    referenceBases,
    alternateBases,
    geneSymbol,
    alleleFrequency,
    sampleCount,
    coverage,
    genotypeQuality,
    clnsig,
    hgvs,
    type
)
{
    structure(
        c(list(
            id = id,
            datasetId = datasetId,
            totalSamples = totalSamples,
            assemblyId = assemblyId,
            snpIds = snpIds,
            referenceName = referenceName,
            start = start,
            referenceBases = referenceBases,
            alternateBases = alternateBases,
            geneSymbol = geneSymbol,
            alleleFrequency = alleleFrequency,
            sampleCount = sampleCount,
            coverage = coverage,
            genotypeQuality = genotypeQuality,
            clnsig = clnsig,
            hgvs = hgvs,
            type = type
        )),
        class = "Variant"
    )  
}
