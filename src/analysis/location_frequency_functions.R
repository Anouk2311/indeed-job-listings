#location frequency analysis
data_scientist_location <- read.csv("../../gen/data-preparation/output/data_scientist_clean.csv")
data_analist_location <- read.csv("../../gen/data-preparation/output/data_analist_clean.csv")
marketing_analist_location <- read.csv("../../gen/data-preparation/output/marketing_analist_clean.csv")
marketeer_location <- read.csv("../../gen/data-preparation/output/marketeer_clean.csv")


plot <- function(dataset) {
  dataset <- as.data.frame(table(dataset$location))
  dataset <- dataset %>% filter(Freq > 10)
  dataset$location <- dataset$Var1
  dataset_plot <- ggplot(dataset, aes(x= location, y = Freq)) + geom_bar(stat="identity") + coord_flip()  
  }


data_scientist_plot <- plot(data_scientist_location)
data_analist_plot <- plot(data_analist_location)
marketing_analist_plot <- plot(marketing_analist_location)
marketeer_plot <- plot(marketeer_location)

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

