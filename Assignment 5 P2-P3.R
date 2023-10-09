<<<<<<< HEAD
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

# Separating the values in the dataset with "," 
comma_separated_values <- 
  raw_file[L+1:796] %>% 
  gsub("\\|", ",", .) %>% 
  gsub(" ", "", .)

# Adding the variable names 
comma_separated_values_with_names <- 
  c(paste(variable_names, collapse = ","),
    comma_separated_values)

# Creating a new CSV file
cat(comma_separated_values_with_names, sep = "\n", file = "galaxies.csv") 

# Reading the file back as a normal csv-file
galaxies <- read_csv("galaxies.csv")


# Problem 3 ----

# Creating a plot showing distribution of Galaxy Diameter.

galaxies %>% 
  ggplot(aes(x = a_26)) +
  geom_histogram(binwidth = 0.2, fill = "blue", color = "black", alpha = 0.7) + 
  labs(title = "Distribution of Galaxy Diameter",
       x = "Diameter (kpc)", 
       y = "Number of Galaxies") +
  theme_minimal()
=======
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

# Separating the values in the dataset with "," 
comma_separated_values <- 
  raw_file[L+1:796] %>% 
  gsub("\\|", ",", .) %>% 
  gsub(" ", "", .)

# Adding the variable names 
comma_separated_values_with_names <- 
  c(paste(variable_names, collapse = ","),
    comma_separated_values)

# Creating a new CSV file
cat(comma_separated_values_with_names, sep = "\n", file = "galaxies.csv") 

# Reading the file back as a normal csv-file
galaxies <- read_csv("galaxies.csv")


# Problem 3 ----

# Creating a plot showing distribution of Galaxy Diameter.

galaxies %>% 
  ggplot(aes(x = a_26)) +
  geom_histogram(binwidth = 0.2, fill = "blue", color = "black", alpha = 0.7) + 
  labs(title = "Distribution of Galaxy Diameter",
       x = "Diameter (kpc)", 
       y = "Number of Galaxies") +
  theme_minimal()
>>>>>>> a8b0e31d4c19d3bc6414c1e867bac9fa2e3cb821
