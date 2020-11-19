library(dplyr)
library(ggplot2)

data_total <- data %>% 
  group_by(date) %>%
  summarise(steps = sum(steps, na.rm = TRUE))

qplot(data_total$steps, geom="histogram", xlab = "total steps per day", bins = 30)

mean_steps <- mean(data_total$steps, na.rm=TRUE)
median_steps <- median(data_total$steps, na.rm=TRUE)