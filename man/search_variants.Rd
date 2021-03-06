% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/search_variants.R
\name{search_variants}
\alias{search_variants}
\title{Search BraVE server.}
\usage{
search_variants(
  queries,
  datasetId = NULL,
  assemblyId = NULL,
  start = 1,
  length = -1,
  URL = "https://bcbcloud.fcm.unicamp.br/brave/search",
  simplify = TRUE
)
}
\arguments{
\item{queries}{gene symbols, genomic ranges, genomic position, dbSNP ID, mixed}

\item{datasetId}{dataset ID, \code{NULL} for all datasets (default)}

\item{assemblyId}{reference genome version, \code{NULL} for any version (default)}

\item{start}{1-based page begin}

\item{length}{page length - \code{-1} for all variants (default)}

\item{URL}{server API endpoint - default to BraVE server}

\item{simplify}{return \code{data.frame} (default), otherwise list of \code{Variant} objects.}
}
\value{
variants which match the search queries
}
\description{
Search BraVE server.
}
\examples{
search_variants("SCN1A", start = 1, length = 10)
search_variants("scn1a", start = 11, length = 10)
search_variants("1:65000-70000", datasetId = "bipmed-wes-phase2")
search_variants("1:7737651", assemblyId = "GRCh37")
search_variants("rs35735053")
search_variants(c("SCN1A", "1:65000-70000", "1:7737651", "rs35735053"))
}
