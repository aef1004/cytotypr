#' Plot heatmap of the selected populations of interest
#'
#' @param df
#' @param order_of_markers vector of the order of markers to display on the plot x-axis
#'
#' @return heatmap separated by lineages
#' @export
#'
#' @examples heatmap_picked_pops(phenotype_data, order_of_markers)
heatmap_picked_pops <- function(df, order_of_markers) {

  # create an annotated data frame to add to pheatmap
  phenotype_annot <- df %>%
    dplyr::select(-order_of_markers) %>%
    dplyr::mutate(population = c(paste0("Pop", 1: nrow(df)))) %>%
    tibble::column_to_rownames("population")

  # count the number of rows with each phenotype to create gaps in the plot
  lengths_to_cut <- rownames(unique(phenotype_annot)) %>%
    stringr::str_replace("Pop", "") %>%
    as.numeric() %>%
    as.data.frame()%>%
    dplyr::mutate(. = .-1)

  # plot the data with different annotations

  df %>%
    dplyr::select(-colnames(phenotype_annot)) %>%
    dplyr::select(order_of_markers) %>%
    pheatmap::pheatmap(cluster_rows = FALSE, cluster_cols = FALSE,
             labels_row = rownames(df),
             annotation_row = phenotype_annot,  gaps_row = c(lengths_to_cut[2,], lengths_to_cut[3,], lengths_to_cut[4,]),
             cellwidth = 15, cellheight = 15, angle_col = 45, annotation_colors = my_colors,
             color = c("#3F4788FF", "#56C667FF"), cutree_rows = 2, legend = FALSE)
}
