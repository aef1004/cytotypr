#' Convert flowframe to tidy dataframe
#'
#' This function is used by tidy_flow_set
#'
#' @param flowSet_item  the flowset in which to convert to a tidy flow set
#'
#' @return a tibble of the flowSet data
#' @export
#'
#' @examples flowCore::fsApply(x = flowset_FMO_gated_data, FUN = tidy_flow_item)
#'
#' @importFrom dplyr %>%
#'
tidy_flow_item <- function(flowSet_item){
  flowSet_item %>%
    Biobase::exprs() %>%
    tibble::as_tibble()
}

