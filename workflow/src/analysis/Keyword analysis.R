setwd("C:/Documents/data1/indeed-job-listings/workflow/gen/data-preparation/output")

data_scientist <- read.csv("../../gen/data-preparation/output/data_scientist_clean.csv")
data_analist <- read.csv("../../gen/data-preparation/output/data_analist_clean.csv")
marketing_analist<- read.csv("../../gen/data-preparation/output/marketing_analist_clean.csv")
marketeer <- read.csv("../../gen/data-preparation/output/marketeer_clean.csv")

#get the skill counts for the most important skills in data analysis
skills_data_science <- data_scientist %>%
  mutate(SQL = str_count(data_scientist$description, "SQL" )) %>%
  mutate(HTML = str_count(data_scientist$description, "HTML")) %>%
  mutate(SPSS = str_count(data_scientist$description, "SPSS")) %>%
  mutate(PowerBI = str_count(data_scientist$description, "Power BI")) %>%
  mutate(AWS = str_count(data_scientist$description, "AWS")) %>%
  mutate(Python = str_count(data_scientist$description, "Python" )) %>%
  mutate(Hadoop = str_count(data_scientist$description, "Hadoop" )) %>%
  mutate(Java = str_count(data_scientist$description, "Java" )) %>%
  mutate(Apache = str_count(data_scientist$description, "Apache" )) %>%
  mutate(Excel = str_count(data_scientist$description, "Excel")) %>%
  mutate(AWS = str_count(data_scientist$description, "AWS"))%>%
  mutate(Azure = str_count(data_scientist$description, "Azure"))%>% 
  mutate(Tableau = str_count(data_scientist$description, "Tableau" )) %>%
  mutate(TensorFlow = str_count(data_scientist$description, "TensorFlow" )) %>%  
  mutate(big_data = str_count(data_scientist$description, "big data" )) %>% 
  mutate(machine_learning = str_count(data_scientist$description, "machine learning" )) %>%
  mutate(SAS = str_count(data_scientist$description, "SAS" )) %>% 
  mutate(R = str_count(data_scientist$description, "\\bR\\b" ))

#get only skills and their counts from the entire skills dataframe and arrange by count
table_data_science <- gather(skills_data_science, "Skill", "Count", 15:31) %>%  arrange( Count) 
#make a plot of the counts for each skill
count_plot_data_science <- ggplot(data=table_data_science, aes(x=Skill, y=Count)) + geom_bar(stat="identity") + coord_flip()#flip coordinates because skills on x axis gives messy text
count_plot_data_science

#get the count dta from the entire dataset
subset_data_science <- skills_data_science[15:31]  
#count the number of advertisements in which each skill is mentioned
occurences_data_science <- colSums(subset_data_science != 0)
#percentage of total number of advertisements
percentage_data_science <- occurences_data_science/nrow(subset_data_science)
#add skillnames into the dataframe 
percentage_data_science <- as.data.frame(percentage_data_science)
percentage_data_science$Skill <- c("SQL","HTML", "SPSS","Power BI", "AWS", "Python", "Hadoop", "Java", "Apache", "Excel", "Azure", "Tableau", "TensorFlow", "big_data", "machine_learning", "SAS", "R")
#plot the percentage of occurence per skill level
percentage_plot_data_science <- ggplot(data=percentage_data_science, aes(x=Skill, y=percentage_data_science)) + geom_bar(stat="identity") + coord_flip()
percentage_plot_data_science


# same  analysis for  Data analyst jobs
skills_data_analist <- data_analist %>%
  mutate(SQL = str_count(data_analist$description, "SQL" )) %>%
  mutate(HTML = str_count(data_analist$description, "HTML")) %>%
  mutate(SPSS = str_count(data_analist$description, "SPSS")) %>%
  mutate(PowerBI = str_count(data_analist$description, "Power BI")) %>%
  mutate(AWS = str_count(data_analist$description, "AWS")) %>%
  mutate(Python = str_count(data_analist$description, "Python" )) %>%
  mutate(Hadoop = str_count(data_analist$description, "Hadoop" )) %>%
  mutate(Java = str_count(data_analist$description, "Java" )) %>%
  mutate(Apache = str_count(data_analist$description, "Apache" )) %>%
  mutate(Excel = str_count(data_analist$description, "Excel")) %>%
  mutate(AWS = str_count(data_analist$description, "AWS"))%>%
  mutate(Azure = str_count(data_analist$description, "Azure"))%>% 
  mutate(Tableau = str_count(data_analist$description, "Tableau" )) %>%
  mutate(TensorFlow = str_count(data_analist$description, "TensorFlow" )) %>%  
  mutate(big_data = str_count(data_analist$description, "big data" )) %>% 
  mutate(machine_learning = str_count(data_analist$description, "machine learning" )) %>%
  mutate(SAS = str_count(data_analist$description, "SAS" )) %>% 
  mutate(R = str_count(data_analist$description, "\\bR\\b" ))# add\\bR\\b because otherwise words all capital letter R's will be counted, which includes any r at the beginning of a sentence. 

