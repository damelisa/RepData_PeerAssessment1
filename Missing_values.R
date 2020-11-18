library(dplyr)
library(rqdatatable)

total_na <- sum(is.na(data$steps))

mean_interval <- data %>% 
  group_by(date) %>%
  mutate(interval_day = 1:n()) %>%
  group_by(interval_day) %>%
  summarise(steps = mean(steps, na.rm = TRUE))

data_corr <- data %>%
  group_by(date) %>%
  mutate(mean = mean_interval$steps) %>%
  mutate(steps = coalesce(steps, mean)) %>%
  select(-mean)

data_total2 <- data_corr %>% 
  group_by(date) %>%
  summarise(steps = mean(steps, na.rm = TRUE))

qplot(data_total2$steps, geom="histogram", xlab = "total steps per day")

mean_steps2 <- mean(data_total2$steps, na.rm=TRUE)
median_steps2 <- median(data_total2$steps, na.rm=TRUE)