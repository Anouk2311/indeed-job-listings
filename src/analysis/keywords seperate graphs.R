data_scientist <- read.csv("../../gen/data-preparation/output/data_scientist_clean.csv")
data_analist <- read.csv("../../gen/data-preparation/output/data_analist_clean.csv")
marketing_analist<- read.csv("../../gen/data-preparation/output/marketing_analist_clean.csv")
marketeer <- read.csv("../../gen/data-preparation/output/marketeer_clean.csv")
#function to add the skills to the datasets
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

#function to build the percentage plots for each skill seperately
percentage_plot <- function(dataset) {
  subset_dataset <- dataset[, 15:31]
  occurences_dataset <- colSums(subset_dataset != 0)
  percentage_dataset <- occurences_dataset/nrow(subset_dataset)
  percentage_dataset <- as.data.frame(percentage_dataset)
  percentage_dataset$Skill <- c("SQL","HTML", "SPSS","Power BI", "AWS", "Python", "Hadoop", "Java", "Apache", "Excel", "Azure", "Tableau", "TensorFlow", "big_data", "machine_learning", "SAS", "R")
    percentage_plot_dataset <- ggplot(data=percentage_dataset, aes(x=Skill, y=percentage_dataset)) + geom_bar(stat="identity") + coord_flip()
}

#perform the functions on the datasets and directly show the plot

data_scientist <- add_skills(data_scientist)
plot(data_scientist_percentage_plot <- percentage_plot(data_scientist))

data_analist <- add_skills(data_analist)
plot(data_analist_percentage_plot <- percentage_plot(data_analist))

marketing_analist <- add_skills(marketing_analist)
plot(marketing_analist_percentage_plot <- percentage_plot(marketing_analist))


marketeer <- add_skills(marketeer)
plot(marketeer_percentage_plot <- percentage_plot(marketeer))


