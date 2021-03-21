
df_ds <- read.csv("./data_scientist_clean.csv")
df_da <- read.csv("./data_analist_clean.csv")
df_ma <- read.csv("./marketing_analist_clean.csv")
df_m <- read.csv("./marketeer_clean.csv")


df_ds <- df_ds %>% distinct(id, .keep_all = TRUE)
#get the skill counts for the most important skills in data analysis
skills_ds <- df_ds %>%
  mutate(SQL = str_count(df_ds$description, "SQL" )) %>%
  mutate(HTML - str_count(df_ds$description, "HTML")) %>%
  mutate(SPSS = str_count(df_ds$description, "SPSS")) %>%
  mutate(AWS = str_count(df_ds$description, "AWS")) %>%
  mutate(Python = str_count(df_ds$description, "Python" )) %>%
  mutate(Hadoop = str_count(df_ds$description, "Hadoop" )) %>%
  mutate(Java = str_count(df_ds$description, "Java" )) %>%
  mutate(Apache = str_count(df_ds$description, "Apache" )) %>%
  mutate(Excel = str_count(df_ds$description, "Excel")) %>%
  mutate(AWS = str_count(df_ds$description, "AWS"))%>%
  mutate(Azure = str_count(df_ds$description, "Azure"))%>% 
  mutate(Tableau = str_count(df_ds$description, "Tableau" )) %>%
  mutate(TensorFlow = str_count(df_ds$description, "TensorFlow" )) %>%  
  mutate(big_data = str_count(df_ds$description, "big data" )) %>% 
  mutate(machine_learning = str_count(df_ds$description, "machine learning" )) %>%
  mutate(SAS = str_count(df_ds$description, "SAS" )) %>% 
  mutate(R = str_count(df_ds$description, "\\bR\\b" ))

#get only skills and their counts from the entire skills dataframe
table_ds <- gather(skills_ds, "skill", "Count", 12:28) %>%  arrange( Count) 
#make a plot of the counts for each skill
count_plot_ds <- ggplot(data=table_ds, aes(x=skill, y=Count)) + geom_bar(stat="identity") + coord_flip()#flip coordinates because skills on x axis gives messy text

count_plot_ds

#get the count data from the entire dataset
subset_ds <- skills_ds[12:28]  
#count the number of advertisements in which each skill is mentioned
occurences_ds <- colSums(subset_ds != 0)
#percentage of total number of advertisements
percentage_occurence_ds <- occurences_ds/nrow(subset_ds)
percentage_occurence_ds
#add skillnames into the dataframe 
percentage_ds <- as.data.frame(percentage_occurence_ds)
percentage_ds$row_names <- c("SQL","HTML", "SPSS", "AWS", "Python", "Hadoop", "Java", "Apache", "Excel", "AWS", "Azure", "Tableau", "TensorFlow", "big_data", "machine_learning", "SAS", "R")
#plot the percentage of occurence per skill level
percentage_plot_ds <- ggplot(data=percentage_ds(x=row_names, y=percentage_occurence_ds)) + geom_bar(stat="identity") + coord_flip()
percentage_plot_ds


# same  analysis for  Marketing analyst jobs
skills_da <- df_da %>%
  mutate(SQL = str_count(df_da$description, "SQL" )) %>%
  mutate(HTML - str_count(df_da$description, "HTML")) %>%
  mutate(SPSS = str_count(df_da$description, "SPSS")) %>%
  mutate(AWS = str_count(df_da$description, "AWS")) %>%
  mutate(Python = str_count(df_da$description, "Python" )) %>%
  mutate(Hadoop = str_count(df_da$description, "Hadoop" )) %>%
  mutate(Java = str_count(df_da$description, "Java" )) %>%
  mutate(Apache = str_count(df_da$description, "Apache" )) %>%
  mutate(Excel = str_count(df_da$description, "Excel")) %>%
  mutate(AWS = str_count(df_da$description, "AWS"))%>%
  mutate(Azure = str_count(df_da$description, "Azure"))%>% 
  mutate(Tableau = str_count(df_da$description, "Tableau" )) %>%
  mutate(TensorFlow = str_count(df_da$description, "TensorFlow" )) %>%  
  mutate(big_data = str_count(df_da$description, "big data" )) %>% 
  mutate(machine_learning = str_count(df_da$description, "machine learning" )) %>%
  mutate(SAS = str_count(df_da$description, "SAS" )) %>% 
  mutate(R = str_count(df_da$description, "\\bR\\b" ))# add\\bR\\b because otherwise words all capital letter R's will be counted, which includes any r at the beginning of a sentence. 

#get the count data from the entire dataset
subset_da <- skills_da[12:28]  
#count the number of advertisements in which each skill is mentioned
occurences_da <- colSums(subset_da != 0)
#percentage of total number of advertisements
percentage_occurence_da <- occurences_da/nrow(subset_da)
percentage_occurence_da
#add skillnames into the dataframe 
percentage_da <- as.data.frame(percentage_occurence_da)
percentage_da$row_names <- c("SQL","HTML","SPSS", "AWS", "Python", "Hadoop", "Java", "Apache", "Excel", "AWS", "Azure", "Tableau", "TensorFlow", "big_data", "machine_learning", "SAS", "R")
#plot the percentage of occurence per skill level
percentage_plot_da <- ggplot(data=percentage_da, aes(x=row_names, y=percentage_occurence)) + geom_bar(stat="identity") + coord_flip()
percentage_plot



