### create directories --------------------------------------------------------
dir.create('../../data')
dir.create('../../data/data-analist')
dir.create('../../data/data-scientist')
dir.create('../../data/marketing-analist')
dir.create('../../data/marketeer')


### download data and save to disk --------------------------------------------
## download datasets data analist ---------------------------------------------
# job postings

# job descriptions


## download datasets data scientist -------------------------------------------
# job postings

# job descriptions


## download datasets marketing analist ----------------------------------------
# job postings
download.file("https://raw.githubusercontent.com/Anouk2311/indeed-job-listings/main/scraped%20data/marketing-analist/postings.csv",
              '../../data/marketing-analist/marketing-analist-listings.csv')

# job descriptions part 1
download.file("https://raw.githubusercontent.com/Anouk2311/indeed-job-listings/main/scraped%20data/marketing-analist/descriptions_alternative1.csv",
              '../../data/marketing-analist/marketing-analist-descriptions-1.csv')

# job descriptions part 2
download.file("https://raw.githubusercontent.com/Anouk2311/indeed-job-listings/main/scraped%20data/marketing-analist/descriptions_alternative1_145_250.csv",
              '../../data/marketing-analist/marketing-analist-descriptions-145-250.csv')

# job descriptions part 3
download.file("https://raw.githubusercontent.com/Anouk2311/indeed-job-listings/main/scraped%20data/marketing-analist/descriptions_alternative1_225_300.csv",
              '../../data/marketing-analist/marketing-analist-descriptions-225-300.csv')

# job descriptions part 4
download.file("https://raw.githubusercontent.com/Anouk2311/indeed-job-listings/main/scraped%20data/marketing-analist/descriptions_alternative1_300_375.csv",
              '../../data/marketing-analist/marketing-analist-descriptions-300-375.csv')

# job descriptions part 5
download.file("https://raw.githubusercontent.com/Anouk2311/indeed-job-listings/main/scraped%20data/marketing-analist/descriptions_alternative1_375_450.csv",
              '../../data/marketing-analist/marketing-analist-descriptions-375-450.csv')

# job descriptions part 6
download.file("https://raw.githubusercontent.com/Anouk2311/indeed-job-listings/main/scraped%20data/marketing-analist/descriptions_alternative1_450_510.csv",
              '../../data/marketing-analist/marketing-analist-descriptions-450-510.csv')

# job descriptions part 7
download.file("https://raw.githubusercontent.com/Anouk2311/indeed-job-listings/main/scraped%20data/marketing-analist/descriptions_alternative1_510.csv",
              '../../data/marketing-analist/marketing-analist-descriptions-510.csv')


## download datasets marketeer ------------------------------------------------
# job postings

# job descriptions



