### load packages

library(dplyr)
library(stringr)
library(tidyr)
library(ggplot2)
library(reshape2)
### 1. load datasets into R ---------------------------------------------------
## 1.1 data scientist ---------------------------------------------------------
data_scientist <- read.csv('../../gen/data-preparation/temp/data_scientist_merged.csv', header=TRUE, row.names = "X", sep = ',')

## 1.2 data analist -----------------------------------------------------------
data_analist <- read.csv('../../gen/data-preparation/temp/data_analist_merged.csv', header=TRUE, row.names = "X", sep = ',')

## 1.3 marketing analist ------------------------------------------------------
marketing_analist <- read.csv('../../gen/data-preparation/temp/marketing_analist_merged.csv', header=TRUE, row.names = "X", sep = ',')

## 1.4 marketeer --------------------------------------------------------------
marketeer <- read.csv('../../gen/data-preparation/temp/marketeer_merged.csv', header=TRUE, row.names = "X",  sep = ',')

# the main problem with our dataset is duplicate entries and inconsistent location names, 
#such as Netherlands as a whole as location for a job, 
#or Amsterdam-Noord, which is seen as a different location than Amsterdam. 

#first remove duplicates
#removing duplicates

data_scientist <- data_scientist %>% distinct(id, .keep_all = TRUE)

#removing dirty location strings
words_to_remove <- c("-Zuidoost","oost" ,"Centrum", "noord", "zuid", "Zuid", "Noord", "Binnenstad", "-Zuid", "-Noord", "", "west", "wijk") 
df_ds <- data_scientist %>%
  mutate(location_trimmed = str_remove_all(location, regex(str_c(words_to_remove, collapse = '|'), ignore_case = T)))

#replace dirty location strings
df_ds <- df_ds %>%
  mutate(location_trimmed = str_replace_all(location_trimmed, "Holland-", "Rotterdam"))%>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Amsterdam ", "Amsterdam"))%>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Schiphol", "Amsterdam"))%>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Randstad", "Amsterdam"))%>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Nederland" | "Werk van thuis", "Remote"))%>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Utrecht ", "Utrecht"))

#cleaning steps for data analist dataset

data_analist <- data_analist %>% distinct(id, .keep_all = TRUE)

#removing dirty location strings
words_to_remove <- c("-Zuidoost","oost",  "Centrum", "noord", "zuid", "Zuid", "Noord", "Binnenstad", "-Zuid", "-Noord", "", "west", "wijk") 
df_da <- data_analist %>%
  mutate(location_trimmed = str_remove_all(location, regex(str_c(words_to_remove, collapse = '|'), ignore_case = T)))
#replacing dirty location strings
df_da <- df_da %>%
  mutate(location_trimmed = str_replace_all(location_trimmed, "Holland-", "Rotterdam"))%>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Amsterdam ", "Amsterdam"))%>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Schiphol", "Amsterdam"))%>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Randstad", "Amsterdam"))%>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Nederland" | "Werk van thuis", "Remote"))%>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Utrecht ", "Utrecht"))



#cleaning marketing analist dataset

marketing_analist <- marketing_analist %>% distinct(id, .keep_all = TRUE)

#removing dirty location strings
words_to_remove <- c("-Zuidoost","oost" , "Centrum", "noord", "zuid", "Zuid", "Noord", "Binnenstad", "-Zuid", "-Noord", "",  "west", "wijk") 
df_ma <- marketing_analist %>%
  mutate(location_trimmed = str_remove_all(location, regex(str_c(words_to_remove, collapse = '|'), ignore_case = T)))

#replace dirty location strings
df_ma <- df_ma %>%
  mutate(location_trimmed = str_replace_all(location_trimmed, "Holland-", "Rotterdam"))%>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Amsterdam ", "Amsterdam"))%>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Schiphol", "Amsterdam"))%>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Randstad", "Amsterdam"))%>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Nederland" | "Werk van thuis", "Remote"))%>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Utrecht ", "Utrecht"))


#cleaning marketeer dataset

marketeer <- marketeer %>% distinct(id, .keep_all = TRUE)

#removing dirty location strings
words_to_remove <- c("-Zuidoost","oost", "Centrum", "noord", "zuid", "Zuid", "Noord", "Binnenstad", "-Zuid", "-Noord", "", "west", "wijk") 
df_m <- marketeer %>%
  mutate(location_trimmed = str_remove_all(location, regex(str_c(words_to_remove, collapse = '|'), ignore_case = T)))

#replace dirty location strings
df_m <- df_m %>%
  mutate(location_trimmed = str_replace_all(location_trimmed, "Holland-", "Rotterdam"))%>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Amsterdam ", "Amsterdam"))%>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Schiphol", "Amsterdam"))%>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Randstad", "Amsterdam"))%>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Nederland" | "Werk van thuis", "Remote"))%>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Utrecht ", "Utrecht"))



### 3. save cleaned data -----------------------------------------------------
# create directories
dir.create('../../gen')
dir.create('../../gen/data-preparation')
dir.create('../../gen/data-preparation/output')

## 3.1 data scientist ---------------------------------------------------------
write.csv(df_ds, '../../gen/data-preparation/output/data_scientist_clean.csv')

## 3.2 data analist -----------------------------------------------------------
write.csv(df_da, '../../gen/data-preparation/output/data_analist_clean.csv')

## 3.3 marketing analist ------------------------------------------------------
write.csv(df_ma, '../../gen/data-preparation/output/marketing_analist_clean.csv')

## 3.4 marketeer --------------------------------------------------------------
write.csv(df_m, '../../gen/data-preparation/output/marketeer_clean.csv')

