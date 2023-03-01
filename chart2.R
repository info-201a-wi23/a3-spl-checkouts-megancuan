library("dplyr")
library("stringr")
library("ggplot2")

GS_data <- read.csv("~/Downloads/Checkouts_by_Title.csv", stringsAsFactors = FALSE)

GS_material <- GS_data %>%
  group_by(MaterialType, CheckoutYear) %>%
  summarize(sum = sum(Checkouts))

ggplot(data = GS_material) +
  geom_line(
    mapping = aes(x = CheckoutYear, 
                  y = sum, 
                  color = MaterialType)
  ) +
  labs(title = "Checkouts over Time by Material", 
       x = "Date", 
       y = "Checkouts",
       color = "Material Type"
       )+
  scale_color_brewer(palette = "Set1")