#get only skills and their counts from the entire skills dataframe
table_data_analist <- gather(skills_data_analist, "Skill", "Count", 15:31) %>%  arrange( Count) 
#make a plot of the counts for each skill
count_plot_data_analist <- ggplot(data=table_data_analist, aes(x=Skill, y=Count)) + geom_bar(stat="identity") + coord_flip()#flip coordinates because skills on x axis gives messy text
count_plot_data_analist


#get the count data from the entire dataset
subset_data_analist <- skills_data_analist[15:31]  
#count the number of advertisements in which each skill is mentioned
occurences_data_analist <- colSums(subset_data_analist != 0)
#percentage of total number of advertisements
percentage_data_analist <- occurences_data_analist/nrow(subset_data_analist)
#add skillnames into the dataframe 
percentage_data_analist <- as.data.frame(percentage_data_analist)
percentage_data_analist$Skill <- c("SQL","HTML","SPSS","Power BI", "AWS", "Python", "Hadoop", "Java", "Apache", "Excel", "Azure", "Tableau", "TensorFlow", "big_data", "machine_learning", "SAS", "R")
#plot the percentage of occurence per skill level
percentage_plot_data_analist <- ggplot(data=percentage_data_analist, aes(x=Skill, y=percentage_data_analist)) + geom_bar(stat="identity") + coord_flip()
percentage_plot_data_analist



# same  analysis for  Marketing analist jobs
skills_marketing_analist <- marketing_analist %>%
  mutate(SQL = str_count(marketing_analist$description, "SQL" )) %>%
  mutate(HTML = str_count(marketing_analist$description, "HTML")) %>%
  mutate(SPSS = str_count(marketing_analist$description, "SPSS")) %>%
  mutate(PowerBI = str_count(marketing_analist$description, "Power BI")) %>%
  mutate(AWS = str_count(marketing_analist$description, "AWS")) %>%
  mutate(Python = str_count(marketing_analist$description, "Python" )) %>%
  mutate(Hadoop = str_count(marketing_analist$description, "Hadoop" )) %>%
  mutate(Java = str_count(marketing_analist$description, "Java" )) %>%
  mutate(Apache = str_count(marketing_analist$description, "Apache" )) %>%
  mutate(Excel = str_count(marketing_analist$description, "Excel")) %>%
  mutate(AWS = str_count(marketing_analist$description, "AWS"))%>%
  mutate(Azure = str_count(marketing_analist$description, "Azure"))%>% 
  mutate(Tableau = str_count(marketing_analist$description, "Tableau" )) %>%
  mutate(TensorFlow = str_count(marketing_analist$description, "TensorFlow" )) %>%  
  mutate(big_data = str_count(marketing_analist$description, "big data" )) %>% 
  mutate(machine_learning = str_count(marketing_analist$description, "machine learning" )) %>%
  mutate(SAS = str_count(marketing_analist$description, "SAS" )) %>% 
  mutate(R = str_count(marketing_analist$description, "\\bR\\b" ))# add\\bR\\b because otherwise words all capital letter R's will be counted, which includes any r at the beginning of a sentence. 

#get only skills and their counts from the entire skills dataframe
table_marketing_analist <- gather(skills_marketing_analist, "Skill", "Count", 15:31) %>%  arrange( Count) 
#make a plot of the counts for each skill
count_plot_marketing_analist <- ggplot(data=table_marketing_analist, aes(x=Skill, y=Count)) + geom_bar(stat="identity") + coord_flip()#flip coordinates because skills on x axis gives messy text
count_plot_marketing_analist

