## NO INPUT

## TRANSFORMATION
# create directories
dir.create('../../data')
dir.create('../../data/indeed')

## OUTPUT
# Download data and save to disk
# Download dataset data-analist
download.file("https://raw.githubusercontent.com/Anouk2311/oDCMscraper/main/data/listings.csv",'../../data/indeed/data-analist.csv')
### CHANGE TO CORRECT LINK WITH FINISHED DATASET