### load packages
library(dplyr)

### 1. load datasets into R ---------------------------------------------------
## 1.1 data scientist ---------------------------------------------------------
# listings
ds_listings <- read.csv("../../data/data-scientist/data-scientist-listings.csv", sep=',')

# descriptions
ds_descriptions_1 <- read.csv("../../data/data-scientist/data-scientist-descriptions-1.csv", sep=',')
ds_descriptions_2 <- read.csv("../../data/data-scientist/data-scientist-descriptions-2.csv", sep=',')
ds_descriptions_3 <- read.csv("../../data/data-scientist/data-scientist-descriptions-3.csv", sep=',')
ds_descriptions_4 <- read.csv("../../data/data-scientist/data-scientist-descriptions-4.csv", sep=',')
ds_descriptions_5 <- read.csv("../../data/data-scientist/data-scientist-descriptions-5.csv", sep=',')
ds_descriptions_6 <- read.csv("../../data/data-scientist/data-scientist-descriptions-6.csv", sep=',')
ds_descriptions_7 <- read.csv("../../data/data-scientist/data-scientist-descriptions-7.csv", sep=',')
ds_descriptions_8 <- read.csv("../../data/data-scientist/data-scientist-descriptions-8.csv", sep=',')
ds_descriptions_9 <- read.csv("../../data/data-scientist/data-scientist-descriptions-9.csv", sep=',')
ds_descriptions_10 <- read.csv("../../data/data-scientist/data-scientist-descriptions-10.csv", sep=',')
ds_descriptions_11 <- read.csv("../../data/data-scientist/data-scientist-descriptions-11.csv", sep=',')
ds_descriptions_12 <- read.csv("../../data/data-scientist/data-scientist-descriptions-12.csv", sep=',')
ds_descriptions_13 <- read.csv("../../data/data-scientist/data-scientist-descriptions-13.csv", sep=',')
ds_descriptions_14 <- read.csv("../../data/data-scientist/data-scientist-descriptions-14.csv", sep=',')
ds_descriptions_15 <- read.csv("../../data/data-scientist/data-scientist-descriptions-15.csv", sep=',')
ds_descriptions_16 <- read.csv("../../data/data-scientist/data-scientist-descriptions-16.csv", sep=',')
ds_descriptions_17 <- read.csv("../../data/data-scientist/data-scientist-descriptions-17.csv", sep=',')
ds_descriptions_18 <- read.csv("../../data/data-scientist/data-scientist-descriptions-18.csv", sep=',')
ds_descriptions_19 <- read.csv("../../data/data-scientist/data-scientist-descriptions-19.csv", sep=',')
ds_descriptions_20 <- read.csv("../../data/data-scientist/data-scientist-descriptions-20.csv", sep=',')
ds_descriptions_21 <- read.csv("../../data/data-scientist/data-scientist-descriptions-21.csv", sep=',')

## 1.2 data analist -----------------------------------------------------------
# listings
da_listings <- read.csv("../../data/data-analist/data-analist-listings.csv", sep=',')

