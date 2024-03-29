% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{df_all_gated}
\alias{df_all_gated}
\title{A dataset containing all sample data before cleaning up and feature engineering}
\format{
A dataframe with 797,889 rows and 28 variables:
\describe{
  \item{filename}{ character: the sample name from which each data point originates}
  \item{Time}{the relative time at which each cell event was recorded}
  \item{SSC-H}{the MFI expression for the Side Scatter (complexity) Height for each cell}
  \item{SSC-A}{the MFI expression for the Side Scatter (complexity) Area for each cell}
  \item{FSC-H}{the MFI expression for the Forward Scatter (size) Height for each cell}
  \item{FSC-A}{the MFI expression for the Forward Scatter (size) Area for each cell}
  \item{BV421-A}{the MFI expression in the BV421-A channel for each cell}
  \item{Pacific Blue-A}{the MFI expression Pacific Blue-A channel for each cell}
  \item{BV480-A}{the MFI expression BV480-A channel  for each cell}
  ...
}
}
\usage{
df_all_gated
}
\description{
A dataset containing all sample data before cleaning up and feature engineering
}
\keyword{datasets}
