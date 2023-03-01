library("dplyr")
library("stringr")
library("ggplot2")
library("RColorBrewer")
library("tidyverse")


GS_data <- read.csv("~/Downloads/Checkouts_by_Title.csv", stringsAsFactors = FALSE)
GS_data <- GS_data %>%
  filter(MaterialType == "BOOK")
GS_data$Title <- gsub("/.*","", GS_data$Title)


most_checked_out_book <- GS_data %>% 
  group_by(Title) %>%
  summarize(sum = sum(Checkouts)) %>%
  filter(sum == max(sum)) %>%
  pull(Title)

least_checked_out_book <- GS_data %>% 
  group_by(Title) %>%
  summarize(sum = sum(Checkouts)) %>%
  filter(sum == min(sum)) %>%
  pull(Title)

pop <- GS_data %>% 
  filter(Title %in% 
           c(most_checked_out_book, least_checked_out_book)) %>% 
  group_by(Title, CheckoutYear) %>%
  summarize(GS_checkouts = sum(Checkouts))
  

ggplot(data = pop) +
  geom_line(mapping = aes(
    x = CheckoutYear,
    y = GS_checkouts,
    color = Title
  )) +
  labs(
    title = "Comparing Trends of Checkouts for Most and Least Popular Geronimo Stilton Books",
    x = "Date",
    y = "Total Checkouts"
  ) 
  