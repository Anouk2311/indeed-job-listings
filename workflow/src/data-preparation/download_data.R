### create directories --------------------------------------------------------
dir.create('../../data')
dir.create('../../data/data-analist')
dir.create('../../data/data-scientist')
dir.create('../../data/marketing-analist')
dir.create('../../data/marketeer')


### download data and save to disk --------------------------------------------
## download datasets data analist ---------------------------------------------
# job postings
download.file("https://raw.githubusercontent.com/Anouk2311/indeed-job-listings/main/scraped%20data/data-analist/postings.csv",
              '../../data/data-analist/data-analist-listings.csv')

# job descriptions part 1
download.file("https://raw.githubusercontent.com/Anouk2311/indeed-job-listings/main/scraped%20data/data-analist/descriptions_alternative1_0_162.csv",
              '../../data/data-analist/data-analist-descriptions-0-162.csv')

# job descriptions part 2
download.file("https://raw.githubusercontent.com/Anouk2311/indeed-job-listings/main/scraped%20data/data-analist/descriptions_alternative1_162_220.csv",
              '../../data/data-analist/data-analist-descriptions-162-220.csv')

# job descriptions part 3
download.file("https://raw.githubusercontent.com/Anouk2311/indeed-job-listings/main/scraped%20data/data-analist/descriptions_alternative1_220_300.csv",
              '../../data/data-analist/data-analist-descriptions-220-300.csv')

# job descriptions part 4
download.file("https://raw.githubusercontent.com/Anouk2311/indeed-job-listings/main/scraped%20data/data-analist/descriptions_alternative1_300_400.csv",
              '../../data/data-analist/data-analist-descriptions-300-400.csv')

# job descriptions part 5
download.file("https://raw.githubusercontent.com/Anouk2311/indeed-job-listings/main/scraped%20data/data-analist/descriptions_alternative1_400_500.csv",
              '../../data/data-analist/data-analist-descriptions-400-500.csv')

# job descriptions part 6
download.file("https://raw.githubusercontent.com/Anouk2311/indeed-job-listings/main/scraped%20data/data-analist/descriptions_alternative1_500_600.csv",
              '../../data/data-analist/data-analist-descriptions-500-600.csv')

# job descriptions part 7
download.file("https://raw.githubusercontent.com/Anouk2311/indeed-job-listings/main/scraped%20data/data-analist/descriptions_alternative1_600_656.csv",
              '../../data/data-analist/data-analist-descriptions-600-656.csv')

# job descriptions part 8
download.file("https://raw.githubusercontent.com/Anouk2311/indeed-job-listings/main/scraped%20data/data-analist/descriptions_alternative1_656_719.csv",
              '../../data/data-analist/data-analist-descriptions-656-719.csv')

# job descriptions part 9
download.file("https://raw.githubusercontent.com/Anouk2311/indeed-job-listings/main/scraped%20data/data-analist/descriptions_alternative1_719_784.csv",
              '../../data/data-analist/data-analist-descriptions-719-784.csv')

# job descriptions part 10
download.file("https://raw.githubusercontent.com/Anouk2311/indeed-job-listings/main/scraped%20data/data-analist/descriptions_alternative1_784_847.csv",
              '../../data/data-analist/data-analist-descriptions-784-847.csv')

# job descriptions part 11
download.file("https://raw.githubusercontent.com/Anouk2311/indeed-job-listings/main/scraped%20data/data-analist/descriptions_alternative1_847_900.csv",
              '../../data/data-analist/data-analist-descriptions-847-900.csv')

# job descriptions part 12
download.file("https://raw.githubusercontent.com/Anouk2311/indeed-job-listings/main/scraped%20data/data-analist/descriptions_alternative1_900_958.csv",
              '../../data/data-analist/data-analist-descriptions-900-958.csv')

# job descriptions part 13
download.file("https://raw.githubusercontent.com/Anouk2311/indeed-job-listings/main/scraped%20data/data-analist/descriptions_alternative1_958_1020.csv",
              '../../data/data-analist/data-analist-descriptions-958-1020.csv')

# job descriptions part 14
download.file("https://raw.githubusercontent.com/Anouk2311/indeed-job-listings/main/scraped%20data/data-analist/descriptions_alternative1_1020_1080.csv",
              '../../data/data-analist/data-analist-descriptions-1020-1080.csv')

# job descriptions part 15
download.file("https://raw.githubusercontent.com/Anouk2311/indeed-job-listings/main/scraped%20data/data-analist/descriptions_alternative1_1080_1144.csv",
              '../../data/data-analist/data-analist-descriptions-1080-1144.csv')

# job descriptions part 16
download.file("https://raw.githubusercontent.com/Anouk2311/indeed-job-listings/main/scraped%20data/data-analist/descriptions_alternative1_1144_1201.csv",
              '../../data/data-analist/data-analist-descriptions-1144-1201.csv')

# job descriptions part 17
download.file("https://raw.githubusercontent.com/Anouk2311/indeed-job-listings/main/scraped%20data/data-analist/descriptions_alternative1_1201_1223.csv",
              '../../data/data-analist/data-analist-descriptions-1201-1223.csv')


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



