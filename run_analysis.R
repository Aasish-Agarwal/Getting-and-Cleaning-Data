# This is a wrapper script that executes a R markdown file course_project.rmd
# course_project.rmd contains the execution steps and description for each step for the project
require(knitr)
require(markdown)

# Change the working directory according to your work environment 
setwd("D:\\dev\\datascience\\gncdata")

# knit function will execute the instructions in course_project.rmd
# Output will be available in course_project.md
# Script will also generate a tidy data file human_activity_recognition.txt
knit("course_project.rmd", encoding="ISO8859-1")

