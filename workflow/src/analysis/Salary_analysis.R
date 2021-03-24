### 1. load datasets into R ---------------------------------------------------
-------------------------
  data_scientist <- read.csv("../../gen/data-preparation/output/data_scientist_clean.csv")
  data_analist <- read.csv("../../gen/data-preparation/output/data_analist_clean.csv")
  marketing_analist<- read.csv("../../gen/data-preparation/output/marketing_analist_clean.csv")
  marketeer <- read.csv("../../gen/data-preparation/output/marketeer_clean.csv")
## 2.1 data scientist ---------------------------------------------------------
# 2.1.1 clean salary column, which has either hourly, monthly or yearly values. Convert values into yearly salary based on the number of working hours in a year for an average job
# Note: in many instances, the salary is given as a range. The new output will represent the lower bound of this range: min_salary

remove_na <- function(dataset){
  dataset<- dataset[!is.na(dataset$min_salary),]
  # 2.1.2 discard the column X.1 as it is a duplicate of the index column 
  dataset_salary$X.1 <- NULL
  
}

data_scientist_salary <- remove_na(data_scientist)
data_analist_salary <- remove_na(data_analist)
marketing_analist_salary <- remove_na(marketing_analist)
marketeer_salary <- remove_na(marketeer)

#average salaries per location for top locations for data scientists
plot <- function(dataset){
  dataset_avgsalary <- dataset_salary %>% 
    group_by(location) %>%                 
    summarise(average_salary = mean(min_salary)) 
    #filter cities with over 30000 euro's average yearly salary
  dataset_avgsalary  <- dataset_avgsalary %>%
    filter(dataset_avgsalary$average_salary > 30000)
  #build a plot of the locations with the highest average salary in the Netherlands
  dataset_salary_plot <- ggplot(dataset_avgsalary, aes(x = location, y = average_salary)) + geom_bar(stat='identity') + coord_flip()
  
}

data_scientist_avgsalary <- plot(data_scientist_salary)
data_analist_avgsalary <- plot(data_analist_salary)
marketing_analist_avgsalary <- plot(marketing_analist_salary)
marketeer_avgsalary <- plot(marketeer_salary)

#combined plot
#first merge the different files
salary <- merge(marketeer_avgsalary, data_analist_avgsalary, by = "location")
salary <- merge(salary, data_scientist_avgsalary, by = "location")
salary <- merge(salary, marketing_analist_avgsalary, by = "location")
colnames(salary) <- c("Location", "marketeer", "data_analist", "data_scientist", "marketing_analist")
#put all jobs in a column 
salary <- melt(salary, id.vars="Location")
colnames(salary) <- c("Location", "Job", "Salary")
plot_salary <- ggplot(salary, aes(x= Location, y = Salary, fill=Job)) +
  geom_bar(stat='identity', position='dodge') + coord_flip()
plot_salary
