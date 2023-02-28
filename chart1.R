library("dplyr")
library("stringr")
library("ggplot2")
library("RColorBrewer")
library("tidyverse")


GS_data <- read.csv("~/Downloads/Checkouts_by_Title.csv", stringsAsFactors = FALSE)

checkouts_per_year <- GS_data %>%
  mutate(date = paste0(CheckoutYear, "-", CheckoutMonth, "-01")) %>%
  mutate(date = as.Date(date, format = "%Y-%m-%d")) %>%
  group_by(UsageClass, date) %>%
  summarize(sum = sum(Checkouts))

ggplot(data = checkouts_per_year) +
  geom_line(mapping = aes(
    x = date,
    y = sum,
    color = UsageClass
  )) +
  labs(
    title = "Number Geronimo Stilton Book Checkouts per Year by Usage Class",
    x = "Year",
    y = "Number of Checkouts",
  )

