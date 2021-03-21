#location analysis

df_ds <- read.csv("./data_scientist_clean.csv")
df_da <- read.csv("./data_analist_clean.csv")
df_ma <- read.csv("./marketing_analist_clean.csv")
df_m <- read.csv("./marketeer_clean.csv")

#location frequency data science
df_ds_2<- as.data.frame(table(df_ds$location))
df_ds_3 <- df_ds_2 %>% filter(Freq > 10)
df_ds_3
df_ds_plot <- ggplot(df_ds_3, aes(x = Var1, y = Freq)) + geom_bar(stat="identity") + coord_flip()  
plot


#location frequency data analist

df_da_2<- as.data.frame(table(df_da$location))
df_da_3 <- df_da_2 %>% filter(Freq > 10)
df_da_3
df_da_plot <- ggplot(df_da_3, aes(x = Var1, y = Freq)) + geom_bar(stat="identity") + coord_flip()  
df_da_plot

#location frequency marketing analist
df_ma_2<- as.data.frame(table(df_dm$location))
df_dm_3 <- df_dm_2 %>% filter(Freq > 10)
df_dm_3
df_dm_plot <- ggplot(df_dm_3, aes(x = Var1, y = Freq)) + geom_bar(stat="identity") + coord_flip()  
df_dm_plot

#location frequency marketeer
df_m_2<- as.data.frame(table(df_m$location))
df_m_3 <- df_m_2 %>% filter(Freq > 10)
df_m_3
df_m_plot <- ggplot(df_m_3, aes(x = Var1, y = Freq)) + geom_bar(stat="identity") + coord_flip()  
df_m_plot