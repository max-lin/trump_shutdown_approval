library(dplyr)
library(knitr)
library(ggplot2)

dat <- read.csv("C:/Users/jyz2/Downloads/wEoW - For stata.csv")

presd <- filter(dat,between(enddate, 20181119, 20181221))
attach(presd)
b_0 <- mean(presd$approve)

ggplot(presd) + 
  aes(presd$avgdate, presd$approve) +
  geom_point() +
  geom_abline(slope = 0, intercept = b_0, color = "red") +
  theme(axis.text.x = element_text(angle = 90, hjust =1)) +
  labs(title = "Approval Rating With Fitted Regression",
        x = "pre-shutdown",
        y = "approval")







