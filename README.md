# Are students learning the right skills for their future job?

This repository contains the entire workflow for our Online Data Collection & Management and Data Preparation & Workflow Management group projects (group 3). For our project, we scraped Indeed.com for several marketing analytics related job postings in the Netherlands.

## Motivation

The job market is becoming ever more competitive, and, as a student nowadays, it is harder and harder to land the job of your dreams. COVID-19 has even made it more challenging for recent graduates to find a fitting role after graduation. A lot of students complain about the gap between the skills learned during their studies and the actual skills required in the workfield by companies. This motivates our investigation into Indeed.com job vacancy postings, to find the skills that are actually required for different job types.

As Marketing Analytics students, we have both the marketing and analytical knowledge to succeed in a range of different job types in the field of marketing. We are interested in what the actual required skills are for jobs in fields related to our studies. Becoming a data scientist, a data analist, a marketing analist or maybe a marketeer after our studies will require different skills and competencies, and we would like to know to which degree we possess these skills and to which extent our study program effectively prepares us for the job market.

We aspire to find insights to help ourselves, as well as our fellow students, in making a choice relating to which skills to improve and perhaps which skills to forego, in order to effectively land their first job. We aim to conduct our investigation in such a way that the methodology can be used by anyone for any location in the world and for any job title on Indeed.com. First of all, for our fellow students, the keyword and location analysis provide easily interpretable figures to see which skills are in demand for each role, together with the best locations for jobs in the Netherlands. Our entire project is accessible and usable. The entire workflow can be tweaked to your needs, by simply changing the search term in the scraper. This makes our project valuable for all job seekers in the world, as they can reproduce our data scraping and analysis for their specific job wishes.

## Method and results

For this project we decided to narrow down our investigation to the Netherlands. Three of our four members originate from the Netherlands and since we and our classmates are all studying at Tilburg University in the Netherlands right now, job options in the Netherlands are most relevant to us. Furthermore, we decided to investigate the 4 jobs most closely related to our master in Marketing Analytics program, being data scientist, marketeer, data analist and marketing analist. By narrowing down the project by not including too many locations and job searches, the project workflow will be much smoother and easier to reproduce for anyone interested in doing so.

We chose a keyword frequency analysis on what we believe to be the most common technical skills as our main tool of analyzing the different job searches. These keywords include programming languages such as R and Python and knowledge of visualization programs such as Power BI and Tableau. In our experience, many of our fellow students find it difficult to bridge the gap between academic knowledge and actual skills required in the job market. By comparing this core set of technical skills per job title, we can provide insights into the actual skills valued by employers. This will help students in making the right decision on how to spend their precious time and prepare themselves optimally for the beginning of their careers.

First, we built a web scraper that scrapes the vital information of each job posting associated with a specific job search. We used the BeautifulSoup package to collect job ids, job titles, salary, company name, dates, job summary and salaries if available. Afterwards, we scraped the job descriptions of the same search results to obtain the job descriptions of each job posting in a seperate dataset by using a chrome webdriver with Python Selenium. Due to restrictions with captchas, we collected multiple small batches of datasets per search term. In R we merged the data into one big file per search term by joining the datasets on the unique job id that serves as an identifier for each seperate job advert on Indeed. After merging the files into one dataset per search term, we cleaned the data by removing duplicate entries and by cleaning up messy string location names. Location names such as Amsterdam-Zuid or Velsen-Noord were unwanted because they would appear as two distinct locations in our analysis. Therefore, we wrote a function that removed all such extra unnecessary information in the location strings. We added a function that replaced certain unspecified locations such as Nederland or Randstad into online, signifying that a job did not specify a specific location.

The final step in the cleaning process was cleaning the salary data. The salary data was quite sparse and also very messy. Roughly three-quarters of the data was missing, and for the data available, different measures were given. Some jobs gave hourly salary rates, whereas other jobs utilized monthly or yearly income as a salary measure. We made a function that removed unnecessary character strings in the salary data and converted all different salary measures into yearly income as a standard. We calculated yearly income for hourly rates based on 40 hour work week. We multiplied the hourly rate \* 40 \* 4 \* 12 to get a yearly income rate based on the hourly wage. For the monthly income, we simply multiplied with 12 to arrive at yearly income. Quite a few jobs gave a salary range instead of a fixed number. For those jobs, we decided to take the middle of the range. We kept the observations with missing values for salary in the dataset for the first part of the analysis because it would significantly reduce the number of observations otherwise.

After cleaning the data we could start with the analysis. The most important part was the keyword analysis. In this part, we investigated the count of occurences for each of our skills in the job advert descriptions. Since some adverts had double or multiple counts of the same words, we also provided the percentage of job ads in which a keyword occured. These 2 measures produced very similar results in the end but we decided to keep both included. The final part of the kewyord analysis consisted of combining the 4 seperate plots with keyword percentages for each skill into one single plot which, showed the occurences for each skill in each job next to each other for easy comparison.