# same  analysis for  Data analist jobs
skills_ma <- df_ma %>%
  mutate(SQL = str_count(df_ma$description, "SQL" )) %>%
  mutate(HTML - str_count(df_da$description, "HTML")) %>%
  mutate(SPSS = str_count(df_da$description, "SPSS")) %>%
  mutate(AWS = str_count(df_da$description, "AWS")) %>%
  mutate(Python = str_count(df_ma$description, "Python" )) %>%
  mutate(Hadoop = str_count(df_ma$description, "Hadoop" )) %>%
  mutate(Java = str_count(df_ma$description, "Java" )) %>%
  mutate(Apache = str_count(df_ma$description, "Apache" )) %>%
  mutate(Excel = str_count(df_ma$description, "Excel")) %>%
  mutate(AWS = str_count(df_ma$description, "AWS"))%>%
  mutate(Azure = str_count(df_ma$description, "Azure"))%>% 
  mutate(Tableau = str_count(df_ma$description, "Tableau" )) %>%
  mutate(TensorFlow = str_count(df_ma$description, "TensorFlow" )) %>%  
  mutate(big_data = str_count(df_ma$description, "big data" )) %>% 
  mutate(machine_learning = str_count(df_ma$description, "machine learning" )) %>%
  mutate(SAS = str_count(df_ma$description, "SAS" )) %>% 
  mutate(R = str_count(df_ma$description, "\\bR\\b" ))# add\\bR\\b because otherwise words all capital letter R's will be counted, which includes any r at the beginning of a sentence. 

#get the count data from the entire dataset
subset_ma <- skills_ma[12:28]  
#count the number of advertisements in which each skill is mentioned
occurences_ma <- colSums(subset_ma != 0)
#percentage of total number of advertisements
percentage_occurence_ma <- occurences_ma/nrow(subset_ma)
percentage_occurence_ma
#add skillnames into the dataframe 
percentage_ma <- as.data.frame(percentage_occurence_ma)
percentage_ma$row_names <- c("SQL","HTML","SPSS", "AWS", "Python", "Hadoop", "Java", "Apache", "Excel", "AWS", "Azure", "Tableau", "TensorFlow", "big_data", "machine_learning", "SAS", "R")
#plot the percentage of occurence per skill level
percentage_plot_ma <- ggplot(data=percentage_ma, aes(x=row_names, y=percentage_occurence)) + geom_bar(stat="identity") + coord_flip()
percentage_plot_ma





# same  analysis for  Marketeer jobs
skills_m <- df_m %>%
  mutate(SQL = str_count(df_m$description, "SQL" )) %>%
  mutate(HTML - str_count(df_da$description, "HTML")) %>%
  mutate(SPSS = str_count(df_da$description, "SPSS")) %>%
  mutate(AWS = str_count(df_da$description, "AWS")) %>%
  mutate(Python = str_count(df_m$description, "Python" )) %>%
  mutate(Hadoop = str_count(df_m$description, "Hadoop" )) %>%
  mutate(Java = str_count(df_m$description, "Java" )) %>%
  mutate(Apache = str_count(df_m$description, "Apache" )) %>%
  mutate(Excel = str_count(df_m$description, "Excel")) %>%
  mutate(AWS = str_count(df_m$description, "AWS"))%>%
  mutate(Azure = str_count(df_m$description, "Azure"))%>% 
  mutate(Tableau = str_count(df_m$description, "Tableau" )) %>%
  mutate(TensorFlow = str_count(df_m$description, "TensorFlow" )) %>%  
  mutate(big_data = str_count(df_m$description, "big data" )) %>% 
  mutate(machine_learning = str_count(df_m$description, "machine learning" )) %>%
  mutate(SAS = str_count(df_m$description, "SAS" )) %>% 
  mutate(R = str_count(df_m$description, "\\bR\\b" ))# add\\bR\\b because otherwise words all capital letter R's will be counted, which includes any r at the beginning of a sentence. 

#get the count data from the entire dataset
subset_m <- skills_m[12:28]  
#count the number of advertisements in which each skill is mentioned
occurences_m <- colSums(subset_m != 0)
#percentage of total number of advertisements
percentage_occurence_m <- occurences_m/nrow(subset_m)
percentage_occurence
#add skillnames into the dataframe 
percentage_m <- as.data.frame(percentage_occurence_m)
percentage_m$row_names <- c("SQL","HTML","SPSS", "AWS", "Python", "Hadoop", "Java", "Apache", "Excel", "AWS", "Azure", "Tableau", "TensorFlow", "big_data", "machine_learning", "SAS", "R")
#plot the percentage of occurence per skill level
percentage_plot_m <- ggplot(data=percentage_m, aes(x=row_names, y=percentage_occurence)) + geom_bar(stat="identity") + coord_flip()
percentage_plot_m
