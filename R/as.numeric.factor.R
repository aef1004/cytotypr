#' Convert factor variables to numeric while retaining the numbers
#'
#' @param x vector of factors variables
#'
#' @return vector of numeric variables
#' @export
#'
#' @examples
#'
#' x <- as.factor(0, 1)
#' as.numeric.factor(x)
#'
as.numeric.factor <- function(x) {
  as.numeric(levels(x))[x]
  }
