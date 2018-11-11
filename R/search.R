#' Search for variants given a query.
#'
#' @return a list of \code{Variant} objects.
#' @export
#'
#' @rdname search
#' @export
search <- function(x, ...)
{
    UseMethod("search", x)
}

#' @param x \code{Query} object
#' @param start 1-based page begin
#' @param length page length - \code{-1} for all variants (default)
#' @param URL server API endpoint - default to BraVE server
#' @examples
#' search(Query(geneSymbol = "SCN1A"), start = 1, length = 10)
#' search(Query(geneSymbol = "SCN1A"), start = 11, length = 10)
#' search(Query(referenceName = 1, start = 65000, end = 70000))
#' search(Query(referenceName = 1, start = 7737651))
#' search(Query(snpId = "rs35735053"))
#' @rdname search
#' @export
search.Query <- function(
    x,
    start = 1,
    length = -1,
    URL = "https://bcbcloud.fcm.unicamp.br/braver/search"
)
{
    class(x) <- NULL
    body <- list(
        start = start - 1,
        length = length,
        queries = list(x[lengths(x) != 0])
    )
    
    response <- httr::POST(
        url = URL,
        body = body,
        encode = "json",
        httr::timeout(getOption("timeout")),
        braverAgent()
    )
    
    if (httr::http_error(response)) {
        stop(paste0("Cromwell API request failed.
Code: ", httr::status_code(response), "
Message: ", jsonlite::fromJSON(httr::content(response, "text"))$message), call. = FALSE)
    }
    
    if (httr::http_type(response) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    
    content <- jsonlite::fromJSON(httr::content(response, "text"), simplifyVector = FALSE)
    
    lapply(content$data, function(x) {
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
            clnsig = x$clnsig
        )
    })
}
