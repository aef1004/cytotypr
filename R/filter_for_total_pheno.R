#' Filter for visualizing all the phenotypes
#'
#' @param df dataframe for which you want to visualize the total number of different populations
#' @param marker_order vector of the order you want the markers to be in for the plot
#'
#' @return dataframe with all of the phenotypes denoted by a combination of positive and negative expression of markers
#' @export
#'
#' @examples
#' order_of_markers <- c("CD3", "CD4", "CD8",  "CD44", "CD103", "Sca1", "IL_17","CTLA4",
#' "CD27",  "CD153", "KLRG1", "IFN",  "CD122", "PD1", "CD62L", "IL_10", "CD28","TNF")
#'
#' filter_for_total_pheno(all_fe, marker_order = order_of_markers)
#'
#' @importFrom dplyr %>%
#' @importFrom rlang .data
#'
filter_for_total_pheno<- function(df, marker_order) {

  total_phenotypes <- df %>%
    dplyr::select(-.data$filename, -.data$percentage, -.data$cell_no, -.data$total_count_by_file) %>%
    dplyr::group_by_if(is.factor) %>%
    unique() %>%
    dplyr::ungroup() %>%
    dplyr::select(marker_order) %>%
    dplyr::mutate_all(~as.numeric(.))

  return(total_phenotypes)
}
