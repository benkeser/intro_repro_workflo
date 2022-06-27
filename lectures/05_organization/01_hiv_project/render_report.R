library(rmarkdown)

render('hiv_report.Rmd',
  params = list(production = TRUE),
  output_file = 'hiv_report_production.html'
)