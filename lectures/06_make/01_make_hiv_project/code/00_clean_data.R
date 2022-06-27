library(here)
i_am("code/00_clean_data.R")
full_file_path <- here("raw_data", "vrc01_data.csv")
data <- read.csv(full_file_path, header = TRUE)

# label variables
labelled::var_label(data) <- list(
  id = "ID",
  ab_resistance = "Antibody resistance",
  shield_glycans = "Shield glycans",
  region = "Region",
  env_length = "Length of Env protein"
)

data$number_glycans <- ifelse(data$shield_glycans < 4, "< 4", ">= 4")

saveRDS(
  data, file = here("output", "data_clean.rds")
)