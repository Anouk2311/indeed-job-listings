#location frequency analysis
data_scientist_location <- read.csv("../../gen/data-preparation/output/data_scientist_clean.csv")
data_analist_location <- read.csv("../../gen/data-preparation/output/data_analist_clean.csv")
marketing_analist_location <- read.csv("../../gen/data-preparation/output/marketing_analist_clean.csv")
marketeer_location <- read.csv("../../gen/data-preparation/output/marketeer_clean.csv")


best_location <- function(dataset) {
  dataset <- as.data.frame(table(dataset$location))
  dataset <- dataset %>% filter(Freq > 10)
    }

data_scientist_best_location <- best_location(data_scientist_location)
data_analist_best_location<- best_location(data_analist_location)
marketing_analist_best_location <- best_location(marketing_analist_location)
marketeer_best_location <- best_location(marketeer_location)

#combined plot

location <- merge(marketeer_best_location, data_analist_best_location, by = "Var1")
location <- merge(location, data_scientist_best_location, by = "Var1")
location <- merge(location, marketing_analist_best_location, by = "Var1")
colnames(location) <- c("location", "marketeer", "data_analist", "data_scientist", "marketing_analist")

location <- melt(location, id.vars="location")
colnames(location) <- c("location", "Job", "Frequency")
plot(plot_location <- ggplot(location, aes(x= location, y = Frequency, fill=Job)) +
  geom_bar(stat='identity', position='dodge') + coord_flip())


