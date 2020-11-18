unzip("activity.zip")
data <- read.csv("activity.csv")4
summary(data)
data$date <- as.Date(data$date, "%Y-%m-%d")