# descriptions
da_descriptions_1 <- read.csv("../../data/data-analist/data-analist-descriptions-1.csv", sep=',')
da_descriptions_2 <- read.csv("../../data/data-analist/data-analist-descriptions-2.csv", sep=',')
da_descriptions_3 <- read.csv("../../data/data-analist/data-analist-descriptions-3.csv", sep=',')
da_descriptions_4 <- read.csv("../../data/data-analist/data-analist-descriptions-4.csv", sep=',')
da_descriptions_5 <- read.csv("../../data/data-analist/data-analist-descriptions-5.csv", sep=',')
da_descriptions_6 <- read.csv("../../data/data-analist/data-analist-descriptions-6.csv", sep=',')
da_descriptions_7 <- read.csv("../../data/data-analist/data-analist-descriptions-7.csv", sep=',')
da_descriptions_8 <- read.csv("../../data/data-analist/data-analist-descriptions-8.csv", sep=',')
da_descriptions_9 <- read.csv("../../data/data-analist/data-analist-descriptions-9.csv", sep=',')
da_descriptions_10 <- read.csv("../../data/data-analist/data-analist-descriptions-10.csv", sep=',')
da_descriptions_11 <- read.csv("../../data/data-analist/data-analist-descriptions-11.csv", sep=',')
da_descriptions_12 <- read.csv("../../data/data-analist/data-analist-descriptions-12.csv", sep=',')
da_descriptions_13 <- read.csv("../../data/data-analist/data-analist-descriptions-13.csv", sep=',')
da_descriptions_14 <- read.csv("../../data/data-analist/data-analist-descriptions-14.csv", sep=',')
da_descriptions_15 <- read.csv("../../data/data-analist/data-analist-descriptions-15.csv", sep=',')
da_descriptions_16 <- read.csv("../../data/data-analist/data-analist-descriptions-16.csv", sep=',')
da_descriptions_17 <- read.csv("../../data/data-analist/data-analist-descriptions-17.csv", sep=',')

## 1.3 marketing analist ------------------------------------------------------
# listings
ma_listings <- read.csv("../../data/marketing-analist/marketing-analist-listings.csv", sep=',')

# descriptions
ma_descriptions_1 <- read.csv("../../data/marketing-analist/marketing-analist-descriptions-1.csv", sep=',')
ma_descriptions_2 <- read.csv("../../data/marketing-analist/marketing-analist-descriptions-2.csv", sep=',')
ma_descriptions_3 <- read.csv("../../data/marketing-analist/marketing-analist-descriptions-3.csv", sep=',')
ma_descriptions_4 <- read.csv("../../data/marketing-analist/marketing-analist-descriptions-4.csv", sep=',')
ma_descriptions_5 <- read.csv("../../data/marketing-analist/marketing-analist-descriptions-5.csv", sep=',')
ma_descriptions_6 <- read.csv("../../data/marketing-analist/marketing-analist-descriptions-6.csv", sep=',')
ma_descriptions_7 <- read.csv("../../data/marketing-analist/marketing-analist-descriptions-7", sep=',')

## 1.4 marketeer --------------------------------------------------------------
# listings
m_listings <- read.csv("../../data/marketeer/marketeer-listings.csv", sep=',')

# descriptions
m_descriptions_1 <- read.csv("../../data/marketeer/marketeer-descriptions-1.csv", sep=',')
m_descriptions_2 <- read.csv("../../data/marketeer/marketeer-descriptions-2.csv", sep=',')
m_descriptions_3 <- read.csv("../../data/marketeer/marketeer-descriptions-3.csv", sep=',')
m_descriptions_4 <- read.csv("../../data/marketeer/marketeer-descriptions-4.csv", sep=',')
m_descriptions_5 <- read.csv("../../data/marketeer/marketeer-descriptions-5.csv", sep=',')
m_descriptions_6 <- read.csv("../../data/marketeer/marketeer-descriptions-6.csv", sep=',')
m_descriptions_7 <- read.csv("../../data/marketeer/marketeer-descriptions-7.csv", sep=',')
m_descriptions_8 <- read.csv("../../data/marketeer/marketeer-descriptions-8.csv", sep=',')
m_descriptions_9 <- read.csv("../../data/marketeer/marketeer-descriptions-9.csv", sep=',')
m_descriptions_10 <- read.csv("../../data/marketeer/marketeer-descriptions-10.csv", sep=',')
m_descriptions_11 <- read.csv("../../data/marketeer/marketeer-descriptions-11.csv", sep=',')
m_descriptions_12 <- read.csv("../../data/marketeer/marketeer-descriptions-12.csv", sep=',')
m_descriptions_13 <- read.csv("../../data/marketeer/marketeer-descriptions-13.csv", sep=',')
m_descriptions_14 <- read.csv("../../data/marketeer/marketeer-descriptions-14.csv", sep=',')
m_descriptions_15 <- read.csv("../../data/marketeer/marketeer-descriptions-15.csv", sep=',')
m_descriptions_16 <- read.csv("../../data/marketeer/marketeer-descriptions-16.csv", sep=',')
m_descriptions_17 <- read.csv("../../data/marketeer/marketeer-descriptions-17.csv", sep=',')
m_descriptions_18 <- read.csv("../../data/marketeer/marketeer-descriptions-18.csv", sep=',')
m_descriptions_19 <- read.csv("../../data/marketeer/marketeer-descriptions-19.csv", sep=',')

