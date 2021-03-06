% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/heatmap_all_pheno.R
\name{heatmap_all_pheno}
\alias{heatmap_all_pheno}
\title{Visualize all of identified populations in a heatmap}
\usage{
heatmap_all_pheno(df)
}
\arguments{
\item{df}{dataframe for which you want to visualize all of the different populations}
}
\value{
pheatmap of all of the phenotypes denoted by a combination of positive and negative expression of markers
}
\description{
Visualize all of identified populations in a heatmap
}
\examples{
library(dplyr)

 order_of_markers <- c("CD3", "CD4", "CD8",  "CD44", "CD103", "Sca1", "IL_17","CTLA4",
"CD27",  "CD153", "KLRG1", "IFN",  "CD122", "PD1", "CD62L", "IL_10", "CD28","TNF")

filter_for_total_pheno(all_fe, marker_order = order_of_markers) \%>\%
heatmap_all_pheno()

#' @importFrom dplyr \%>\%

}
