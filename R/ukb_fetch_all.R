#' @title Create batch fetch file for all non NA values
#'
#' @description Will create a batch download file to be used
#'   with ukbfetch to download all NA entries from a specific
#'   UKB data type (eg. Functional brain images - task - NIFTI)
#'
#' @param ubk_data the UK Biobank dataframe
#' @param column_identifier the column identifier, this can be
#'   a column number, the UDI (Unique Data Identifier) or the
#'   column name (description)
#'
ukb_fetch_all = function (ukb_data,
                          column_identifier)
{

  if(is.numeric(column_identifier))
  {
    column_identifier <- colnames(ukb_data)[column_identifier+1]
  }

  else if(grepl("^\\d+\\-\\d+\\.\\d+",column_identifier))
  {
    column_identifier <- gsub('\\-','_',column_identifier)
    column_identifier <- paste0("f",gsub('\\.','_',column_identifier))
    column_identifier <- grep(column_identifier,names(ukb_data), value=TRUE)
  }

  return(column_identifier)

  #head(ukb_data[column_identifier+1])
}
