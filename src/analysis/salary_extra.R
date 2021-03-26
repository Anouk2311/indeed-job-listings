### 1. load datasets into R ---------------------------------------------------
  data_scientist <- read.csv("../../gen/data-preparation/output/data_scientist_clean.csv")
  data_analist <- read.csv("../../gen/data-preparation/output/data_analist_clean.csv")
  marketing_analist<- read.csv("../../gen/data-preparation/output/marketing_analist_clean.csv")
  marketeer <- read.csv("../../gen/data-preparation/output/marketeer_clean.csv")
## 2.1 data scientist ---------------------------------------------------------
# Remove Nas from dataset
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
#creating a dataframe with the jobs and their mean salary
job <- c("Data Scientist","Data analist",  "Marketing analist", "Marketeer")
salary <- c( avg_salary_data_science, avg_salary_data_analist, avg_salary_marketing_analist, avg_salary_marketeer)

df_salary <- data.frame(job, salary)

#creating a plot of the mean salary per job
plot_mean_salary <- plot(ggplot(df_salary, aes(x = job, y = salary)) + geom_bar(stat='identity'))

