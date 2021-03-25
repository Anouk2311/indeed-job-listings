prep: ../../gen/data-preparation/output/data_analist_clean.csv ../../gen/data-preparation/output/data_scientist_clean.csv ../../gen/data-preparation/output/marketing_analist_clean.csv ../../gen/data-preparation/output/marketeer_clean.csv

# output clean data analist
../../gen/data-preparation/output/data_analist_clean.csv: clean_data.R ../../gen/data-preparation/temp/data_analist_merged.csv
	Rscript clean_data.R

# output clean data scientist
../../gen/data-preparation/output/data_scientist_clean.csv: clean_data.R ../../gen/data-preparation/temp/data_scientist_merged.csv
	Rscript clean_data.R

# output clean marketing analist
../../gen/data-preparation/output/marketing_analist_clean.csv: clean_data.R ../../gen/data-preparation/temp/marketing_analist_merged.csv
	Rscript clean_data.R

# output clean marketeer
../../gen/data-preparation/output/marketeer_clean.csv: clean_data.R ../../gen/data-preparation/temp/marketeer_merged.csv
	Rscript clean_data.R
	

# output temp merged data analist
../../gen/data-preparation/temp/data_analist_merged.csv: merge_data.R ../../data/data-analist
	Rscript merge_data.R

# output temp merged data scientist
../../gen/data-preparation/temp/data_scientist_merged.csv: merge_data.R ../../data/data-scientist
	Rscript merge_data.R

# output temp merged marketing analist
../../gen/data-preparation/temp/marketing_analist_merged.csv: merge_data.R ../../data/marketing-analist
	Rscript merge_data.R

# output temp merged marketeer
../../gen/data-preparation/temp/marketeer_merged.csv: merge_data.R ../../data/marketeer
	Rscript merge_data.R


# download datasets
../../data/data-analist ../../data/data-scientist ../../data/marketing-analist ../../data/marketeer: download_data.R
	Rscript download_data.R