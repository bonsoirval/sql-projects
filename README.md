# sql-projects

The data for the project is sourced from [here](https://mavenanalytics.io/data-playground/hospital-patient-records). 

Synthetic data on ~1k patients of Massachussets General Hospital from 2011-2022, including information on patient demographics, insurance coverage, and medical encounters & procedures.

The data was actually made for mysql originally, but I made it compatible with postgresql. To have the version for postgresql, run setup/create_database.sql on your postgresql database. The data dictionary provided by the owner of the dataset is found in dat_dictionary.csv. 

Do enjoy the project. And for enquiry, projects or consultation:

email : **bonsoirval@gmail.com**

phone : **+2347038616871** -- whatsapp and text

In this project, the following business insights were found 

#### OBJECTIVE 1: ENCOUNTERS OVERVIEW

- a. How many total encounters occurred each year?
- b. For each year, what percentage of all encounters belonged to each encounter class
- (ambulatory, outpatient, wellness, urgent care, emergency, and inpatient)?
- c. What percentage of encounters were over 24 hours versus under 24 hours?

**Decisions that can be affected by these insights**
The number of encounters per year can help the HR of hospital plan on human resource strength of hospital going forward. The percentage of group of all encounters further assists in narrowing down which department gets what number of staffing wether ambulatory, outpatient, wellness, urgent care, emergency and inpatient. The percentage of encounters over 24 hours versus under 24 hours help in planning for ward and bedding for patients.


#### OBJECTIVE 2: COST & COVERAGE INSIGHTS

- a. How many encounters had zero payer coverage, and what percentage of total encounters does this represent?
- b. What are the top 10 most frequent procedures performed and the average base cost for each?
- c. What are the top 10 procedures with the highest average base cost and the number of times they were performed?
- d. What is the average total claim cost for encounters, broken down by payer?

**Decisions that can be affected by these insights.**
Number of encounters with zero payer coverage and the percentage of total encounters it represents helps the hospital know what proportion of their patients have insurance coverage, to better plan for this. The top 10 most frequent procedures performed and the average base costs for each, and the top 10 procedures with the highest average base cost, number of times there were performed enables the hospital to prioritize inventory restocking for profit maximization. This affects stock management.

#### OBJECTIVE 3: PATIENT BEHAVIOR ANALYSIS
- a. How many unique patients were admitted each quarter over time?
- b. How many patients were readmitted within 30 days of a previous encounter?
- c. Which patients had the most readmissions?

**Decisions that can be affected by these insights**
The unique patients admitted each year gives the hospital an overview of the total number of its patients. The patients readmitted within 30 days points to either more serious cases or where the hospital need better experienced personnel on. 


### Feedback time
Please kindly provide your comment and thoughts here

[Click me to comment](https://www.linkedin.com/posts/njoku-okechukwu-val_i-have-just-built-a-project-using-postgresql-activity-7435793855872131072-6YUz?utm_source=share&utm_medium=member_desktop&rcm=ACoAABdVi94BiqeCAQwRdMBvvMrH7vxcpms-ON4)