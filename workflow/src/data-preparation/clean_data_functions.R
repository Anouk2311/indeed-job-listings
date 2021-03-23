### load packages
library(dplyr)
library(stringr)
library(tidyr)

### 1. load datasets into R ---------------------------------------------------
## 1.1 data scientist ---------------------------------------------------------
data_scientist <- read.csv('../../gen/data-preparation/temp/data_scientist_merged.csv',
                           header=TRUE, row.names = "X", sep = ',')

## 1.2 data analist -----------------------------------------------------------
data_analist <- read.csv('../../gen/data-preparation/temp/data_analist_merged.csv',
                         header=TRUE, row.names = "X", sep = ',')

## 1.3 marketing analist ------------------------------------------------------
marketing_analist <- read.csv('../../gen/data-preparation/temp/marketing_analist_merged.csv',
                              header=TRUE, row.names = "X", sep = ',')

## 1.4 marketeer --------------------------------------------------------------
marketeer <- read.csv('../../gen/data-preparation/temp/marketeer_merged.csv',
                      header=TRUE, row.names = "X",  sep = ',')


### 2. define functions -------------------------------------------------------
# the main problem with our dataset is duplicate entries and inconsistent location names, 
# such as Netherlands as a whole as location for a job, 
# or Amsterdam-Noord, which is seen as a different location than Amsterdam.

## 2.1 remove duplicates ------------------------------------------------------
remove_duplicates <- function(dataset) {
  dataset <- dataset %>%
    distinct(id, .keep_all = TRUE)
}

## 2.2 remove dirty location strings ------------------------------------------
words_to_remove <- c("-Zuidoost","oost" ,"Centrum", "noord", "zuid", "Zuid", "Noord",
                     "Binnenstad", "-Zuid", "-Noord", "", "west", "wijk") 

remove_dirty_location <- function(dataset) {
  dataset <- dataset %>%
    mutate(location_trimmed = str_remove_all(location,
                                             regex(str_c(words_to_remove, collapse = '|'),
                                                   ignore_case = T)))
}

## 2.3 replace dirty location strings -----------------------------------------
replace_dirty_location <- function(dataset) {
  dataset <- dataset %>%
    mutate(location_trimmed = str_replace_all(location_trimmed, "Holland-", "Rotterdam")) %>% 
    mutate(location_trimmed = str_replace_all(location_trimmed, "Amsterdam ", "Amsterdam")) %>% 
    mutate(location_trimmed = str_replace_all(location_trimmed, "Schiphol", "Amsterdam")) %>% 
    mutate(location_trimmed = str_replace_all(location_trimmed, "Randstad", "Amsterdam")) %>% 
    mutate(location_trimmed = str_replace_all(location_trimmed, "Nederland" | "Werk van thuis", "Remote")) %>% 
    mutate(location_trimmed = str_replace_all(location_trimmed, "Utrecht ", "Utrecht"))
}


### 3. apply functions for cleaning -------------------------------------------
# PROTOTYPE
# maybe even this in one function?
datasets <- list(data_scientist, data_analist, marketing_analist, marketeer)

for(dataset in datasets) {
  remove_duplicates(dataset)
  remove_dirty_location(dataset)
  replace_dirty_location(dataset)
}
  

## 3.1 data scientist ---------------------------------------------------------
remove_duplicates(data_scientist)
remove_dirty_location(data_scientist)
replace_dirty_location(data_scientist)

## 3.2 data analist -----------------------------------------------------------
remove_duplicates(data_analist)
remove_dirty_location(data_analist)
replace_dirty_location(data_analist)

## 3.3 marketing analist ------------------------------------------------------
remove_duplicates(marketing_analist)
remove_dirty_location(marketing_analist)
replace_dirty_location(marketing_analist)

## 3.4 marketeer -------------------------------------------------------------
remove_duplicates(marketeer)
remove_dirty_location(marketeer)
replace_dirty_location(marketeer)


### 4. save cleaned data ------------------------------------------------------
# create directories
dir.create('../../gen')
dir.create('../../gen/data-preparation')
dir.create('../../gen/data-preparation/output')

## 4.1 data scientist ---------------------------------------------------------
write.csv(data_scientist, '../../gen/data-preparation/output/data_scientist_clean.csv')

## 4.2 data analist -----------------------------------------------------------
write.csv(data_analist, '../../gen/data-preparation/output/data_analist_clean.csv')

## 4.3 marketing analist ------------------------------------------------------
write.csv(marketing_analist, '../../gen/data-preparation/output/marketing_analist_clean.csv')

## 4.4 marketeer --------------------------------------------------------------
write.csv(marketeer, '../../gen/data-preparation/output/marketeer_clean.csv')

