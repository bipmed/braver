braverAgent <- function() {
    httr::user_agent(paste0("braver/", utils::packageVersion("braver")))
}

pasteStats <- function(stats) {
    paste(mapply(function(x, y) paste0(x, ": ", y), names(stats), stats), collapse = ", ")
}

getOrNA <- function(x) {
    ifelse(!is.null(x), x, NA)
}
