### load packages
library(dplyr)

### 1. load datasets into R ---------------------------------------------------
## 1.1 data scientist ---------------------------------------------------------
# listings

# descriptions

## 1.2 data analist -----------------------------------------------------------
# listings
da_listings <- read.csv("../../data/data-analist/data-analist-listings.csv", sep=',')

#descriptions
da_descriptions_1 <- read.csv("../../data/data-analist/data-analist-descriptions-0-162.csv", sep=',')
da_descriptions_2 <- read.csv("../../data/data-analist/data-analist-descriptions-162-220.csv", sep=',')
da_descriptions_3 <- read.csv("../../data/data-analist/data-analist-descriptions-220-300.csv", sep=',')
da_descriptions_4 <- read.csv("../../data/data-analist/data-analist-descriptions-300-400.csv", sep=',')
da_descriptions_5 <- read.csv("../../data/data-analist/data-analist-descriptions-400-500.csv", sep=',')
da_descriptions_6 <- read.csv("../../data/data-analist/data-analist-descriptions-500-600.csv", sep=',')
da_descriptions_7 <- read.csv("../../data/data-analist/data-analist-descriptions-600-656.csv", sep=',')
da_descriptions_8 <- read.csv("../../data/data-analist/data-analist-descriptions-656-719.csv", sep=',')
da_descriptions_9 <- read.csv("../../data/data-analist/data-analist-descriptions-719-784.csv", sep=',')
da_descriptions_10 <- read.csv("../../data/data-analist/data-analist-descriptions-784-847.csv", sep=',')
da_descriptions_11 <- read.csv("../../data/data-analist/data-analist-descriptions-847-900.csv", sep=',')
da_descriptions_12 <- read.csv("../../data/data-analist/data-analist-descriptions-900-958.csv", sep=',')
da_descriptions_13 <- read.csv("../../data/data-analist/data-analist-descriptions-958-1020.csv", sep=',')
da_descriptions_14 <- read.csv("../../data/data-analist/data-analist-descriptions-1020-1080.csv", sep=',')
da_descriptions_15 <- read.csv("../../data/data-analist/data-analist-descriptions-1080-1144.csv", sep=',')
da_descriptions_16 <- read.csv("../../data/data-analist/data-analist-descriptions-1144-1201.csv", sep=',')
da_descriptions_17 <- read.csv("../../data/data-analist/data-analist-descriptions-1201-1223.csv", sep=',')

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
# listings

# descriptions

### 2. merge ------------------------------------------------------------------
## 2.1 data scientist ---------------------------------------------------------


## 2.2 data analist -----------------------------------------------------------
# merge all description datasets into da_descriptions
da_descriptions <- da_descriptions_1 %>%
  union(da_descriptions_2) %>%
  union(da_descriptions_3) %>%
  union(da_descriptions_4) %>%
  union(da_descriptions_5) %>%
  union(da_descriptions_6) %>%
  union(da_descriptions_7) %>%
  union(da_descriptions_8) %>%
  union(da_descriptions_9) %>%
  union(da_descriptions_10) %>%
  union(da_descriptions_11) %>%
  union(da_descriptions_12) %>%
  union(da_descriptions_13) %>%
  union(da_descriptions_14) %>%
  union(da_descriptions_15) %>%
  union(da_descriptions_16) %>%
  union(da_descriptions_17) %>%
  filter(description != '') %>%  # remove empty descriptions
  distinct(id, .keep_all = TRUE)  # keep only distinct ids

# merge job listings with descriptions
data_analist <- da_listings %>%
  inner_join(da_descriptions, by = 'id')

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
write.csv(data_analist, '../../gen/data-preparation/output/data_analist.csv')

## 3.3 marketing analist ------------------------------------------------------
write.csv(marketing_analist, '../../gen/data-preparation/output/marketing_analist.csv')

## 3.4 marketeer --------------------------------------------------------------



