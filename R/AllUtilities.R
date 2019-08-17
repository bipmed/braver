braverAgent <- function()
{
    httr::user_agent(paste0("braver/", utils::packageVersion("braver")))
}

pasteStats <- function(stats)
{
    paste(mapply(function(x, y) paste0(x, ": ", y), names(stats), stats), collapse = ", ")
}

getOrNA <- function(x)
{
    if (is.list(x)) {
        if (length(x) > 0) {
            list(sapply(x, getOrNA))
        } else {
            NA
        }
    } else {
        ifelse(!is.null(x), x, NA)   
    }
}

parseQuery <- function(x, datasetId = NULL, assemblyId = NULL)
{
    if (length(x) != 1) {
        stop("length(x) must be 1.")
    }
    
    regex <- "^\\s*([1-9]|1[0-9]|2[0-2]|[XY])\\s*:\\s*(\\d+)\\s*-\\s*(\\d+)\\s*$"
    res <- as.character(stringr::str_match(x, regex))
    if (!all(is.na(res))) {
        return(Query(
            referenceName = res[2],
            start = as.integer(res[3]), 
            end = as.integer(res[4])
        ))
    } 
    
    regex <- "^\\s*([1-9]|1[0-9]|2[0-2]|[XY])\\s*:\\s*(\\d+)\\s*$"
    res <- as.character(stringr::str_match(x, regex))
    if (!all(is.na(res))) {
        return(Query(
            referenceName = res[2],
            start = as.integer(res[3]),
            datasetId = datasetId,
            assemblyId = assemblyId))
    } 
    
    regex <- "^\\s*(rs\\d+)\\s*$"
    res <- as.character(stringr::str_match(x, regex))
    if (!all(is.na(res))) {
        return(Query(
            snpId = tolower(res[2]),
            datasetId = datasetId,
            assemblyId = assemblyId))
    } 
    
    regex <- "^\\s*([A-Za-z0-9\\-]+)\\s*$"
    res <- as.character(stringr::str_match(x, regex))
    if (!all(is.na(res))) {
        return(Query(
            geneSymbol = toupper(res[2]),
            datasetId = datasetId,
            assemblyId = assemblyId))
    }
        
    stop(paste("Invalid query:", x))
}
