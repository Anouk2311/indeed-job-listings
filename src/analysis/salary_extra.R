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

