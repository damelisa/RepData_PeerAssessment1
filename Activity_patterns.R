library(dplyr)
library(ggplot2)

# Set weekdays from german to english
Sys.setlocale("LC_TIME", "C")
format(Sys.Date(), "%Y-%b-%d")

mean_interval <- data %>% 
  group_by(date) %>%
  mutate(interval_day = 1:n()) %>%
  group_by(interval_day) %>%
  summarise(steps = mean(steps, na.rm = TRUE))

data_corr2 <- data %>%
  group_by(date) %>%
  mutate(mean = mean_interval$steps) %>%
  mutate(steps = coalesce(steps, mean)) %>%
  select(-mean)

#create a vector of weekdays
weekdays1 <- c('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday')

#Use `%in%` and `weekdays` to create a logical vector
#convert to `factor` and specify the `levels/labels`
data_corr2$wDay <- factor((weekdays(data_corr2$date) %in% weekdays1), 
                   levels=c(TRUE, FALSE), labels=c('weekday', 'weekend'))

data_week <- data_corr2 %>%
  group_by(date) %>%
  mutate(interval = 1:n()) %>%
  group_by(wDay, interval) %>%
  summarise(steps = mean(steps, na.rm = TRUE), wDay = wDay, date = date) %>%
  arrange(date)

data_week$wDay <- as.factor(data_week$wDay)

ggplot(data_week, aes(x = interval, y = steps)) + geom_line() + facet_grid(wDay~.)