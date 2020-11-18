library(dplyr)
library(ggplot2)

data_total <- data %>% 
  group_by(date) %>%
  summarise(steps = mean(steps, na.rm = TRUE))

qplot(data_total$steps, geom="histogram", xlab = "total steps per day")

mean_steps <- mean(data_total$steps, na.rm=TRUE)
median_steps <- median(data_total$steps, na.rm=TRUE)