library(here)
i_am("code/04_render_report.R")

library(rmarkdown)

render(here('hiv_report.Rmd'),
  params = list(production = TRUE),
  output_file = 'hiv_report_production.html'
)