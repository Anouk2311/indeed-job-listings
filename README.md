# Are students learning the right skills for their future job?

This repository contains the entire workflow for our Online Data Collection & Management and Data Preparation & Workflow Management group projects (group 3). For our project we scraped indeed.com for several marketing analytics related job posts in the Netherlands. 



## Motivation
The job market is becoming ever more competitive, as a student nowadays it is harder and harder to land the job of your dreams. Covid has even made it more challenging for recent graduates to find a fitting role after graduation. A lot of students complain about the gap between skills learned during their studies and the actual skills required in the workfield by companies. This motivates our investigation into Indeed job vacancy postings to find the skills that are actually required for different job types. As Marketing Analytics students, we have both the marketing and analytical knowledge to succeed in a range of different job types in the field of marketing. We are interested in what the actual required skills are for jobs in fields related to our studies. Becoming a data scientist, data analist or maybe marketeer after our studies will require different skills and competencies and we would like to know to which degree we possess the skills and to which extent our study program effectively prepares us for the job market.

We aspire to find insights to help ourselves and our fellow students in making a choice which skills to improve and perhaps which skills to forego in order to effectively land their first job. We aim to conduct our investigation in such a way that the methodology can be used by anyone for any location in the world and for any job type. First of all, for our fellow students, the keyword and location analysis provide easily interpretable tables to see which skills are in demand for each roles, together with the best locations for jobs in the Netherlands. Our entire project is accessible and usable. The entire workflow can be tweaked to your needs by simply changing the search term in the scraper. This makes our project valuable for all job seekers in the world, as they can reproduce our data scraping and analysis for their specific job wishes. 

## Method and results

#Method

For this project we decided to narrow down our investigation to the Netherlands. 3 of our 4 members originate from the Netherlands and since we and our classmates are all studying at Tilburg University in the Netherlands right now, job options in the Netherlands are most relevant to us. Furthermore, we decided to investigate the 4 jobs most closely related to our master in Marketing Analytics program, being data scientist, marketeer, data-analist and marketing-analist. By narrowing down the project by not including too many locations and job searches the project workflow will be much smoother and easier to reproduce for anyone interested in doing so. 

We chose a keyword frequency analysis on what we believe to be the most common technical skills as our main tool of analyzing the different job searches. These keywords include programming languages such as R and Python, database knowledge on programs as Power BI and SQL and also the good old Excel. In our experience, many of our fellow students find it difficult to bridge the gap between academic knowledge and actual skills required in the job market. By comparing this core set of techinical skills per job title, we can provide insights into the actual skills valued by employers. This will help students making the right decision on how to spend their precious time and prepare themselves optimally for the beginning of their careers. 

First, we built a web scraper with python Selenium that scrapes the vital information of each job posting associated with a specific job search. This included items such as job title, location, unique job-id and salary if provided. Afterwards we scraped the job descriptions of the same search results to obtain the job descriptions of each job posting in a seperate dataset. Then in R we merged the data into one big file by joining the datasets on the unique job id that serves as identifier for each seperate job advert on Indeed.  All the analyzed the counts of our Keywords in each the dataset 

#results of our analysis
We find that for data-analist jobs, handling databases with SQL is the most sought after skill by employers, followed by Microsoft Excel, Python and R. 

## Repository overview
Our repository is formed by the ..




## Running instructions

For this project we made use of GNU make. This means that the whole process, from loading in the data to running the analyses, can be done at once by running the makefile. If you are not (yet) familiar with makefiles, we advice you to take a look at the following tutorial before running the makefile: https://tilburgsciencehub.com/tutorials/reproducible-research/practicing-pipeline-automation-make/overview/ 
The makefile can be found in the ... folder. Please make sure to have a look at the makefile before you start running the file.

Before running the makefile make sure you have the following packages installed (copy paste the following one at a time in your terminal): 

| pip install requests |
  pip install bs4 | 
  pip install DateTime |
  pip install selenium |
  pip install pandas |





Explain to potential users how to run/replicate your workflow. Touch upon, if necessary, the required input data, which (secret) credentials are required (and how to obtain them), which software tools are needed to run the workflow (including links to the installation instructions), and how to run the workflow. Make use of subheaders where appropriate.

## More resources

Point interested users to any related literature and/or documentation.

## About

This project has been conducted by students from Tilburg University for the two courses Data Preparation & Workflow Management and Online Data Collection & Management, both instructed by Hannes Datta. All team members were involved in building, developing, optimizing, cleaning, analyzing and reporting of the data. The following 4 students contributed to the project: Georgiana Huţanu, Anouk Heemskerk, Alan Rijnders and Renée Nieuwkoop. 

