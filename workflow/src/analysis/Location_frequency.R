#location frequency analysis
data_scientist_location <- read.csv("../../gen/data-preparation/output/data_scientist_clean.csv")
data_analist_location <- read.csv("../../gen/data-preparation/output/data_analist_clean.csv")
marketing_analist_location <- read.csv("../../gen/data-preparation/output/marketing_analist_clean.csv")
marketeer_location <- read.csv("../../gen/data-preparation/output/marketeer_clean.csv")

#location frequency data science
data_scientist_location <- as.data.frame(table(data_scientist_location$location))
data_scientist_location <- data_scientist_location %>% filter(Freq > 10)
data_scientist_location$location <- data_scientist_location$Var1
data_scientist_location_plot <- ggplot(data_scientist_location, aes(x = location, y = Freq)) + geom_bar(stat="identity") + coord_flip()  
data_scientist_location_plot 

#location frequency data analist

data_analist_location <- as.data.frame(table(data_analist_location$location))
data_analist_location <- data_analist_location %>% filter(Freq > 10)
data_analist_location$location <- data_analist_location$Var1
data_analist_location_plot <- ggplot(data_analist_location, aes(x = location, y = Freq)) + geom_bar(stat="identity") + coord_flip()  
data_analist_location_plot

#location frequency marketing analist
marketing_analist_location <- as.data.frame(table(marketing_analist_location$location))
marketing_analist_location <- marketing_analist_location %>% filter(Freq > 10)
marketing_analist_location$location <- marketing_analist_location$Var1
marketing_analist_location_plot <- ggplot(marketing_analist_location, aes(x = location, y = Freq)) + geom_bar(stat="identity") + coord_flip()  
marketing_analist_location_plot

#location frequency marketeer
marketeer_location<- as.data.frame(table(marketeer_location$location))
marketeer_location <- marketeer_location %>% filter(Freq > 10)
marketeer_location$location <- marketeer_location$Var1
marketeer_location_plot <- ggplot(marketeer_location, aes(x = location, y = Freq)) + geom_bar(stat="identity") + coord_flip()  
marketeer_location_plot

#combined plot

location <- merge(marketeer_location, data_analist_location, by = "location")
location <- merge(location, data_scientist_location, by = "location")
location <- merge(location, marketing_analist_location, by = "location")
location <- location[ , -which(names(location) %in% c("Var1.x","Var1.y"))]
colnames(location) <- c("location", "marketeer", "data_analist", "data_scientist", "marketing_analist")

location <- melt(location, id.vars="location")
colnames(location) <- c("location", "Job", "Frequency")
plot_location <- ggplot(location, aes(x= location, y = Frequency, fill=Job)) +
  geom_bar(stat='identity', position='dodge') + coord_flip()
plot_location

