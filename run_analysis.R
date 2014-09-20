## Globals
  ## URL for data
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

  ## Working directory name
  work_dir <- "cleaning_data_project"

  ## Extracted Directory
  datadir <- "UCI HAR Dataset"
  
  ## Uncompression utility
  uncompress_util <- "unzip"
  uncompress_opt <- "-x"

  
  
## Service Routines ###################################################
  ## Routine to uncompress a file
  uncompress_downloaded_data <- function(zipfile) {
    cmd <- paste(uncompress_util, uncompress_opt, zipfile)
    system(cmd)
  }
  
  ## Download & Un Compress test data set
  getdata <- function() {
    cat("Function Called: getdata()\n")
    zipped <- "testdata.zip"
    if (!file.exists(zipped)) {
      cat("\tDownloding ", zipped , "\n")
      download.file(url, zipped)
    }
    
    if (!file.exists(datadir)) {
      cat("\tUncompressing ", zipped , "\n")
      uncompress_downloaded_data(zipped)
    } else {
      cat("\tAlready Un Compressed ", zipped , "\n")
    }
  }

## ###################################################
  
## INITIALIZATION ####################################
  ## Record working directory
  ## Create & move to working directory
  ## Download & uncompress data
  
  ## Record working directory
  base_dir <- getwd()
  cat ("Started in directory: " ,getwd(), "\n")

  ## Create & move to the working directory
  if (!file.exists(work_dir)) {dir.create(work_dir)}
  setwd(work_dir)
  cat ("Changed to directory: " ,getwd() , "\n")
  
  ## Download & uncompress data
  getdata()
## ###################################################
  


## FINALIZATION ####################################
  ## Revert to the original working directory

  setwd(base_dir)
  cat ("Switched back to directory: " ,getwd(), "\n")
## ###################################################
  