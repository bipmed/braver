#' Create \code{Query} object.
#'
#' @param datasetId Dataset ID - \code{bipmed-wes-phase2}
#' @param assemblyId Reference genome version - \code{hg19}, \code{GRCh38}
#' @param snpId NCBI dbSNP database ID - \code{rs35735053}
#' @param referenceName Chromosome - \code{1}, \code{X}
#' @param start 0-based start position (inclusive) - \code{65000}
#' @param end end position (inclusive) - \code{70000}
#' @param geneSymbol gene name (case-insensitive) - \code{SCN1A}, \code{brca1}
#'
#' @return \code{Query} object.
#' @export
#'
#' @examples
#' # gene symbol
#' Query(geneSymbol = "SCN1A")
#' # genomic range
#' Query(referenceName = 1, start = 65000, end = 70000)
#' # genomic position
#' Query(referenceName = 1, start = 7737651)
#' # dbSNP ID
#' Query(snpId = "rs35735053")
Query <- function(
    datasetId = NULL,
    assemblyId = NULL,
    snpId = NULL,
    referenceName = NULL,
    start = NULL,
    end = NULL,
    geneSymbol = NULL
)
{
    structure(
        c(list(
            datasetId = datasetId,
            assemblyId = assemblyId,
            snpId = snpId,
            referenceName = referenceName,
            start = start,
            end = end,
            geneSymbol = geneSymbol
        )),
        class = "Query"
    )
}
