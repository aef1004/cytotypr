#' Calculates the cell counts and percentages for individual populations
#'
#' @param df dataframe to calculate the cell counts and percentages
#'
#' @return dataframe with the percentage of cells in each population for each sample
#' @export
#'
#' @examples
#' df_all_gated %>%
#'mutate(Timepoint = str_extract(filename, "D[0-9]*")) %>%
#'  mutate(Group = str_extract(filename, "Group[:punct:][0-9][:punct:][A-Z]"),
#'         Group = str_replace(Group, "Group_", "")) %>%
#'  unite(filename, c("Timepoint", "Group")) %>%
#'  select(ends_with("-A"), -`FSC-A`, filename) %>%
#'  dplyr::rename(`FoxP3` = "APC-A",
#'                `CD44` = "APC-Fire 750-A",
#'                `CD103` =  "APC-R700-A",
#'                `CD3` = "Alexa Fluor 532-A",
#'                `Sca1` = "BB515-A",
#'                `IL_10` = "BV421-A",
#'                `CD4` = "BV480-A",
#'                `CD69` = "BV510-A",
#'                `CD8` = "BV570-A",
#'                `CTLA4` = "BV605-A",
#'                `CD27` = "BV650-A",
#'                `CD153` = "BV711-A",
#'                `KLRG1` = "BV785-A",
#'                `IL_17` = "PE-A",
#'                `CD122` = "PE-Cy5-A",
#'                `IFN` = "PE-Cy7-A",
#'                `CD62L` = "PE-Dazzle594-A",
#'                `TNF` = "Pacific Blue-A",
#'                `CD28` = "PE-Cy5.5-A",
#'                `PD1` = "PerCP-eFluor 710-A") %>%
#'  dplyr::filter(`SSC-A` != max(`SSC-A`)) %>%
#'  mutate(CD3 = fe(add_quantile, CD3, "CD3"),
#'         CD4 = fe(add_quantile, CD4, "CD4"),
#'         CD8 = fe(add_quantile, CD8, "CD8"),
#'         CD44 = fe(add_quantile, CD44, "CD44"),
#'         CD103 = fe(add_quantile, CD103, "CD103"),
#'         Sca1 = fe(add_quantile, Sca1, "Sca1"),
#'         IL_17 = fe(add_quantile,IL_17, "IL_17"),
#'         CD69 = fe(add_quantile,CD69, "CD69"),
#'         CTLA4 = fe(add_quantile,CTLA4, "CTLA4"),
#'         CD27 = fe(add_quantile,CD27, "CD27"),
#'         CD153 = fe(add_quantile,CD153, "CD153"),
#'         KLRG1 = fe(add_quantile,KLRG1, "KLRG1"),
#'         IFN = fe(add_quantile,IFN, "IFN"),
#'         FoxP3 = fe(add_quantile,FoxP3, "FoxP3"),
#'         CD122 = fe(add_quantile,CD122, "CD122"),
#'         PD1 = fe(add_quantile,PD1, "PD1"),
#'         CD62L = fe(add_quantile,CD62L, "CD62L"),
#'         IL_10 = fe(add_quantile,IL_10, "IL_10"),
#'         CD28 = fe(add_quantile,CD28, "CD28"),
#'         TNF = fe(add_quantile,TNF, "TNF")) %>%
#'  select(-`Zombie Nir-A`, -`AF-A`, -`SSC-A`, -FoxP3, -CD69) %>%
#'  count_calc()
#'
#' @importFrom dplyr %>%
#' @importFrom rlang .data
#'
count_calc <- function(df) {

  total_count_by_file <- percentage <- NULL

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
