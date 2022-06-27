output/data_clean.rds: code/00_clean_data.R
	Rscript code/00_clean_data.R

output/table1.rds: code/01_table1.R output/data_clean.rds
	Rscript code/01_table1.R