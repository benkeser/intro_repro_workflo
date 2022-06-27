report: code/04_render_report.R \
	output/data_clean.rds \
	output/table1.rds \
	figs/scatter.png \
	output/models.rds
	Rscript $<

output/data_clean.rds: code/00_clean_data.R
	Rscript $<

output/table1.rds: code/01_table1.R output/data_clean.rds
	Rscript $<

figs/scatter.png: code/02_scatter.R output/data_clean.rds
	Rscript $<

output/models.rds: code/03_models.R output/data_clean.rds
	# pass in default option for cutpoint of 1
	Rscript $< 1

.PHONY: clean
clean:
	rm -f output/*.rds
	rm -f figs/*.png
	rm -f *.html