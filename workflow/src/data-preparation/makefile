prep: ../../gen/data-preparation/output/transformed.csv


../../data/indeed/data-analist.csv: download.R
	Rscript download.R

../../gen/data-preparation/output/transformed.csv: transform.R ../../data/indeed/data-analist.csv
	Rscript transform.R