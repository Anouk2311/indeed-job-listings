library(dplyr)

# load data
dataanalist <- read.csv('../../data/indeed/data-analist.csv', sep = ',')

### INSERT DATA PREP PART

# create directory
dir.create('../../gen')
dir.create('../../gen/data-preparation')
dir.create('../../gen/data-preparation/output')
write.table(dataanalist, '../../gen/data-preparation/output/transformed.csv', sep = ',')  # CHANGE NAME LATER
