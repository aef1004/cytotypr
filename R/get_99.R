#' Identify the 99 percent cutoff between negative and positive populations for each of the markers
#'
#' @param df the dataframe that contains the filtered FMO (so only the FMO filename has data for the FMO marker)
#'
#' @return dataframe that contains the value of the 99 percent cutoff for each of the FMOs
#' @export
#'
#' @examples get_99(FMO_filtered_data)
#'
#' @importFrom dplyr %>%
#' @importFrom rlang .data
#'
get_99 <- function(df) {

  add_quantile <- df %>%
    dplyr::group_by(.data$filename) %>%
    dplyr::summarise(quantile_99 = stats::quantile(.data$MFI, 0.99))

  return(add_quantile)
}
