### load packages
library(dplyr)

### 1. load datasets into R ---------------------------------------------------
## 1.1 data scientist ---------------------------------------------------------
data_scientist <- read.csv('../../gen/data-preparation/output/data_scientist_clean.csv', header=TRUE, row.names = "X", sep = ',')

## 1.2 data analist -----------------------------------------------------------
data_analist <- read.csv('../../gen/data-preparation/output/data_analist_clean.csv', header=TRUE, row.names = "X", sep = ',')

## 1.3 marketing analist ------------------------------------------------------
marketing_analist <- read.csv('../../gen/data-preparation/output/marketing_analist_clean.csv', header=TRUE, row.names = "X", sep = ',')

## 1.4 marketeer --------------------------------------------------------------
marketeer <- read.csv('../../gen/data-preparation/output/marketeer_clean.csv', header=TRUE, row.names = "X",  sep = ',')

### 2. data analysis/estimate models



### 3. save results
dir.create('../../gen/analysis')
dir.create('../../gen/analysis/output')

## 3.1 data scientist ---------------------------------------------------------

## 3.2 data analist -----------------------------------------------------------

## 3.3 marketing analist ------------------------------------------------------

## 3.4 marketeer --------------------------------------------------------------
