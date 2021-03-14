# Copy the raw data into input folder 
# This step really depends on how files are shared across the different stages (e.g. if whole pipeline
# is on a single machine, could directly access data from data directory)
file.copy("../../data/indeed/postings_13.03.21.csv","../../gen/data-preparation/input/postings_13.03.21.csv")
file.copy("../../data/indeed/descriptions_13.03.21.csv","../../gen/data-preparation/input/descriptions_13.03.21.csv")
