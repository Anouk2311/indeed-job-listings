#location frequency analysis
data_scientist_location <- read.csv("../../gen/data-preparation/output/data_scientist_clean.csv")
data_analist_location <- read.csv("../../gen/data-preparation/output/data_analist_clean.csv")
marketing_analist_location <- read.csv("../../gen/data-preparation/output/marketing_analist_clean.csv")
marketeer_location <- read.csv("../../gen/data-preparation/output/marketeer_clean.csv")


plotting <- function(dataset) {
  dataset <- as.data.frame(table(dataset$location))
  dataset <- dataset %>% filter(Freq > 10)
  dataset$location <- dataset$Var1
  dataset_plot <- ggplot(dataset, aes(x= location, y = Freq)) + geom_bar(stat="identity") + coord_flip()  
}


plot_data_scientist_location <- plot(data_scientist_plot <- plotting(data_scientist_location))
plot_data_analist_location <- plot(data_analist_plot <- plotting(data_analist_location))
plot_marketing_analist_location <- plot(marketing_analist_plot <- plotting(marketing_analist_location))
plot_marketeer_location <- plot(marketeer_plot <- plotting(marketeer_location))

pdf(here("gen","data-preparation", "input", "plot_data_scientist_location.pdf"))
print(plot_data_scientist_location)
dev.off()

pdf(here("gen","data-preparation", "input", "plot_data_analist_location.pdf"))
print(plot_data_analist_location)
dev.off()

pdf(here("gen","data-preparation", "input", "plot_marketing_analist_location.pdf"))
print(plot_marketing_analist_location)
dev.off()

pdf(here("gen","data-preparation", "input", "plot_marketeer_location.pdf"))
print(plot_marketeer_location)
dev.off()
