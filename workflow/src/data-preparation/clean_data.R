### load packages
library(dplyr)
library(stringr)
library(tidyr)
library(ggplot2)

### 1. load datasets into R ---------------------------------------------------
## 1.1 data scientist ---------------------------------------------------------
data_scientist <- read.csv('../../gen/data-preparation/temp/data_scientist_merged.csv', header=TRUE, row.names = "X", sep = ',')

## 1.2 data analist -----------------------------------------------------------
data_analist <- read.csv('../../gen/data-preparation/temp/data_analist_merged.csv', header=TRUE, row.names = "X", sep = ',')

## 1.3 marketing analist ------------------------------------------------------
marketing_analist <- read.csv('../../gen/data-preparation/temp/marketing_analist_merged.csv', header=TRUE, row.names = "X", sep = ',')

## 1.4 marketeer --------------------------------------------------------------
marketeer <- read.csv('../../gen/data-preparation/temp/marketeer_merged.csv', header=TRUE, row.names = "X",  sep = ',')


### 2. clean data ------------------------------------------------------------
## 2.1 data scientist ---------------------------------------------------------
# 2.1.1 clean salary column, which has either hourly, monthly or yearly values.
# Convert values into yearly salary based on the number of working hours in a year for an average job
# Note: in many instances, the salary is given as a range.
# The new output will represent the lower bound of this range: min_salary

df_ds <- data_scientist %>% 
  mutate(salary1 = str_remove_all(salary, '[^0-9-,â,¬]+')) %>% 
  separate(salary1, into = c('salary1', 'salary2'), 
           convert = TRUE, extra = 'drop') %>%
  mutate(across(c(salary1, salary2),
                ~ case_when(str_detect(salary, "per maand") ~ . * 12, 
                            str_detect(salary, 'per uur') ~ . * 40 * 4 * 12, 
                            nchar(.) < 5 ~ as.numeric(str_pad(., pad = '0', 
                                                              side = 'right', width = 5)),
                            TRUE ~ as.numeric(.)))) %>% 
  transmute(min_salary = rowMeans(select(., salary1, salary2), na.rm = TRUE))

# join the two data frames
data_scientist <- cbind(data_scientist, df_ds)

# 2.1.2 discard the column X.1 as it is a duplicate of the index column 
data_scientist$X.1 <- NULL

# 2.1.3 remove duplicates
data_scientist <- data_scientist %>% distinct(id, .keep_all = TRUE)

# 2.1.4 clean inconsistent location names
# such as Netherlands as a whole as location for a job,
# or Amsterdam-Noord, which is seen as a different location than Amsterdam

#remove dirty location strings
words_to_remove <- c("-Zuidoost", "Centrum", "noord", "zuid", "Zuid", "Noord", "Binnenstad", "-Zuid", "-Noord", "") 
df_ds <- data_scientist %>%
  mutate(location_trimmed = str_remove_all(location, regex(str_c(words_to_remove, collapse = '|'), ignore_case = T)))

#replace to general locations with biggest city of area 
df_ds <- df_ds %>%
  mutate(location_trimmed = str_replace_all(location_trimmed, "Holland-", "Rotterdam"))

#replace all amsterdam strings with an extra space
df_ds <- df_ds %>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Amsterdam ", "Amsterdam"))

df_ds <- df_ds %>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Schiphol", "Amsterdam"))

df_ds <- df_ds %>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Randstad", "Amsterdam"))

df_ds <- df_ds %>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Nederland", "Amsterdam"))


## 2.2 data analist -----------------------------------------------------------
# 2.2.1 clean salary column, which has either hourly, monthly or yearly values.
# Convert values into yearly salary based on the number of working hours in a year for an average job
# Note: in many instances, the salary is given as a range.
# The new output will represent the lower bound of this range: min_salary

df_da <- data_analist %>% 
  mutate(salary1 = str_remove_all(salary, '[^0-9-,â,¬]+')) %>% 
  separate(salary1, into = c('salary1', 'salary2'), 
           convert = TRUE, extra = 'drop') %>%
  mutate(across(c(salary1, salary2),
                ~ case_when(str_detect(salary, "per maand") ~ . * 12, 
                            str_detect(salary, 'per uur') ~ . * 40 * 4 * 12, 
                            nchar(.) < 5 ~ as.numeric(str_pad(., pad = '0', 
                                                              side = 'right', width = 5)),
                            TRUE ~ as.numeric(.)))) %>% 
  transmute(min_salary = rowMeans(select(., salary1, salary2), na.rm = TRUE))

# join the two data frames
data_analist <- cbind(data_analist, df_da)

# 2.2.2 discard the column X.1 as it is a duplicate of the index column 
data_analist$X.1 <- NULL

# 2.2.3 remove duplicates
data_analist <- data_analist %>% distinct(id, .keep_all = TRUE)

# 2.2.4 clean inconsistent location names
# such as Netherlands as a whole as location for a job,
# or Amsterdam-Noord, which is seen as a different location than Amsterdam

#remove dirty location strings
words_to_remove <- c("-Zuidoost", "Centrum", "noord", "zuid", "Zuid", "Noord", "Binnenstad", "-Zuid", "-Noord", "") 
df_da <- data_analist %>%
  mutate(location_trimmed = str_remove_all(location, regex(str_c(words_to_remove, collapse = '|'), ignore_case = T)))

