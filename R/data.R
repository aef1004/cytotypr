#' A FlowSet containing all of the samples and measured data
#'
#' @format A flowSet with 25 experiments (samples) containing all of the measured data:
#' \describe{
#'   \item{SSC-A}{ numeric: the sidescatter, or complexity, of each cell}
#'   \item{filename}{ character: the name of the FMO sample from which the data comes}
#'   \item{IL_10}{ numeric: the MFI expression of IL-10 for each cell}
#'   \item{TNF}{ numeric: the MFI expression of TNF for each cell}
#'   \item{CD4}{ numeric: the MFI expression of CD4 for each cell}
#'   \item{CD69}{ numeric: the MFI expression of CD69 for each cell}
#'   \item{CD8}{ numeric: the MFI expression of CD8 for each cell}
#'   ...
#' }
"flowset_FMO_gated_data"

#' A dataframe containing all of the samples and measured data
#'
#' @format A dataframe containing all of the measured data:
#' \describe{
#'   \item{SSC-A}{ numeric: the sidescatter, or complexity, of each cell}
#'   \item{filename}{ character: the name of the FMO sample from which the data comes}
#'   \item{IL_10}{ numeric: the MFI expression of IL-10 for each cell}
#'   \item{TNF}{ numeric: the MFI expression of TNF for each cell}
#'   \item{CD4}{ numeric: the MFI expression of CD4 for each cell}
#'   \item{CD69}{ numeric: the MFI expression of CD69 for each cell}
#'   \item{CD8}{ numeric: the MFI expression of CD8 for each cell}
#'   ...
#' }
"df_FMO_gated_data"



#' A dataset containing the matched FMO markers to the FMO samples
#'
#' @format A data frame with 415,544 rows and 4 variables:
#' \describe{
#'   \item{SSC-A}{ numeric: the sidescatter used to plot the FMO data}
#'   \item{filename}{ character: the name of the FMO sample from which the data comes}
#'   \item{marker}{ character: the name of the marker of interest that matches up with the name of the FMO sample}
#'   \item{MFI}{ numeric: mean fluorescent intensity data for each FMO sample in the specific marker channel}
#'   ...
#' }
"FMO_filtered_data"



#' A dataset containing the cutoff value between negative and positive populations for each marker
#'
#' @format A data frame with 20 rows and 2 variables:
#' \describe{
#'   \item{filename}{ character: the name of the marker for each cutoff}
#'   \item{quantile_99}{ numeric: the corresponding MFI value which is the cutoff between positive and negative populations for a particular marker}
#'   ...
#' }
"add_quantile"


#' A dataset containing all of the filtered FMO data
#'
#' @format A flowSet with 415,544 rows that represent each cell in the FMO samples and 24 variables which show the different markers:
#' \describe{
#'   \item{Time}{the relative time at which each cell event was recorded}
#'   \item{SSC-H}{the MFI expression for the Side Scatter (complexity) Height for each cell}
#'   \item{SSC-A}{the MFI expression for the Side Scatter (complexity) Area for each cell}
#'   \item{FSC-H}{the MFI expression for the Forward Scatter (size) Height for each cell}
#'   \item{FSC-A}{the MFI expression for the Forward Scatter (size) Area for each cell}
#'   \item{BV421-A}{the MFI expression in the BV421-A channel for each cell}
#'   \item{Pacific Blue-A}{the MFI expression Pacific Blue-A channel for each cell}
#'   \item{BV480-A}{the MFI expression BV480-A channel  for each cell}
#'   ...
#' }
"gated_data"



#' A dataset containing all of the sample data
#'
#' @format A data frame with 1,056,969 rows and 28 variables:
#' \describe{
#'   \item{AF-A}{ numeric: the MFI expression for the Autofluorescence Area for each cell}
#'   \item{APC-A}{ numeric: the MFI expression in the APC-A channel for each cell}
#'   \item{filename}{ character: the sample name from which each data point originates}
#'   \item{Time}{ numeric: the relative time at which each cell event was recorded}
#'   \item{SSC-H}{ numeric: the MFI expression for the Side Scatter (complexity) Height for each cell}
#'   \item{SSC-A}{ numeric: the MFI expression for the Side Scatter (complexity) Area for each cell}
#'   \item{FSC-H}{ numeric: the MFI expression for the Forward Scatter (size) Height for each cell}
#'   \item{FSC-A}{ numeric: the MFI expression for the Forward Scatter (size) Area for each cell}
#'   \item{BV421-A}{ numeric: the MFI expression in the BV421-A channel for each cell}
#'   \item{Pacific Blue-A}{ numeric: the MFI expression Pacific Blue-A channel for each cell}
#'   \item{BV480-A}{ numeric: the MFI expression BV480-A channel  for each cell}
#'   ...
#' }
"df_all_gated"

#' A dataset containing the feature engineered data
#'
#' @format A dataframe with 37,143 rows and 22 variables:
#' \describe{
#'   \item{IL_10}{ factor: the positive (1) or negative (0) expression of IL-10 in a cell}
#'   \item{TNF}{ factor: the positive (1) or negative (0) expression of TNF in a cell}
#'   \item{CD4}{ factor: the positive (1) or negative (0) expression of CD4 in a cell}
#'   \item{CD8}{ factor: the positive (1) or negative (0) expression of CD8 in a cell}
#'   \item{filename}{ character: the sample name from which each data point originates}
#'   \item{cell_no}{ numeric: the number of cells with the particular phenotype listed in the markers}
#'   \item{total_count_by_file}{ numeric: the total number of cells in each sample}
#'   \item{percentage}{ numeric: the percentage of cells with a particular phenotype listed in the markers}
#'   ...
#' }
"all_fe"