### 2. merge ------------------------------------------------------------------
## 2.1 data scientist ---------------------------------------------------------
# merge all description datasets into ds_descriptions
ds_descriptions <- ds_descriptions_1 %>%
  union(ds_descriptions_2) %>%
  union(ds_descriptions_3) %>%
  union(ds_descriptions_4) %>%
  union(ds_descriptions_5) %>%
  union(ds_descriptions_6) %>%
  union(ds_descriptions_7) %>%
  union(ds_descriptions_8) %>%
  union(ds_descriptions_9) %>%
  union(ds_descriptions_10) %>%
  union(ds_descriptions_11) %>%
  union(ds_descriptions_12) %>%
  union(ds_descriptions_13) %>%
  union(ds_descriptions_14) %>%
  union(ds_descriptions_15) %>%
  union(ds_descriptions_16) %>%
  union(ds_descriptions_17) %>%
  union(ds_descriptions_18) %>%
  union(ds_descriptions_19) %>%
  union(ds_descriptions_20) %>%
  union(ds_descriptions_21) %>%
  filter(description != '') %>%  # remove empty descriptions
  distinct(id, .keep_all = TRUE)  # keep only distinct ids
  
# merge job listings with descriptions
data_scientist <- ds_listings %>%
  inner_join(ds_descriptions, by = 'id')

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
# merge all description datasets into m_descriptions
m_descriptions <- m_descriptions_1 %>%
  union(m_descriptions_2) %>%
  union(m_descriptions_3) %>%
  union(m_descriptions_4) %>%
  union(m_descriptions_5) %>%
  union(m_descriptions_6) %>%
  union(m_descriptions_7) %>%
  union(m_descriptions_8) %>%
  union(m_descriptions_9) %>%
  union(m_descriptions_10) %>%
  union(m_descriptions_11) %>%
  union(m_descriptions_12) %>%
  union(m_descriptions_13) %>%
  union(m_descriptions_14) %>%
  union(m_descriptions_15) %>%
  union(m_descriptions_16) %>%
  union(m_descriptions_17) %>%
  union(m_descriptions_18) %>%
  union(m_descriptions_19) %>%
  filter(description != '') %>%  # remove empty descriptions
  distinct(id, .keep_all = TRUE)  # keep only distinct ids

# merge job listings with descriptions
marketeer <- m_listings %>%
  inner_join(m_descriptions, by = 'id')

### 3. save merged data -------------------------------------------------------
# create directories
dir.create('../../gen')
dir.create('../../gen/data-preparation')
dir.create('../../gen/data-preparation/temp')

## 3.1 data scientist ---------------------------------------------------------
write.csv(data_scientist, '../../gen/data-preparation/temp/data_scientist_merged.csv')

## 3.2 data analist -----------------------------------------------------------
write.csv(data_analist, '../../gen/data-preparation/temp/data_analist_merged.csv')

## 3.3 marketing analist ------------------------------------------------------
write.csv(marketing_analist, '../../gen/data-preparation/temp/marketing_analist_merged.csv')

## 3.4 marketeer --------------------------------------------------------------
write.csv(marketeer, '../../gen/data-preparation/temp/marketeer_merged.csv')
