#' Format correlation matrix for input into ggplot
#'
#' @param corr_matrix a correlation matrix derived from using stats::cor()
#'
#' @return
#' @export
#'
#' @examples
#' corr <- calc_corr(sample_populations_all_groups)
#' format_corr(corr)
#'
#' @importFrom dplyr %>%
#' @importFrom rlang .data
#'
format_corr <- function(corr_matrix) {

  melted_corr <- reshape2::melt(corr_matrix) %>%
  dplyr::mutate(Var1 = as.factor(.data$Var1),
           Var2 = as.factor(.data$Var2))

  return(melted_corr)
}