#get the count data from the entire dataset
subset_marketing_analist <- skills_marketing_analist[15:31]  
#count the number of advertisements in which each skill is mentioned
occurences_marketing_analist <- colSums(subset_marketing_analist != 0)
#percentage of total number of advertisements
percentage_marketing_analist <- occurences_marketing_analist/nrow(subset_marketing_analist)
#add skillnames into the dataframe 
percentage_marketing_analist <- as.data.frame(percentage_marketing_analist)
percentage_marketing_analist$Skill <- c("SQL","HTML","SPSS","Power BI", "AWS", "Python", "Hadoop", "Java", "Apache", "Excel", "Azure", "Tableau", "TensorFlow", "big_data", "machine_learning", "SAS", "R")
#plot the percentage of occurence per skill level
percentage_plot_marketing_analist <- ggplot(data=percentage_marketing_analist, aes(x=Skill, y=percentage_marketing_analist)) + geom_bar(stat="identity") + coord_flip()
percentage_plot_marketing_analist





# same  analysis for  Marketeer jobs
skills_marketeer <- marketeer %>%
  mutate(SQL = str_count(marketeer$description, "SQL" )) %>%
  mutate(HTML = str_count(marketeer$description, "HTML")) %>%
  mutate(SPSS = str_count(marketeer$description, "SPSS")) %>%
  mutate(PowerBI = str_count(marketeer$description, "Power BI")) %>%
  mutate(AWS = str_count(marketeer$description, "AWS")) %>%
  mutate(Python = str_count(marketeer$description, "Python" )) %>%
  mutate(Hadoop = str_count(marketeer$description, "Hadoop" )) %>%
  mutate(Java = str_count(marketeer$description, "Java" )) %>%
  mutate(Apache = str_count(marketeer$description, "Apache" )) %>%
  mutate(Excel = str_count(marketeer$description, "Excel")) %>%
  mutate(AWS = str_count(marketeer$description, "AWS"))%>%
  mutate(Azure = str_count(marketeer$description, "Azure"))%>% 
  mutate(Tableau = str_count(marketeer$description, "Tableau" )) %>%
  mutate(TensorFlow = str_count(marketeer$description, "TensorFlow" )) %>%  
  mutate(big_data = str_count(marketeer$description, "big data" )) %>% 
  mutate(machine_learning = str_count(marketeer$description, "machine learning" )) %>%
  mutate(SAS = str_count(marketeer$description, "SAS" )) %>% 
  mutate(R = str_count(marketeer$description, "\\bR\\b" ))# add\\bR\\b because otherwise words all capital letter R's will be counted, which includes any r at the beginning of a sentence. 

#get only skills and their counts from the entire skills dataframe
table_marketeer <- gather(skills_marketeer,"Skill", "Count", 15:31) %>%  arrange( Count) 
#make a plot of the counts for each skill
count_plot_marketeer <- ggplot(data=table_marketeer, aes(x=Skill, y=Count)) + geom_bar(stat="identity") + coord_flip()#flip coordinates because skills on x axis gives messy text
count_plot_marketeer

#get the count data from the entire dataset
subset_marketeer <- skills_marketeer[15:31]
#count the number of advertisements in which each skill is mentioned
occurences_marketeer <- colSums(subset_marketeer != 0)
#percentage of total number of advertisements
percentage_marketeer <- occurences_marketeer/nrow(subset_marketeer)
#add skillnames into the dataframe 
percentage_marketeer <- as.data.frame(percentage_marketeer)
percentage_marketeer$Skill <- c("SQL","HTML","SPSS", "Power BI",  "AWS", "Python", "Hadoop", "Java", "Apache", "Excel", "Azure", "Tableau", "TensorFlow", "big_data", "machine_learning", "SAS", "R")
#plot the percentage of occurence per skill level
percentage_plot_marketeer <- ggplot(data=percentage_marketeer, aes(x=Skill, y=percentage_marketeer))+ geom_bar(stat="identity") + coord_flip()
percentage_plot_marketeer

#next part is to combine the seperate bar charts of before into one bar graph to conveniently compare the skills occurence for our 4 job searches

#merge different percentage for skills into one data frame
percentage <- merge(percentage_marketeer, percentage_data_analist, by = "Skill") 
percentage <- merge(percentage, percentage_data_science, by = "Skill")
percentage <- merge(percentage, percentage_marketing_analist, by = "Skill")

colnames(percentage) <- c("Skill", "marketeer", "data_analist", "data_scientist", "marketing_analist")


df <- melt(percentage, id.vars="Skill")
colnames(df) <- c("Skill", "Job", "Occurence")
plot_skills <- ggplot(df, aes(x= Skill, y = Occurence, fill=Job)) +
  geom_bar(stat='identity', position='dodge') + coord_flip()
plot_skills

