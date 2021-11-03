#' Calculates the cell counts and percentages for individual populations
#'
#' @param df dataframe to calculate the cell counts and percentages
#'
#' @return dataframe with the percentage of cells in each population for each sample
#' @export
#'
#' @examples df_all_gated_simple %>%
#'  select(ends_with("-A"), -`FSC-A`, filename) %>%
#'  dplyr::rename(`CD3` = "Alexa Fluor 532-A",
#'                `CD4` = "BV480-A",
#'                `CD8` = "BV570-A") %>%
#'  dplyr::filter(`SSC-A` != max(`SSC-A`)) %>%
#'  mutate(CD3 = fe(add_quantile, CD3, "CD3"),
#'         CD4 = fe(add_quantile, CD4, "CD4"),
#'         CD8 = fe(add_quantile, CD8, "CD8")) %>%
#'  select(-`Zombie Nir-A`,  -`SSC-A`) %>%
#'  count_calc()
#'
#' @importFrom dplyr %>%
#' @importFrom rlang .data
#'
count_calc <- function(df) {

  total_count_by_file <- percentage <- cell_no <- NULL

  df %>%
    dplyr::mutate_at(dplyr::vars(-dplyr::group_cols()), list(~tidyr::replace_na(.,0))) %>%
    dplyr::group_by_all() %>% # need to ensure that this will only group by the markers we used above (for check for other people)
    dplyr::mutate(cell_no = dplyr::n()) %>%
    unique() %>%
    dplyr::ungroup() %>%
    dplyr::group_by(.data$filename) %>%
    dplyr::mutate(total_count_by_file = sum(.data$cell_no),
                  percentage = (100*cell_no / .data$total_count_by_file)) %>%
    dplyr::ungroup()
}
