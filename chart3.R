library("dplyr")
library("stringr")
library("ggplot2")

GS_data <- read.csv("~/Downloads/Checkouts_by_Title.csv", stringsAsFactors = FALSE)

most_checked_out_by_year <- GS_data %>% 
  group_by(CheckoutYear) %>% 
  filter(Checkouts == max(Checkouts)) %>% 
  summarize(Checkouts, Title)

ggplot(data = most_checked_out_by_year) +
  geom_histogram(mapping = aes(
    x = CheckoutYear,
    y = Checkouts,
    color = Title
  )) +
  labs(
    title = "Most Checkedouted Geronimo Stilton Book per Year",
    x = "Year",
    y = "Number of Checkouts",
  )
