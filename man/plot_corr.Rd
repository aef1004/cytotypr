% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_corr.R
\name{plot_corr}
\alias{plot_corr}
\title{Plot correlation plot}
\usage{
plot_corr(df)
}
\arguments{
\item{df}{df containing the melted correlation data with Var1 and Var2, and a value}
}
\value{
ggplot showing correlation between different populations
}
\description{
Plot correlation plot
}
\examples{
corr <- calc_corr(sample_populations_all_groups)
melted_corr <- format_corr(corr)
plot_corr(melted_corr)

}
