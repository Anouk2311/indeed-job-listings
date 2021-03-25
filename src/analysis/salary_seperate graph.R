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
  dataset <- dataset[!is.na(dataset$salary_good),]
 }

data_scientist_salary <- remove_na(data_scientist)
data_analist_salary <- remove_na(data_analist)
marketing_analist_salary <- remove_na(marketing_analist)
marketeer_salary <- remove_na(marketeer)

#finding the mean salary per job
avg_salary_data_science <- mean(data_scientist_salary$salary_good)
avg_salary_data_analist <- mean(data_analist_salary$salary_good)
avg_salary_marketing_analist <- mean(marketing_analist_salary$salary_good)
avg_salary_marketeer <- mean(marketeer_salary$salary_good)

job <- c("Data Scientist","Data analist",  "Marketing analist", "Marketeer")
salary <- c( avg_salary_data_science, avg_salary_data_analist, avg_salary_marketing_analist, avg_salary_marketeer)

df_salary <- data.frame(job, salary)


plot_mean_salary <- plot(ggplot(df_salary, aes(x = job, y = salary)) + geom_bar(stat='identity'))

#average salaries per location for top locations 
plotting_top_salaries <- function(dataset){
  dataset_avgsalary <- dataset %>% 
    group_by(location) %>%                 
    summarise(average_salary = mean(salary_good)) 
    #filter cities with over 30000 euro's average yearly salary
  dataset_avgsalary  <- dataset_avgsalary %>%
    filter(dataset_avgsalary$average_salary > 30000)
  #build a plot of the locations with the highest average salary in the Netherlands
  dataset_salary_plot <- ggplot(dataset_avgsalary, aes(x = location, y = average_salary)) + geom_bar(stat='identity') + coord_flip()
  
}

plot(data_scientist_avgsalary <- plotting_top_salaries(data_scientist_salary))
plot(data_analist_avgsalary <- plotting_top_salaries(data_analist_salary))
plot(marketing_analist_avgsalary <- plotting_top_salaries(marketing_analist_salary))
plot(marketeer_avgsalary <- plotting_top_salaries(marketeer_salary))

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
