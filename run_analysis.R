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
  
## Execution ####################################
  
  ## Routines

  ## Merges the training and the test sets to create one data set.
  step1 <- function() {
    cat ("Executing Step 1:\n")
    cat ("\tReading Test Data Set From: \"", datadir , "/test/X_test.txt\"\n" , sep = "")
    cat ("\tReading Training Data Set From: \"", datadir , "/train/X_train.txt\"\n", sep = "")
    
    # datadir
    # alldata <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    # 'train/X_train.txt': Training set.
    # 'test/X_test.txt': Test set.
    
    
  }

  step2 <- function() {
    cat ("Executing Step 2:\n")
  }
  step3 <- function() {
    cat ("Executing Step 3:\n")
  }
  step4 <- function() {
    cat ("Executing Step 4:\n")
  }
  step5 <- function() {
    cat ("Executing Step 5:\n")
  }
  
  
  
  ## Calls
  step1()
  step2()
  step3()
  step4()
  step5()
  
## ###################################################
  
  

## FINALIZATION ####################################
  ## Revert to the original working directory

  setwd(base_dir)
  cat ("Switched back to directory: " ,getwd(), "\n")
## ###################################################
  