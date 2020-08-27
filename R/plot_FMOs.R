#' Title
#'
#' @param df1 the dataframe that contains the filtered FMO values (only the FMO file that matches up with it's marker)
#' @param df2 the dataframe that contains the quantile values
#'
#' @return
#' @export
#'
#' @examples
plot_FMOs <- function(df1, df2) {

  right_quantile <- dplyr::full_join(df1, df2, by = "filename")

  ggplot2::ggplot(right_quantile, aes(x = MFI, y = `SSC-A`)) +
    ggplot2::geom_hex(bins = 300, na.rm = TRUE) +
    ggplot2::scale_fill_viridis_c() +
    ggplot2::facet_wrap(~ marker, nrow = 3) +
    ggplot2::ylab("") +
    ggplot2::geom_vline(mapping = aes(xintercept = quantile_99)) +
    ggplot2::theme_gray() +
    ggplot2::theme(axis.text = element_text(size =12),
          axis.title = element_text(size = 20),
          strip.text = element_text(size = 12))+
    ggplot2::scale_x_continuous(labels = scientific, limits = c(-10000, 20000), breaks = c(0, 50000))

}
