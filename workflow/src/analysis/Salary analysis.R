
randstadsteden <- c("Amsterdam", "Utrecht", "Rotterdam", "Den Haag", "Amstelveen", "Schiphol", "Delft", "Amersfoort", "Almere", "Zaanstad", "Zaandam", "Zoetermeer", "Dordrecht", "Leiden", "Haarlemmermeer", "Nieuwegein", "Alphen aan de Rijn", "Westland", "Alkmaar", "Purmerend", "Schiedam", "Hoorn", "Vlaardingen", "Gouda")
df_new <- df %>% mutate(randstad = ifelse (df$location %in% randstadsteden, 1,  0))
df_new$randstad <- df_new$df$randstad <- ifelse (df$location %in% randstadsteden, 1,  0)

t.test <- t.test(df_new$output ~ df_new$randstad, mu=0, alt = "two.sided", conf = 0.95, var.eq = F, paired = F)



df_new = subset(df_new, select = -c(df))

library(dplyr)
library(stringr)
df <- df %>%
  mutate(location_trimmed = str_remove(location, "-Zuidoost"))
words_to_remove <- c("-Zuidoost", "Centrum", "noord", "zuid", "Zuid", "Noord", "Binnenstad", "-Zuid", "-Noord", "")   
df <- df %>%
  mutate(location_trimmed = str_remove_all(location, regex(str_c(words_to_remove, collapse = '|'), ignore_case = T)))

df <- df %>%
  mutate(location_trimmed = str_replace_all(location_trimmed, "Holland-", "Rotterdam"))


df <- df %>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Amsterdam ", "Amsterdam"))

df <- df %>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Schiphol", "Amsterdam"))

df <- df %>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Randstad", "Amsterdam"))

df <- df %>% 
  mutate(location_trimmed = str_replace_all(location_trimmed, "Nederland", "Amsterdam"))

average_salaries <- df %>% 
  group_by(location_trimmed) %>%                 
  summarise(average_salary = mean(output)) 

highest_average_salary_cities <- average_salaries %>%
  filter(average_salaries$average_salary > 50000)

plot_highest_salary_by_location <- ggplot(highest_average_salary_cities, aes(x = location_trimmed, y = average_salary)) + geom_bar(stat='identity') + coord_flip()
plot_highest_salary_by_location




