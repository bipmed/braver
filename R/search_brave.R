#' Search BraVE server.
#'
#' @param queries gene symbols, genomic ranges, genomic position, dbSNP ID, mixed
#' @param datasetId dataset ID, \code{NULL} for all datasets (default)
#' @param assemblyId reference genome version, \code{NULL} for any version (default)
#' @param start 1-based page begin
#' @param length page length - \code{-1} for all variants (default)
#' @param URL server API endpoint - default to BraVE server
#' @param simplify return \code{data.frame} (default), otherwise list of \code{Variant} objects.
#' @examples
#' search_brave("SCN1A", start = 1, length = 10)
#' search_brave("scn1a", start = 11, length = 10)
#' search_brave("1:65000-70000", datasetId = "bipmed-wes-phase2")
#' search_brave("1:7737651", assemblyId = "GRCh37")
#' search_brave("rs35735053")
#' search_brave(c("SCN1A", "1:65000-70000", "1:7737651", "rs35735053"))
#' @return variants which match the search queries
#' @export
search_brave <- function(
    queries,
    datasetId = NULL,
    assemblyId = NULL,
    start = 1,
    length = -1,
    URL = "https://bcbcloud.fcm.unicamp.br/brave/search",
    simplify = TRUE
)
{
    queries <- lapply(queries, function(query) {
        if (is.character(query)) {
            query <- parseQuery(query, datasetId, assemblyId)
        }
        query[lengths(query) != 0]
    })
    
    body <- list(
        start = start - 1,
        length = length,
        queries = queries
    )
    
    response <- httr::POST(
        url = URL,
        body = body,
        encode = "json",
        httr::timeout(getOption("timeout")),
        braverAgent()
    )
    
    if (httr::http_error(response)) {
        stop(paste0("BraVE API request failed.
Code: ", httr::status_code(response), "
Message: ", jsonlite::fromJSON(httr::content(response, "text"))$message), call. = FALSE)
    }
    
    if (httr::http_type(response) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    content <- jsonlite::fromJSON(httr::content(response, "text"), simplifyVector = FALSE)
    
    results <- lapply(content$data, function(x) {
        Variant(
            snpIds = x$snpIds,
            datasetId = x$datasetId,
            assemblyId = x$assemblyId,
            totalSamples = x$totalSamples,
            referenceName = x$referenceName,
            start = x$start,
            referenceBases = x$referenceBases,
            alternateBases = x$alternateBases,
            geneSymbol = x$geneSymbol,
            alleleFrequency = x$alleleFrequency,
            sampleCount = x$sampleCount,
            coverage = x$coverage,
            genotypeQuality = x$genotypeQuality,
            clnsig = x$clnsig,
            hgvs = x$hgvs,
            type = x$type
        )
    })
    
    if (simplify) {
        dplyr::bind_rows(lapply(results, as_data_frame))
    } else {
        results
    }
}
