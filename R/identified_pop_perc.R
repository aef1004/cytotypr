#' Add in the percentage data for all of the samples for the filtered populations
#'
#' @param df1 dataframe that contains the filtered populations
#' @param df2 dataframe that contains the feature engineered data with the percentages
#' @param marker_vector vector of the order of markers to show on the plots
#'
#' @return dataframe that contains percentage of cells in each of the filtered populations
#' @export
#'
#' @examples identified_pop_perc(sample_populations, all_fe, marker_vector = order_of_markers)
#'
#' @importFrom dplyr %>%
identified_pop_perc <- function(df1, df2, marker_vector) {

  population <- filename <-  NULL

  # add the percentages from original data to the populations of filtered data
  add_perc <- dplyr::left_join(df1, df2, by = marker_vector)

  # expand the data so can see which files have 0 cells in a phenotype
  all_options <- tidyr::expand(add_perc, population, filename)

  # add the populations back
  add_pops <- dplyr::left_join(all_options, df1)

  # add the percentages back
  sample_populations_all_groups <- dplyr::left_join(add_pops, df2) %>%
    dplyr::select(.data$population, .data$filename, .data$percentage) %>%
    dplyr::mutate_all(list(~replace_na(., 0)))

  return(sample_populations_all_groups)
}
