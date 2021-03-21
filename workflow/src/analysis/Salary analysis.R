### 1. load datasets into R ---------------------------------------------------
## 1.1 data scientist ---------------------------------------------------------
data_scientist <- read.csv('../../gen/data-preparation/output/data_scientist_clean.csv', header=TRUE, row.names = "X", sep = ',')

## 1.2 data analist -----------------------------------------------------------
data_analist <- read.csv('../../gen/data-preparation/output/data_analist_clean.csv', header=TRUE, row.names = "X", sep = ',')

## 1.3 marketing analist ------------------------------------------------------
marketing_analist <- read.csv('../../gen/data-preparation/output/marketing_analist_clean.csv', header=TRUE, row.names = "X", sep = ',')

## 1.4 marketeer --------------------------------------------------------------
marketeer <- read.csv('../../gen/data-preparation/output/marketeer_clean.csv', header=TRUE, row.names = "X",  sep = ',')

## 2.1 data scientist ---------------------------------------------------------
# 2.1.1 clean salary column, which has either hourly, monthly or yearly values. Convert values into yearly salary based on the number of working hours in a year for an average job
# Note: in many instances, the salary is given as a range. The new output will represent the lower bound of this range: min_salary

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


## 2.2 data analist -----------------------------------------------------------
# 2.2.1 clean salary column, which has either hourly, monthly or yearly values. Convert values into yearly salary based on the number of working hours in a year for an average job
# Note: in many instances, the salary is given as a range. The new output will represent the lower bound of this range: min_salary

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


## 2.3 marketing analist ------------------------------------------------------
# 2.3.1 clean salary column, which has either hourly, monthly or yearly values. Convert values into yearly salary based on the number of working hours in a year for an average job
# Note: in many instances, the salary is given as a range. The new output will represent the lower bound of this range: min_salary

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


## 2.4 marketeer --------------------------------------------------------------
# 2.4.1 clean salary column, which has either hourly, monthly or yearly values. Convert values into yearly salary based on the number of working hours in a year for an average job
# Note: in many instances, the salary is given as a range. The new output will represent the lower bound of this range: min_salary

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


## 2.2 data analist -----------------------------------------------------------
# 2.2.1 clean salary column, which has either hourly, monthly or yearly values. Convert values into yearly salary based on the number of working hours in a year for an average job
# Note: in many instances, the salary is given as a range. The new output will represent the lower bound of this range: min_salary

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


## 2.3 marketing analist ------------------------------------------------------
# 2.3.1 clean salary column, which has either hourly, monthly or yearly values. Convert values into yearly salary based on the number of working hours in a year for an average job
# Note: in many instances, the salary is given as a range. The new output will represent the lower bound of this range: min_salary

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


## 2.4 marketeer --------------------------------------------------------------
# 2.4.1 clean salary column, which has either hourly, monthly or yearly values. Convert values into yearly salary based on the number of working hours in a year for an average job
# Note: in many instances, the salary is given as a range. The new output will represent the lower bound of this range: min_salary

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




#average salaries per location for data scientists

average_salaries_ds <- df_ds %>% 
  group_by(location_trimmed) %>%                 
  summarise(average_salary = mean(output)) 

#filter cities with over 50000 euro's average yearly salary
highest_average_salary_cities_ds <- average_salaries_ds %>%
  filter(average_salaries_ds$average_salary > 50000)
#build a plot of the locations with the highest average salary in the Netherlands
plot_highest_salary_by_location_ds <- ggplot(highest_average_salary_cities_ds, aes(x = location_trimmed, y = average_salary)) + geom_bar(stat='identity') + coord_flip()
plot_highest_salary_by_location_ds



#average salaries per location for data analists

average_salaries_da <- df_da %>% 
  group_by(location_trimmed) %>%                 
  summarise(average_salary = mean(output)) 

#filter cities with over 50000 euro's average yearly salary
highest_average_salary_cities_da <- average_salaries_da %>%
  filter(average_salaries_da$average_salary > 50000)
#filter cities with over 50000 euro's average yearly salary
plot_highest_salary_by_location_da <- ggplot(highest_average_salary_cities_da, aes(x = location_trimmed, y = average_salary)) + geom_bar(stat='identity') + coord_flip()
plot_highest_salary_by_location_da




#average salaries per location for marketing analists

average_salaries_ma <- df_ma %>% 
  group_by(location_trimmed) %>%                 
  summarise(average_salary = mean(output)) 

#filter cities with over 50000 euro's average yearly salary
highest_average_salary_cities_ma <- average_salaries_ma %>%
  filter(average_salaries_ma$average_salary > 50000)
#filter cities with over 50000 euro's average yearly salary
plot_highest_salary_by_location_ma <- ggplot(highest_average_salary_cities_ma, aes(x = location_trimmed, y = average_salary)) + geom_bar(stat='identity') + coord_flip()
plot_highest_salary_by_location_ma




#average salaries per location for marketeers


average_salaries_m <- df_m %>% 
  group_by(location_trimmed) %>%                 
  summarise(average_salary = mean(output)) 

#filter cities with over 50000 euro's average yearly salary
highest_average_salary_cities_m <- average_salaries_m %>%
  filter(average_salaries_m$average_salary > 50000)
#filter cities with over 50000 euro's average yearly salary
plot_highest_salary_by_location_m <- ggplot(highest_average_salary_cities_m, aes(x = location_trimmed, y = average_salary)) + geom_bar(stat='identity') + coord_flip()
plot_highest_salary_by_location_m