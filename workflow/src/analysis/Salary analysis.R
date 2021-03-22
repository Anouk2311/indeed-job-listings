### 1. load datasets into R ---------------------------------------------------
-------------------------
  data_scientist <- read.csv("../../gen/data-preparation/output/data_scientist_clean.csv")
  data_analist <- read.csv("../../gen/data-preparation/output/data_analist_clean.csv")
  marketing_analist<- read.csv("../../gen/data-preparation/output/marketing_analist_clean.csv")
  marketeer <- read.csv("../../gen/data-preparation/output/marketeer_clean.csv")
## 2.1 data scientist ---------------------------------------------------------
# 2.1.1 clean salary column, which has either hourly, monthly or yearly values. Convert values into yearly salary based on the number of working hours in a year for an average job
# Note: in many instances, the salary is given as a range. The new output will represent the lower bound of this range: min_salary

data_scientist_salary <- data_scientist %>% 
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
data_scientist_salary <- cbind(data_scientist, data_scientist_salary)

data_scientist_salary <- data_scientist_salary[!is.na(data_scientist_salary$min_salary),]
# 2.1.2 discard the column X.1 as it is a duplicate of the index column 
data_scientist_salary$X.1 <- NULL


## 2.2 data analist -----------------------------------------------------------
# 2.2.1 clean salary column, which has either hourly, monthly or yearly values. Convert values into yearly salary based on the number of working hours in a year for an average job
# Note: in many instances, the salary is given as a range. The new output will represent the lower bound of this range: min_salary

data_analist_salary <- data_analist %>% 
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
data_analist_salary <- cbind(data_analist, data_analist_salary)
data_analist_salary <- data_analist_salary[!is.na(data_analist_salary$min_salary),]

# 2.2.2 discard the column X.1 as it is a duplicate of the index column 
data_analist_salary$X.1 <- NULL


## 2.3 marketing analist ------------------------------------------------------
# 2.3.1 clean salary column, which has either hourly, monthly or yearly values. Convert values into yearly salary based on the number of working hours in a year for an average job
# Note: in many instances, the salary is given as a range. The new output will represent the lower bound of this range: min_salary

marketing_analist_salary  <- marketing_analist %>% 
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
marketing_analist_salary   <- cbind(marketing_analist, marketing_analist_salary  )
marketing_analist_salary  <- marketing_analist_salary  [!is.na(marketing_analist_salary$min_salary),]

# 2.2.2 discard the column X.1 as it is a duplicate of the index column 
marketing_analist_salary$X.1 <- NULL


## 2.4 marketeer --------------------------------------------------------------
# 2.4.1 clean salary column, which has either hourly, monthly or yearly values. Convert values into yearly salary based on the number of working hours in a year for an average job
# Note: in many instances, the salary is given as a range. The new output will represent the lower bound of this range: min_salary

marketeer_salary  <- marketeer %>% 
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
marketeer_salary  <- cbind(marketeer, marketeer_salary )
marketeer_salary <- marketeer_salary[!is.na(marketeer_salary$min_salary),]

# 2.2.2 discard the column X.1 as it is a duplicate of the index column 
marketeer_salary$X.1 <- NULL


#average salaries per location for top locations for data scientists

data_scientist_avgsalary <- data_scientist_salary %>% 
  group_by(location_trimmed) %>%                 
  summarise(average_salary = mean(min_salary)) 

#filter cities with over 30000 euro's average yearly salary
data_scientist_avgsalary  <- data_scientist_avgsalary %>%
  filter(data_scientist_avgsalary$average_salary > 30000)
#build a plot of the locations with the highest average salary in the Netherlands
data_scientist_salary_plot <- ggplot(data_scientist_avgsalary, aes(x = location_trimmed, y = average_salary)) + geom_bar(stat='identity') + coord_flip()
data_scientist_salary_plot


#average salaries per location for top locations for data analists

data_analist_avgsalary <- data_analist_salary %>% 
  group_by(location_trimmed) %>%                 
  summarise(average_salary = mean(min_salary)) 

#filter cities with over 30000 euro's average yearly salary
data_analist_avgsalary <- data_analist_avgsalary  %>%
  filter(data_analist_avgsalary$average_salary > 30000)

#build a plot of the locations with the highest average salary in the Netherlands
data_analist_salary_plot <- ggplot(data_analist_avgsalary, aes(x = location_trimmed, y = average_salary)) + geom_bar(stat='identity') + coord_flip()
data_analist_salary_plot




#average salaries per location for top locations for marketing analists

marketing_analist_avgsalary <-marketing_analist_salary %>% 
  group_by(location_trimmed) %>%                 
  summarise(average_salary = mean(min_salary)) 

#filter cities with over 30000 euro's average yearly salary
marketing_analist_avgsalary <-   marketing_analist_avgsalary %>%
  filter(marketing_analist_avgsalary$average_salary > 30000)

#build a plot of the locations with the highest average salary in the Netherlands
marketing_analist_salary_plot <- ggplot(marketing_analist_avgsalary, aes(x = location_trimmed, y = average_salary)) + geom_bar(stat='identity') + coord_flip()
marketing_analist_salary_plot




#average salaries per location for top locations for  marketeers

marketeer
marketeer_avgsalary <- marketeer_salary %>% 
  group_by(location_trimmed) %>%                 
  summarise(average_salary = mean(min_salary)) 

#filter cities with over 30000 euro's average yearly salary
marketeer_avgsalary <- marketeer_avgsalary %>%
  filter(marketeer_avgsalary$average_salary > 30000)
#build a plot of the locations with the highest average salary in the Netherlands
marketeer_salary_plot <- ggplot(marketeer_avgsalary, aes(x = location_trimmed, y = average_salary)) + geom_bar(stat='identity') + coord_flip()
marketeer_salary_plot


#combined plot
#first merge the different files
salary <- merge(marketeer_avgsalary, data_analist_avgsalary, by = "location_trimmed")
salary <- merge(salary, data_scientist_avgsalary, by = "location_trimmed")
salary <- merge(salary, marketing_analist_avgsalary, by = "location_trimmed")
colnames(salary) <- c("Location", "marketeer", "data_analist", "data_scientist", "marketing_analist")
#put all jobs in a column 
salary <- melt(salary, id.vars="Location")
colnames(salary) <- c("Location", "Job", "Salary")
plot_salary <- ggplot(salary, aes(x= Location, y = Salary, fill=Job)) +
  geom_bar(stat='identity', position='dodge') + coord_flip()
plot_salary