#replace to general locations with biggest city of area
df_da <- df_da %>%
  mutate(location_trimmed = str_replace_all(location_trimmed, "Holland-", "Rotterdam"))

#replace all amsterdam strings with an extra space
df_da <- df_da %>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Amsterdam ", "Amsterdam"))

df_da <- df_da %>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Schiphol", "Amsterdam"))

df_da <- df_da %>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Randstad", "Amsterdam"))

df_da <- df_da %>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Nederland", "Amsterdam"))


## 2.3 marketing analist ------------------------------------------------------
# 2.3.1 clean salary column, which has either hourly, monthly or yearly values. 
# Convert values into yearly salary based on the number of working hours in a year for an average job
# Note: in many instances, the salary is given as a range. 
# The new output will represent the lower bound of this range: min_salary

df_ma <- marketing_analist %>% 
  mutate(salary1 = str_remove_all(salary, '[^0-9-,â,¬]+')) %>% 
  separate(salary1, into = c('salary1', 'salary2'), 
           convert = TRUE, extra = 'drop') %>%
  mutate(across(c(salary1, salary2),
                ~ case_when(str_detect(salary, "per maand") ~ . * 12, 
                            str_detect(salary, 'per uur') ~ . * 40 * 4 * 12, 
                            nchar(.) < 5 ~ as.numeric(str_pad(., pad = '0', 
                                                              side = 'right', width = 5)),
                            TRUE ~ as.numeric(.)))) %>% 
  transmute(min_salary = rowMeans(select(., salary1, salary2), na.rm = TRUE))

# join the two data frames
marketing_analist <- cbind(marketing_analist, df_ma)

# 2.3.2 discard the column X.1 as it is a duplicate of the index column 
marketing_analist$X.1 <- NULL

# 2.3.3 remove duplicates
marketing_analist <- marketing_analist %>% distinct(id, .keep_all = TRUE)

# 2.3.4 clean inconsistent location names
# such as Netherlands as a whole as location for a job,
# or Amsterdam-Noord, which is seen as a different location than Amsterdam

#remove dirty location strings
words_to_remove <- c("-Zuidoost", "Centrum", "noord", "zuid", "Zuid", "Noord", "Binnenstad", "-Zuid", "-Noord", "") 
df_ma <- marketing_analist %>%
  mutate(location_trimmed = str_remove_all(location, regex(str_c(words_to_remove, collapse = '|'), ignore_case = T)))

#replace to general locations with biggest city of area 
df_ma <- df_ma %>%
  mutate(location_trimmed = str_replace_all(location_trimmed, "Holland-", "Rotterdam"))

#replace all amsterdam strings with an extra space
df_ma <- df_ma %>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Amsterdam ", "Amsterdam"))

df_ma <- df_ma %>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Schiphol", "Amsterdam"))

df_ma <- df_ma %>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Randstad", "Amsterdam"))

df_ma <- df_ma %>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Nederland", "Amsterdam"))


## 2.4 marketeer --------------------------------------------------------------
# 2.4.1 clean salary column, which has either hourly, monthly or yearly values.
# Convert values into yearly salary based on the number of working hours in a year for an average job
# Note: in many instances, the salary is given as a range.
# The new output will represent the lower bound of this range: min_salary

df_m <- marketeer %>% 
  mutate(salary1 = str_remove_all(salary, '[^0-9-,â,¬]+')) %>% 
  separate(salary1, into = c('salary1', 'salary2'), 
           convert = TRUE, extra = 'drop') %>%
  mutate(across(c(salary1, salary2),
                ~ case_when(str_detect(salary, "per maand") ~ . * 12, 
                            str_detect(salary, 'per uur') ~ . * 40 * 4 * 12, 
                            nchar(.) < 5 ~ as.numeric(str_pad(., pad = '0', 
                                                              side = 'right', width = 5)),
                            TRUE ~ as.numeric(.)))) %>% 
  transmute(min_salary = rowMeans(select(., salary1, salary2), na.rm = TRUE))

# join the two data frames
marketeer <- cbind(marketeer, df_m)

# 2.4.2 discard the column X.1 as it is a duplicate of the index column 
marketeer$X.1 <- NULL

# 2.4.3 remove duplicates
marketeer <- marketeer %>% distinct(id, .keep_all = TRUE)

# 2.4.4 clean inconsistent location names
# such as Netherlands as a whole as location for a job,
# or Amsterdam-Noord, which is seen as a different location than Amsterdam

#removing dirty location strings
words_to_remove <- c("-Zuidoost", "Centrum", "noord", "zuid", "Zuid", "Noord", "Binnenstad", "-Zuid", "-Noord", "") 
df_m <- marketeer %>%
  mutate(location_trimmed = str_remove_all(location, regex(str_c(words_to_remove, collapse = '|'), ignore_case = T)))

#replace to general locations with biggest city of area
df_m <- df_m %>%
  mutate(location_trimmed = str_replace_all(location_trimmed, "Holland-", "Rotterdam"))

#replace all amsterdam strings with an extra space
df_m <- df_m %>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Amsterdam ", "Amsterdam"))

df_m <- df_m %>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Schiphol", "Amsterdam"))

df_m <- df_m %>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Randstad", "Amsterdam"))

df_m <- df_m %>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Nederland", "Amsterdam"))


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