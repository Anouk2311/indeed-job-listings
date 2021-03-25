analyze: ../../gen/analysis/output/analysis.html


../../gen/analysis/outputanalysis.html: directory.R
	Rscript directory.R

../../gen/analysis/output/analysis.html: analysis.Rmd ../../gen/data-preparation/output/transformed.csv
	R -e "rmarkdown::render('analysis.Rmd', output_file = '../../gen/analysis/output/analysis.html')"