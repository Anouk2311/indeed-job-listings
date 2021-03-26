#read in data
data_scientist <- read.csv("../../gen/data-preparation/output/data_scientist_clean.csv")
data_analist <- read.csv("../../gen/data-preparation/output/data_analist_clean.csv")
marketing_analist<- read.csv("../../gen/data-preparation/output/marketing_analist_clean.csv")
marketeer <- read.csv("../../gen/data-preparation/output/marketeer_clean.csv")
#function to add the skills to the dataset
add_skills <- function(dataset) {
  dataset <- dataset %>%
    mutate(SQL = str_count(dataset$description, "SQL" )) %>%
    mutate(HTML = str_count(dataset$description, "HTML")) %>%
    mutate(SPSS = str_count(dataset$description, "SPSS")) %>%
    mutate(PowerBI = str_count(dataset$description, "Power BI")) %>%
    mutate(AWS = str_count(dataset$description, "AWS")) %>%
    mutate(Python = str_count(dataset$description, "Python" )) %>%
    mutate(Hadoop = str_count(dataset$description, "Hadoop" )) %>%
    mutate(Java = str_count(dataset$description, "Java" )) %>%
    mutate(Apache = str_count(dataset$description, "Apache" )) %>%
    mutate(Excel = str_count(dataset$description, "Excel")) %>%
    mutate(AWS = str_count(dataset$description, "AWS"))%>%
    mutate(Azure = str_count(dataset$description, "Azure"))%>% 
    mutate(Tableau = str_count(dataset$description, "Tableau" )) %>%
    mutate(TensorFlow = str_count(dataset$description, "TensorFlow" )) %>%  
    mutate(big_data = str_count(dataset$description, "big data" )) %>% 
    mutate(machine_learning = str_count(dataset$description, "machine learning" )) %>%
    mutate(SAS = str_count(dataset$description, "SAS" )) %>% 
    mutate(R = str_count(dataset$description, "\\bR\\b" ))
}
#function to show the count plot for each job seperately
count_plot <- function(dataset) {
table_dataset <- gather(dataset, "Skill", "Count", 14:30) %>%  arrange( Count) 
count_plot_dataset <- ggplot(data=table_dataset, aes(x=Skill, y=Count)) + geom_bar(stat="identity") + coord_flip()#flip coordinates because skills on x axis gives messy text
}

#function to calculate percentages of skill occurence for each job
percentage <- function(dataset){
  subset_dataset <- dataset[, 14:30]
  occurences_dataset <- colSums(subset_dataset != 0)
  percentage_dataset <- occurences_dataset/nrow(subset_dataset)
  percentage_dataset <- as.data.frame(percentage_dataset)
  
}


data_scientist <- add_skills(data_scientist)
data_scientist_count_plot <- count_plot(data_scientist)
percentage_data_scientist <- percentage(data_scientist)


data_analist <- add_skills(data_analist)
data_analist_count_plot <- count_plot(data_analist)
percentage_data_analist <- percentage(data_analist)


marketing_analist <- add_skills(marketing_analist)
marketing_analist_count_plot <- count_plot(marketing_analist)
percentage_marketing_analist <- percentage(marketing_analist)

marketeer <- add_skills(marketeer)
marketeer_count_plot <- count_plot(marketeer)
percentage_marketeer <- percentage(marketeer)

#next part is to combine the seperate bar charts of before into one bar graph to conveniently compare the skills occurence for our 4 job searches

#add skill names
percentage_data_scientist$Skill <- c("SQL","HTML", "SPSS","Power BI", "AWS", "Python", "Hadoop", "Java", "Apache", "Excel", "Azure", "Tableau", "TensorFlow", "big_data", "machine_learning", "SAS", "R")
percentage_data_analist$Skill <- c("SQL","HTML", "SPSS","Power BI", "AWS", "Python", "Hadoop", "Java", "Apache", "Excel", "Azure", "Tableau", "TensorFlow", "big_data", "machine_learning", "SAS", "R")
percentage_marketing_analist$Skill <- c("SQL","HTML", "SPSS","Power BI", "AWS", "Python", "Hadoop", "Java", "Apache", "Excel", "Azure", "Tableau", "TensorFlow", "big_data", "machine_learning", "SAS", "R")
percentage_marketeer$Skill <- c("SQL","HTML", "SPSS","Power BI", "AWS", "Python", "Hadoop", "Java", "Apache", "Excel", "Azure", "Tableau", "TensorFlow", "big_data", "machine_learning", "SAS", "R")

#merge different percentage for skills into one data frame
percentage_combined <- merge(percentage_marketeer, percentage_data_analist, by = "Skill") 
percentage_combined <- merge(percentage_combined, percentage_data_scientist, by = "Skill")
percentage_combined <- merge(percentage_combined, percentage_marketing_analist, by = "Skill")

colnames(percentage_combined) <- c("Skill", "marketeer", "data_analist", "data_scientist", "marketing_analist")
#making the combined plot for each skill and job
df <- melt(percentage_combined, id.vars="Skill")
colnames(df) <- c("Skill", "Job", "Occurence")
plot(plot_skills <- ggplot(df, aes(x= Skill, y = Occurence, fill=Job)) +
  geom_bar(stat='identity', position='dodge') + coord_flip())

