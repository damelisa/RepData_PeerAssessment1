unzip("activity.zip")
data <- read.csv("activity.csv")
summary(data)
data$date <- as.Date(data$date, "%Y-%m-%d")