output/data_clean.rds: code/00_clean_data.R
	Rscript code/00_clean_data.R

.PHONY: descriptive_analysis
descriptive_analysis: code/02_scatter.R \
  code/01_table1.R \
  output/data_clean.rds
	Rscript code/01_table1.R
	Rscript code/02_scatter.R

# # or if order matters,
# descriptive_analysis: code/02_scatter.R \
#   code/01_table1.R \
#   output/data_clean.rds
# 	Rscript code/01_table1.R && \
# 	Rscript code/02_scatter.R

.PHONY: clean
clean:
	rm output/*.rds