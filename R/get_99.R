#' Title
#'
#' @param df the dataframe that contains the filtered FMO (so only the FMO filename has data for the FMO marker)
#'
#' @return
#' @export
#'
#' @examples
#'
#' @importFrom dplyr %>%
#'
get_99 <- function(df) {

  add_quantile <- df %>%
    dplyr::group_by(filename) %>%
    dplyr::summarise(quantile_99 = quantile(MFI, 0.99))

  return(add_quantile)
}
