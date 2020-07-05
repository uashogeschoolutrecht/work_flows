####################################
# R-code that reproduces the Graph
# ont he Shipman murders, adapted
# from the Book "The Art of Statistics" by
# Sr. Prof. Dr. David Spiegelhalter
# Data and codefrom: https://github.com/dspiegel29/ArtofStatistics

library(tidyverse)
library(ggExtra)
library(janitor)


shipman_murders <- read_csv(
  here::here(
    "data",
    "D030",
    "00-1-shipman-confirmed-victims-x.csv"
  )
) %>%
  janitor::clean_names()

plot <- shipman_murders %>%
  ggplot(aes(
    x = fractional_death_year,
    y = age,
    colour = reorder(gender2, gender)
  )) +      
  geom_point(size = 2) +
  labs(x = "Year", y = "Age of victim") +
  scale_x_continuous(breaks = seq(1975, 1995, 5),
                     limits = c(1974, 1998)) +
  scale_y_continuous(breaks = seq(40, 90, 10), limits = c(39, 95)) +
  scale_size_continuous(name = "Size", guide = FALSE) +
  scale_colour_brewer(palette = "Set1")  + 
  theme_bw() +
  theme(
    legend.position = c(0.125, 1.12),
    legend.background = element_rect(colour = "black"),
    legend.title = element_blank()) +
  ggtitle("Shipman murders")

ggMarginal(plot, type="histogram")