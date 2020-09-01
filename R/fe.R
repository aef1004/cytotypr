#' Feature engineer the data
#'
#' @param quantile_df the dataframe that contains the list of cutoffs for each marker
#' @param marker name of the marker column to feature engineer
#' @param marker_name name of the marker column to feature engineer in quotes
#'
#' @return convert the marker data column into either a 0 for negative expression or 1 for positive expressoin
#' @export
#'
#' @examples df_all_gated %>%
#' rename("CD3" = "Alexa Fluor 532-A") %>%
#' mutate(CD3 = fe(add_quantile, CD3, "CD3")
#'
#' @importFrom dplyr %>%
#' @importFrom rlang .data
#'
fe <- function(quantile_df, marker, marker_name) {

  find_quantile <- quantile_df %>%
    dplyr::filter(.data$filename == marker_name) %>%
    dplyr::select(.data$quantile_99)

  cut(marker, breaks = c(min(marker), find_quantile, max(marker)),
      labels = c(0, 1))
}
