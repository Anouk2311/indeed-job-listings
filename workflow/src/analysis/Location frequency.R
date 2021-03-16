#location analysis
getwd()
setwd("C:/Users/asus/Documents/studie/Project")
df1 <- read.csv("./data_cleaned.csv")
df5 <- df1 %>% distinct(id, .keep_all = TRUE)
x2<- as.data.frame(table(df5$location))
x3 <- x2 %>% filter(Freq > 10)
x3
plot <- ggplot(x3, aes(x = Var1, y = Freq)) + geom_bar(stat="identity") + coord_flip()  
plota
