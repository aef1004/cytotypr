#' Apply the tidy_flow_item function to a flowSet
#'
#' This function ultimately converts a flowSet into a tidy data frame
#'
#' @param flowSet the flowset in which to convert to a tidy flow set
#'
#' @return Returns a dataframe with a row for each observation (cell) with columns for:
#' \itemize{
#' item{\code{filename}}: {the name of the sample for which the cell comes from}
#' item{\code{fluorescent-markers}}: {the same number of marker-fluorescent pairs on read
#' on the machine will show as columns in this data frame}
#' }
#' @export
#'
#' @examples
#'
#' @importFrom dplyr %>%
tidy_flow_set <- function(flowSet){
  flow_set <- flowCore::fsApply(x = flowSet,
                                FUN = tidy_flow_item)
  flow_set <- dplyr::bind_rows(flow_set, .id = "filename")

  return(flow_set)
}
