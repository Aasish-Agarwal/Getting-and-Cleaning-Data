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

  
  
## Service Routines
  uncompress_downloaded_data <- function(zipfile) {
    cmd <- paste(uncompress_util, uncompress_opt, zipfile)
    system(cmd)
  }
  
  
  
## Get currnet working directory
base_dir <- getwd()
cat ("Started in directory: " ,getwd(), "\n")

## Create & move to the working directory
if (!file.exists(work_dir)) {dir.create(work_dir)}
setwd(work_dir)
cat ("Changed to directory: " ,getwd() , "\n")

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
    cat("\tAlready Compressed ", zipped , "\n")
  }
  
  
}

getdata()



## Revert to the original working directory
setwd(base_dir)
cat ("Switched back to directory: " ,getwd(), "\n")
