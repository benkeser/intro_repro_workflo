library(here)
i_am("code/01_table1.R")
data <- readRDS(here("output", "data_clean.rds"))

library(gtsummary)

table_one <- data |> 
  select("region", "env_length", "ab_resistance", "number_glycans") |>
  tbl_summary(by = number_glycans) |> 
  modify_spanning_header(c("stat_1", "stat_2") ~ "**No. PNGs in Glycan Shield**") |>
  add_overall() |>
  add_p()

saveRDS(
  table_one,
  file = here("output", "table1.rds")
)