#' @title Fetch UK Biobank bulk data files
#'
#' @param participant_ID list of subject IDs for which
#'   we want to download bulk imaging files
#' @param data_ID list of data IDs to be retrieved
#' @param auth provide optional key file (in case .ukbkey
#'   is not present)
#' @param verbose should the output be verbose?
#' @param run_local download the files
#' @param create_batch create a batch file to be used
#'   within a terminal
#'
ukbfetch = function (participant_ID,
                     data_ID,
                     auth,
                     verbose = FALSE,
                     run_local = TRUE,
                     create_batch = TRUE)
{

}
