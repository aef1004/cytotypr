#' Match filename of FMO to filename of FMO samples
#'
#' @param clean_FMO the dataframe that contains the FMO samples and expression levels, note that here the filename and the column marker names need to match exactly
#'
#' @return dataframe that contains 4 columns containing the FMO filename, marker name, MFI datapoints that match with the FMO marker of interest, and the SSC.
#' @export
#'
#' @examples filter_FMO(df_FMO_gated_data)
#'
#' @importFrom dplyr %>%
#' @importFrom rlang .data
#'
filter_FMO <- function(clean_FMO) {

  testing <- clean_FMO %>%
    tidyr::gather(key = "marker", value = "MFI", -.data$filename, -.data$`SSC-A`,)

  FMO_filtered_data <- testing %>%
    dplyr::filter(stringr::str_detect(testing$filename, stringr::fixed(testing$marker)) &
                    stringr::str_detect(testing$marker, stringr::fixed(testing$filename)))

  return(FMO_filtered_data)

}
