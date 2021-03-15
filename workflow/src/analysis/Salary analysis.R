randstadsteden <- c("Amsterdam", "Utrecht", "Rotterdam", "Den Haag", "Amstelveen", "Schiphol", "Delft", "Amersfoort", "Almere", "Zaanstad", "Zaandam", "Zoetermeer", "Dordrecht", "Leiden", "Haarlemmermeer", "Nieuwegein", "Alphen aan de Rijn", "Westland", "Alkmaar", "Purmerend", "Schiedam", "Hoorn", "Vlaardingen", "Gouda")
df_new <- df %>% mutate(randstad = ifelse (df$Location %in% randstadsteden, 1,  0))
df_new$randstad <- df_new$df$randstad <- ifelse (df$Location %in% randstadsteden, 1,  0)

#df$new.col[df$Location == "Amsterdam" | df$Location == "Rotterdam" | df$Location == "Amstelveen" | df$Location == "Utrecht" | df$Location == "Den Haag"] <- "1"
#df$new.col <- ifelse(df$new.col == "1", 1, 0)
#df_new$randstad <- as.factor(df_new$randstad)
#mean(df_new$output)
#df_new2 <- df_new %>% filter(df_new$randstad == 1)
#mean(df_new2$output)

#df_new3 <- df_new %>% filter(df_new$randstad == 0)
#mean(df_new3$output)
#sd(df_new3$output)

#sd(df_new2$output)

#summary(df_new3)

#t.test((mean(df_new3$output)) ~ (mean(df_new2$output)))

#salary <- data.frame(df_new3$output, df_new2$output)

x<- t.test(df_new$output ~ df_new$randstad, mu=0, alt = "two.sided", conf = 0.95, var.eq = F, paired = F)
x


mean(df_new$randstad)
df_new = subset(df_new, select = -c(df))
df_new = subset(df_new, select = -c(new.col))

x2<- as.data.frame(table(df_new$Location))
x3 <- x2 %>% filter(Freq > 10)
plot <- ggplot(x3, aes(x = Var1,  alpha = Freq)) + geom_bar()  
plot
