#' Convert factor variables to numeric while retaining the numbers
#'
#' @param x vector of factors variables
#'
#' @return vector of numeric variables
#' @export
#'
#' @examples
#'
#' x <- as.factor(c(0, 1))
#' convert_factor_numeric(x)
#'
#'
convert_factor_numeric <- function(x) {
  as.numeric(levels(x))[x]
  }
