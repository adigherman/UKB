#' @title Create batch fetch file for all non NA values
#'
#' @description Will create a batch download file to be used
#'   with ukbfetch to download all NA entries from a specific
#'   UKB data type (eg. Functional brain images - task - NIFTI)
#'
#' @param ukb_data the UK Biobank dataframe
#' @param column_identifier the column identifier, this can be
#'   a column number, the UDI (Unique Data Identifier) or the
#'   column name (description)
#' @param gender subject's gender (0 - female / 1 - male) (sex_f31_0_0)
#' @param path location where the batch file will be saved
#'
#' @importFrom stringr str_extract
#' @importFrom utils write.table
#'
#' @export
ukb_fetch_all = function (ukb_data,
                          column_identifier,
                          gender = NULL,
                          path = ".")
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

  if(!is.null(gender))
  {
    existing_values <- which(!is.na(ukb_data[column_identifier]) & ukb_data["sex_f31_0_0"] == gender)
  }
  else
  {
    existing_values <- which(!is.na(ukb_data[column_identifier]))
  }

  participant_IDs <- ukb_data$eid[existing_values]

  UDI <- str_extract(column_identifier,"\\d+\\_\\d+\\_\\d+$")

  results <- data.frame(cbind(participant_IDs))

  #return(existing_values)
  results[,"UDI"] <- UDI

  write.table(results,file=file.path(path,paste0(UDI,".txt")), quote = FALSE, row.names=FALSE, col.names = FALSE)

}
