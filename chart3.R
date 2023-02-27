library("dplyr")
library("stringr")
library("ggplot2")

checkouts <- read.csv("~/Downloads/Checkouts_by_Title.csv", stringsAsFactors = FALSE)
checkouts[checkouts == ""] <- NA
