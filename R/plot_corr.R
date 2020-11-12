#' Plot correlation plot
#'
#' @param df df containing the melted correlation data with Var1 and Var2, and a value
#'
#' @return
#' @export
#'
#' @examples
#' plot_corr(melted_corr)
#'
#' @importFrom rlang .data
plot_corr <- function(df) {

  ggplot2::ggplot(df, ggplot2::aes(x = .data$Var1, y = .data$Var2, fill = .data$value)) +
    ggplot2::geom_tile() +
    viridis::scale_fill_viridis() +
    ggplot2::theme_bw()

}