Afterwards, we proceeded with location analysis. At this stage, we scrutinized the frequency of the locations for each seperate job. Resulting in a distinct plot for each job search with the associated location frequencies. The last step was again to combine all of the different plots into one single plot to facilitate comparisons. The final plot gave a good overview of which cities were the top cities for each job. We finalized our analysis with a salary analysis for the different jobs. First, we removed the observations in the dataset with no data on salary. Then we checked the top locations salary-wise for each job title. Afterwards, we finalized the analysis with a combined plot of the top locations with the top salaries per job type.

In the following section we give a short overview of the main findings from our analysis. Due to limited salary data, many locations have only a single job ad with salary data included, this number does not really represent an average. Therefore, we decided to only incorporate locations with a minimum of 3 job ads when analyzing the average salaries per location. 

- We find that for data analist jobs, handling databases with SQL is the most sought skill by employers, followed by Microsoft Excel, Python and R. Amsterdam currently has the most vacancies for a data analist, followed by Utrecht, Rotterdam, Den Haag and Eindhoven. For data analists, again Zaandam and Amsterdam are the cities with highest average salaries. Another attractive option is Apeldoorn. These top 3 cities all have average salaries close to or even over 60.000 euros per year. Quite more than the national average. 

- For becoming a data scientist, students will need to learn Python the most, followed by handling SQL, R, Machine learning and Microsoft Excel in that order. When searching for a job as data scientist, we found that Amsterdam currently has the most vacancies in the Netherlands, followed by Utrecht, Leiden, Rotterdam and Delft. Top locations for data scientists in terms of salary are Amsterdam and Zaandam. In each of these places the average salary for Data Scientists is over 60.000 euros annually, which is well above the average earnings for the entire country. 

- If you have the ambition to become a marketeer in the future, your employer will ask you to be able to handle Excel the most, followed by HTML. A little bit of knowledge on SQL and R is also sought by employers. For future marketeers, Amsterdam is the place with the most vacancies at this moment, followed by Utrecht, Rotterdam, Eindhoven, Nijmegen and Den Bosch. The highest paid jobs for marketeers generally are found in Zaandam and Schiedam, with Zaandam having salaries over 60.000 euros, which is nearly twice the average salary for marketeers. Besides these 2 cities, there are numerous other cities including Utrecht, Amsterdam, Rotterdam, Nijmegen and Eindhoven which are all pretty similar to each other in terms of salaries, coming close to 40000 euro average annual income. 

- Lastly, for future marketing analists, it is useful to learn Excel, SQL, Python, R and Tableau. When searching for a job as a marketing analist, we found that Amsterdam has the most vacancies, followed by Rotterdam, Utrecht, Den Haag and Eindhoven. For marketing analists, when looking for the highest salaries on average, the best places to find a job are Amsterdam, Almere, Den Haag and Utrecht. 



## Repository overview

Our repository has the following structure:
```

├───docs
└───src
    ├───analysis
    ├───collection
    └───data-preparation
    
```

## Running instructions

For this project. we made use of GNU make. This means that the whole process, from loading the data to running the analyses, can be done at once by running the makefile. If you are not (yet) familiar with makefiles, we advice you to take a look at the following [tutorial](https://tilburgsciencehub.com/tutorials/reproducible-research/practicing-pipeline-automation-make/overview/) before running the makefile. We advice you to have a look at the makefile before you start running the file.

Before running the makefile, make sure you have the following packages installed:

For Python:

```
    pip install requests
    pip install bs4
    pip install DateTime
    pip install selenium
    pip install pandas
```
For R:

```
    install.packages("tidyverse")
    install.packages("tidyr")
    install.packages("stringr")
    install.packages("reshape")
    install.packages("knitr")
```

Next to these packages, you will need Chromedriver to run the scraper. Because Chromedriver is operating-system specific, we would like to refer you to the following [tutorial](https://tilburgsciencehub.com/building-blocks/configure-your-computer/task-specific-configurations/configuring-python-for-webscraping/). Next to Chromedriver you will also need to install Tex distribution, which is a typesetting system. See the [tutorial](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/latex/) on how to install the Tex distribution.

## More resources

For this project, we did not use related papers or previous studies. [Tilburg Science Hub](https://tilburgsciencehub.com/) did help us greatly in understanding how to deploy this project from beginning to end. Have a look at the website to learn more about how to efficiently carry out data- and computation-intensive projects.

## About

This project has been conducted by students from Tilburg University for the two courses Data Preparation & Workflow Management and Online Data Collection & Management, both instructed by Hannes Datta. All team members were involved in building, developing, optimizing, cleaning, analyzing and reporting of the data. The following 4 students contributed to the project: Georgiana Hutanu, Anouk Heemskerk, Alan Rijnders and Renee Nieuwkoop.
