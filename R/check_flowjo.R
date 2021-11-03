#' Compare calculated feature engineered percentages with Flowjo manual percentage
#'
#' @param df dataframe that contains the samples, populations, and percentages
#' @param marker column name for the name of the marker that you want to check
#'
#' @return
#' @export
#'
#' @examples check_flowjo(all_fe, CD3)
#'
#' @importFrom dplyr %>%
#' @importFrom rlang .data
#'

check_flowjo <- function(df, marker) {

  percentage_df <- df %>%
    filter({{marker}} == 1) %>%
    group_by(.data$filename) %>%
    mutate(sum_percentage  = sum(.data$percentage)) %>%
    select({{marker}}, .data$filename, .data$sum_percentage) %>%
    unique()

  return(percentage_df)
}
