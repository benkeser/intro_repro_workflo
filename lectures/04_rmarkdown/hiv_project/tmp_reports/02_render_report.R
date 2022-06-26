library(rmarkdown)
render('hiv_report.Rmd')

# now in production mode
render('hiv_report.Rmd',
  params = list(production = TRUE),
  output_file = 'hiv_report_production.html'
)

# in production mode with different cutpoint
render('hiv_report.Rmd',
  params = list(production = TRUE,
                cutpoint = 0.5),
  output_file = 'hiv_report_production_cutpoint.html'
)