#' Visualize subset of identified populations in a heatmap
#'
#' @param df dataframe for which you want to visualize a small subset of populations
#'
#' @return pheatmap of the smaller subset of phenotypes denoted by a combination of positive and negative expression of markers
#' @export
#'
#' @examples
#' library(dplyr)
#'
#'  order_of_markers <- c("CD3", "CD4", "CD8",  "CD44", "CD103", "Sca1", "IL_17","CTLA4",
#' "CD27",  "CD153", "KLRG1", "IFN",  "CD122", "PD1", "CD62L", "IL_10", "CD28","TNF")
#'
#' heatmap_subset_pheno(simple_pop_df, order_of_markers)
#'
#'#' @importFrom dplyr %>%
#'
heatmap_subset_pheno <- function(df, marker_order) {

  viridis_colors <- c("#3F4788FF", "#56C667FF")

  df %>%
    dplyr::select(all_of(marker_order)) %>%
    mutate_all(~convert_factor_numeric(.)) %>%
    pheatmap::pheatmap(cluster_rows = FALSE, cluster_cols = FALSE,
                       labels_row = rownames(df),
                       cellwidth = 15, cellheight = 15, angle_col = 45,
                       color = viridis_colors, cutree_rows = 2, legend = FALSE)
}
