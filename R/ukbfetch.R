#' @title Fetch UK Biobank bulk data files
#'
#' @param participant_ID list of subject IDs for which
#'   we want to download bulk imaging files
#' @param data_ID list of data IDs to be retrieved
#' @param tools_path provide location of the ukbfetch binary
#'   and also `auth_file` / .ukbkey file location
#' @param auth_file provide optional key file (in case .ukbkey
#'   is not present)
#' @param verbose should the output be verbose?
#' @param run_local download the files
#' @param create_batch create a batch file to be used
#'   within a terminal
#'
ukbfetch = function (participant_ID,
                     data_ID,
                     tools_path = "",
                     auth_file = NULL,
                     verbose = FALSE,
                     run_local = TRUE,
                     create_batch = TRUE)
{
  # ./ukbfetch -e1000446 -d20249_2_0 -ak33278.key -v

  # verify that the ukbfetch binary file is present either in the
  # current folder or in the tools_path folder (if provided)

  if(tools_path == "")
  {
    tools_path <- getwd()
  }

  if(!file.exists(file.path(tools_path,'ukbfetch')))
  {
    stop('ukbfetch binary file not found.')
  }

  #if auth is not set, check for .ukbkey file existence
  if(is.null(auth_file))
  {
    if(!file.exists('.ukbkey') && !file.exists(file.path(tools_path,'.ukbkey')))
    {
      stop('No auth file was specified and .ukbkey file was not found.')
    }
  }
  else
  {
    if(!file.exists(file.path(tools_path,auth_file)))
    {
      stop(paste0('Auth file ',auth_file,' not found'))
    }
  }

}
