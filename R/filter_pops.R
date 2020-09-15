#' Filter populations to show all the populations of interest
#'
#' @param df dataframe that contains the information for all of the populations
#'
#' @return dataframe that contains the filtered population names
#' @export
#'
#' @examples
#' library(dplyr)
#' all_fe %>%
#'  dplyr::filter(CD3 == 1 & percentage > 0.5) %>%
#'  filter_pops()
#'
#' @importFrom dplyr %>%
#' @importFrom rlang .data
#'
filter_pops <- function(df) {

  . <-  NULL

  df %>%
    dplyr:: select(-.data$filename, -.data$percentage, -.data$cell_no, -.data$total_count_by_file) %>%
    dplyr::group_by_all() %>% # need to ensure that this will only group by the markers we used above (for check for other people)%>%
    unique() %>%
    dplyr::ungroup() %>%
    dplyr::mutate(population = paste0("Pop", 1:nrow(.)))
}


