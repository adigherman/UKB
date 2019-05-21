#' @title Read in the UKB data
#'
#' @param fileset The prefix for a UKB fileset, e.g., ukbxxxx (for ukbxxxx.tab, ukbxxxx.r, ukbxxxx.html)
#' @param path The path to the directory containing your UKB fileset. The default value is the current directory.
#'
#' @importFrom ukbtools ukb_df
#'
#' @return UK Biobank set in a data.frame with usable column names
#' @export
ukb_read = function(fileset,
                    path = ".",
                    ...)
{
    ukb_data <- ukb_df(fileset, path, ...)

    return(ukb_data)
}
