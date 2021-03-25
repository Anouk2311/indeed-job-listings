#salary analysis location salary 
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

data_scientist <- remove_na(data_scientist)
data_analist <- remove_na(data_analist)
marketing_analist <- remove_na(marketing_analist)
marketeer <- remove_na(marketeer)


#average salaries per location for top locations 
top_salaries <- function(dataset){
  dataset_avgsalary <- dataset %>% 
    group_by(location) %>%                 
    summarise(average_salary = mean(salary_good)) 
  #filter cities with over 30000 euro's average yearly salary
  dataset_avgsalary  <- dataset_avgsalary %>%
    filter(dataset_avgsalary$average_salary > 30000)
}

data_scientist_avgsalary <- top_salaries(data_scientist)
data_analist_avgsalary<- top_salaries(data_analist)
marketing_analist_avgsalary <- top_salaries(marketing_analist)
marketeer_avgsalary <- top_salaries(data_analist)

#combined plot
#first merge the different files
salary <- merge(marketeer_avgsalary, data_analist_avgsalary, by = "location")
salary <- merge(salary, data_scientist_avgsalary, by = "location")
salary <- merge(salary, marketing_analist_avgsalary, by = "location")
colnames(salary) <- c("Location", "marketeer", "data_analist", "data_scientist", "marketing_analist")
#put all jobs in a column 
salary <- melt(salary, id.vars="location")
colnames(salary) <- c("Location", "Job", "Salary")

plot_salary <- ggplot(salary, aes(x= Location, y = Salary, fill=Job)) +
  geom_bar(stat='identity', position='dodge') + coord_flip()
plot_salary
