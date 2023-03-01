library("dplyr")
library("stringr")
library("ggplot2")

GS_data <- read.csv("~/Downloads/Checkouts_by_Title.csv", stringsAsFactors = FALSE)
GS_data$Title <- gsub("/.*","", GS_data$Title)
GS_data$Title <- gsub("[.*]","", GS_data$Title)

most_checked_out_by_year <- GS_data %>% 
  filter(CheckoutYear > '2012' & CheckoutYear < '2018') %>% 
  group_by(CheckoutYear) %>% 
  filter(Checkouts == max(Checkouts)) %>% 
  summarize(Checkouts, Title, CheckoutYear)

ggplot(data = most_checked_out_by_year) +
  geom_point(mapping = aes(
    x = CheckoutYear,
    y = Checkouts,
    color = Title
  )) +
  labs(
    title = "Most Checkedout Geronimo Stilton Book per Year",
    x = "Year",
    y = "Number of Checkouts",
  ) + 
  scale_y_continuous(expand = c(0, 0), limits = c(0, 60))
