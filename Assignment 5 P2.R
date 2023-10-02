#Assignment 5 
# Problem 2 ----

# Loading packages
library(tidyverse)

#Reading the datafile
raw_file <- readLines(con = "suites_dw_Table1.txt", warn = FALSE)
raw_file

# Finding out which line starts with "--"
L <- 
  (substr(x = raw_file, start = 1, stop = 2) == "--") %>% 
  which() %>% 
  min()

# Saving the variable descriptions in a seperate text-file
cat(raw_file[1:12], sep = "\n", file = "variable_descriptions.txt")

#Splitting the string in raw_data[13] by the character "|", 
# and trimming away all the leading and trailing white spaces
variable_names <- 
  str_split(string = raw_file[13], pattern = "\\|") %>% 
  unlist() %>% 
  str_trim()
variable_names


