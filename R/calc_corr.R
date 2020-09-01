#' Calculate correlation matrix of cell percentages for individual populations
#'
#' @param df dataframe that contains the samples, populations, and percentages
#'
#' @return correlation matrix
#' @export
#'
#' @examples calc_corr(sample_populations_all_groups)
#'
#' @importFrom dplyr %>%
#' @importFrom rlang .data
#'
calc_corr <- function(df) {

  population <- . <-  NULL

  corr <- df %>%
    dplyr::mutate(population= stringr::str_replace(population, "Pop", "")) %>%
    tidyr::pivot_wider(names_from = .data$population, values_from = .data$percentage) %>%
    dplyr::select(-.data$filename) %>%
    dplyr::select(c(paste0(1:ncol(.))))

  corr <- round(stats::cor(corr), 1)

  return(corr)

}
