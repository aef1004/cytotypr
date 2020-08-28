#' Visualize all of identified populations in a heatmap
#'
#' @param df dataframe for which you want to visualize all of the different populations
#'
#' @return pheatmap of all of the phenotypes denoted by a combination of positive and negative expression of markers
#' @export
#'
#' @examples order_of_markers <- c("CD3", "CD4", "CD8",  "CD44", "CD103", "Sca1", "IL_17","CTLA4",
#' "CD27",  "CD153", "KLRG1", "IFN",  "CD122", "PD1", "CD62L", "IL_10", "CD28","TNF")
#' filter_for_total_pheno(all_fe, marker_order = order_of_markers) %>%
#' heatmap(all_pheno)
#'
#'#' @importFrom dplyr %>%
#'
heatmap_all_pheno <- function(df) {

  viridis_colors <- c("#3F4788FF", "#56C667FF")

  pheatmap::pheatmap(df, cluster_rows = FALSE, cluster_cols = FALSE,
           color = viridis_colors, show_rownames = FALSE, legend = F, fontsize = 12, angle_col = 45, width = 2, height = 1.5)
}
