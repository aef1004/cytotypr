#' Match filename of FMO to filename of FMO samples
#'
#' @param clean_FMO the dataframe that contains the FMO samples and expression levels, note that here the filename and the column marker names need to match exactly
#'
#' @return
#' @export
#'
#' @examples
#'
#' @importFrom dplyr %>%
#'
filter_FMO <- function(clean_FMO) {

  testing <- clean_FMO %>%
    tidyr::gather(key = "marker", value = "MFI", -filename, -`SSC-A`,)

  right <- testing %>%
    dplyr::filter(stringr::str_detect(testing$filename, stringr::fixed(testing$marker)) &
                    stringr::str_detect(testing$marker, stringr::fixed(testing$filename)))

  return(right)

}
