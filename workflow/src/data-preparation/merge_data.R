### load packages
library(dplyr)

### 1. load datasets into R ---------------------------------------------------
## 1.1 data scientist ---------------------------------------------------------


## 1.2 data analist -----------------------------------------------------------


## 1.3 marketing analist ------------------------------------------------------
# listings
ma_listings <- read.csv("../../data/marketing-analist/marketing-analist-listings.csv", sep=',')

# descriptions
ma_descriptions_1 <- read.csv("../../data/marketing-analist/marketing-analist-descriptions-1.csv", sep=',')
ma_descriptions_2 <- read.csv("../../data/marketing-analist/marketing-analist-descriptions-145-250.csv", sep=',')
ma_descriptions_3 <- read.csv("../../data/marketing-analist/marketing-analist-descriptions-225-300.csv", sep=',')
ma_descriptions_4 <- read.csv("../../data/marketing-analist/marketing-analist-descriptions-300-375.csv", sep=',')
ma_descriptions_5 <- read.csv("../../data/marketing-analist/marketing-analist-descriptions-375-450.csv", sep=',')
ma_descriptions_6 <- read.csv("../../data/marketing-analist/marketing-analist-descriptions-450-510.csv", sep=',')
ma_descriptions_7 <- read.csv("../../data/marketing-analist/marketing-analist-descriptions-510.csv", sep=',')

## 1.4 marketeer --------------------------------------------------------------


### 2. merge on id ------------------------------------------------------------
## 2.1 data scientist ---------------------------------------------------------


## 2.2 data analist -----------------------------------------------------------


## 2.3 marketing analist ------------------------------------------------------
# merge all description datasets into ma_descriptions
ma_descriptions <- ma_descriptions_1 %>%
  union(ma_descriptions_2) %>%
  union(ma_descriptions_3) %>%
  union(ma_descriptions_4) %>%
  union(ma_descriptions_5) %>%
  union(ma_descriptions_6) %>%
  union(ma_descriptions_7) %>%
  filter(description != '') %>%  # remove empty descriptions
  distinct(id, .keep_all = TRUE)  # keep only distinct ids

# merge job listings with descriptions
marketing_analist <- ma_listings %>%
  inner_join(ma_descriptions, by = 'id')

## 2.4 marketeer --------------------------------------------------------------



### 3. save merged data -------------------------------------------------------
# create directories
dir.create('../../gen')
dir.create('../../gen/data-preparation')
dir.create('../../gen/data-preparation/output')

## 3.1 data scientist ---------------------------------------------------------


## 3.2 data analist -----------------------------------------------------------


## 3.3 marketing analist ------------------------------------------------------
write.csv(marketing_analist, '../../gen/data-preparation/output/marketing_analist.csv')

## 3.4 marketeer --------------------------------------------------------------



