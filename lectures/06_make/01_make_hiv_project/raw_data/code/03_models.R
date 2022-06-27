library(here)
i_am("code/03_models.R")
data <- readRDS(here("output", "data_clean.rds"))

mod <- glm(
  ab_resistance ~ shield_glycans + region + env_length,
  data = data
)

# read arguments passed from command line
args <- commandArgs(TRUE)
cutpoint <- as.numeric(args[[1]])

binary_mod <- glm(
  I(ab_resistance > cutpoint) ~ shield_glycans + region + env_length,
  data = data, 
  family = binomial()
)

models <- list(
  primary = mod,
  secondary = binary_mod,
  secondary_cutpoint = cutpoint
)

saveRDS(
  models,
  file = here("output", "models.rds")
)