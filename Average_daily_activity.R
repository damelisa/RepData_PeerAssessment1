library(dplyr)
library(ggplot2)

data_activity <- data %>% 
  group_by(date) %>%
  mutate(interval = 1:n()) %>%
  group_by(interval) %>%
  summarise(steps = mean(steps, na.rm = TRUE))

ggplot(data_activity, aes(x = interval, y = steps)) + geom_line()

max_interval <- c(data_activity[[which.max(data_activity$steps),1]])
max_interval