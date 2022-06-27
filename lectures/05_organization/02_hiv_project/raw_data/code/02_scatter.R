library(here)
i_am("code/02_scatter.R")
data <- readRDS(here("output", "data_clean.rds"))

library(ggplot2)

plot <- 
  ggplot(data, aes(x = shield_glycans, y = ab_resistance)) + 
    geom_point() +
    geom_smooth(method = lm) + 
    theme_bw()

ggsave(
  here("figs", "scatter.png"),
  plot = plot,
  device = "png"
)