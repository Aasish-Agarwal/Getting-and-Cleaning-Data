## Globals
library(reshape2)
library(plyr)
library(data.table)
## URL for data
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

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
  ## Download & uncompress data
  getdata()
## ###################################################
  
## Execution ####################################
  
  ## Routines

  ## Merges the training and the test sets to create one data set.
  step1 <- function() {
    cat ("Executing Step 1:\n")

    cat ("\tReading Training Data Set From: \"", datadir , "/train/X_train.txt\"\n", sep = "")
    training_data <<- read.table(paste(datadir,"train","X_train.txt",sep = "/"), colClasses = "character")

    cat ("\tReading Test Data Set From: \"", datadir , "/test/X_test.txt\"\n" , sep = "")
    test_data <<- read.table(paste(datadir,"test","X_test.txt", sep = "/"), colClasses = "character")

    cat ("\tCombining Training & Test Data")
    combined_data <<- rbind(training_data, test_data)

    cat("\ttraining_data row count:", nrow(training_data), "\n")
    cat("\test_data row count:", nrow(test_data), "\n")
    cat("\tcombined_data row count:", nrow(combined_data), "\n")
  }

  # Extracts only the measurements on the mean and standard deviation for each measurement. 
  step2 <- function() {
    cat ("Executing Step 2:\n")
    subject_train <<- read.table(paste(datadir,"train","subject_train.txt",sep = "/"), colClasses = "character")
    subject_test <<- read.table(paste(datadir,"test","subject_test.txt",sep = "/"), colClasses = "character")
    subject <<- rbind(subject_train, subject_test)
    
    activity_train <<- read.table(paste(datadir,"train","y_train.txt",sep = "/"), colClasses = "character")
    activity_test <<- read.table(paste(datadir,"test","y_test.txt",sep = "/"), colClasses = "character")
    activity <<- rbind(activity_train, activity_test)
    
    names(subject) <<- c("Subject")
    names(activity) <<- c("ActivityId")
    
    activity_labels <<- read.table(paste(datadir,"activity_labels.txt",sep = "/"), colClasses = "character")
    features <<- read.table(paste(datadir,"features.txt",sep = "/"), colClasses = "character")
    
    names(activity_labels) <<- c("ActivityId", "Activity")
    names(features) <<- c("FeatureId","Feature" )
    
    activity1 <<- merge(activity,activity_labels)
    activity1 <<- cbind(subject,activity1$Activity)
    names(activity1) <<- c("Subject", "Activity")
    
    names(combined_data) <<- features$Feature
    
    colstoselect <<- features$Feature[grepl("mean\\(\\)|std\\(\\)", features$Feature)]
    
    combined_data_new <<- combined_data[,colstoselect]
    combined_data_new <<- cbind(activity1,combined_data_new)
    combined_data_new <<- melt(combined_data_new,id=c("Subject", "Activity"), measure.vars=colstoselect)
    combined_data_new <<- transform(combined_data_new,value = as.numeric(value))

    combined_data_new <<- data.table(combined_data_new)[,list(count=.N , average=mean(value)), by = c("Subject","Activity","variable")]
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
  #step1()
  step2()
  step3()
  step4()
  step5()
  
