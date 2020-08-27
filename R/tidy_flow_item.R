#' Convert flowframe to tidy dataframe
#'
#' This function is used by tidy_flow_set
#'
#' @param flowSet_item  the flowset in which to convert to a tidy flow set
#'
#' @return
#'
#'
#' @examples
#'
#' @importFrom dplyr %>%
tidy_flow_item <- function(flowSet_item){
  flowSet_item %>%
    Biobase::exprs() %>%
    tibble::as_tibble()
}
