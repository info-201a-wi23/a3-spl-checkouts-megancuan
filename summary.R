GS_data <- read.csv("~/Downloads/Checkouts_by_Title.csv", stringsAsFactors = FALSE)
GS_data$Title <- gsub("/.*","", GS_data$Title)

library(dplyr)
library(stringr)

# In the SPL, what Geronimo Stilton book written has the highest number of checkouts?
most_checked_out_book <- GS_data %>% 
  filter(MaterialType == "BOOK") %>% 
  group_by(Title) %>%
  summarize(sum = sum(Checkouts)) %>%
  filter(sum == max(sum)) %>%
  pull(Title)

# In the SPL, what Geronimo Stilton book written has the lowest number of checkouts?
least_checked_out_book <- GS_data %>% 
  filter(MaterialType == "BOOK") %>% 
  group_by(Title) %>%
  summarize(sum = sum(Checkouts)) %>%
  filter(sum == min(sum)) %>%
  pull(Title)

# In the SPL, what month does Geronimo Stilton has the highest number of checkouts?
month_most_checkouts <- GS_data %>% 
  group_by(CheckoutMonth) %>% 
  summarize(sum = sum(Checkouts)) %>%
  filter(sum == max(sum, na.rm = TRUE)) %>%
  pull(CheckoutMonth)

# In the SPL, what month does Geronimo Stilton has the lowest number of checkouts?
month_least_checkouts <- GS_data %>% 
  group_by(CheckoutMonth) %>% 
  summarize(sum = sum(Checkouts)) %>%
  filter(sum == min(sum, na.rm = TRUE)) %>%
  pull(CheckoutMonth)

# In the SPL, what Geronimo Stilton book written has the highest number of checkouts in 2011, the year that I was reading these books?
most_checked_out_2011 <- GS_data %>% 
  group_by(CheckoutYear == "2011") %>% 
  filter(Checkouts == max(Checkouts)) %>% 
  pull(Title)

