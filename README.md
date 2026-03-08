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

|encounter_year|num_encounter|
|---|---|
|2014|3869|
|2021|3504|
|2020|2513|
|2013|2481|
|2015|2457|
|2016|2351|
|2017|2438|
|2018|2284|
|2019|2215|
|2012|2092|

 - b. For each year, what percentage of all encounters belonged to each encounter class - (ambulatory, outpatient, wellness, urgent care, 
emergency, and inpatient)?

|encounterclass|occurence|perc_occurence|
|---|---|---|
|ambulatory|12537|44.95|
|outpatient|6300|22.59|
|urgentcare|3666|13.14|
|emergency|2322|8.33|
|wellness|1931|6.92|

- c. What percentage of encounters were over 24 hours versus under 24 hours?

|sn|duration_group|occurence|percentage|
|---|---|---|---|
|1|Under 24 Hours|27816|99.73|
|2|Over 24 Hours|75|0.27|

**Decisions that can be affected by these insights**
The number of encounters per year can help the HR of hospital plan on human resource strength of hospital going forward. The percentage of group of all encounters further assists in narrowing down which department gets what number of staffing wether ambulatory, outpatient, wellness, urgent care, emergency and inpatient. The percentage of encounters over 24 hours versus under 24 hours help in planning for ward and bedding for patients.


#### OBJECTIVE 2: COST & COVERAGE INSIGHTS

- a. How many encounters had zero payer coverage, and what percentage of total encounters does this represent?

|sn|zero_coverage|num|percentage|
|---|---|---|---|
|1||Non-zero Coverage|14305|51.29|
|2|Zero Coverage|13586|48.71|

- b. What are the top 10 most frequent procedures performed and the average base cost for each (first four names lists for space)?

|sn|description|num_procedures|avg_base_cost_usd|
|---|---|---|---|
|1|Assessment of health and social care needs (procedure)|4596|431|
|2|Depression screening using Patient Health Questionnaire Two-Item score (procedure)|3614|431|
|3|Depression screening (procedure)|3614|431|
|4|Assessment of substance use (procedure)|2906|431
|5|Renal dialysis (procedure)|2746|1004.09|
|6|Assessment using Morse Fall Scale (procedure)|2422|431|
|7|Assessment of anxiety (procedure)|2288|431|
|8|Medication Reconciliation (procedure)|2284|509.12|
|9|Screening for drug abuse (procedure)|1484|431|
|10||Screening for domestic abuse (procedure)|1432|431|



- c. What are the top 10 procedures with the highest average base cost and the number of times they were performed?

|sn|procedure_name|avg_base_cost_usd|num_perf_procedures|
|---|---|---|---|
|1|Admit to ICU|206260.4|5|
|2|Lumpectomy of breast|29353|5|
|3|Hemodialysis|29299.56|27|
|4|Fine needle aspiration biopsy of lung|23141|1|
|5|Thoracentesis|19622|1|
|6|Combined chemotherapy and radiation therapy|11796.39|444|
|7|Excision of sentinel lymph node|11277|4|
|8|Sentinel lymph node biopsy|10577.25|4|
|9|Bone density scan|9602.86|198|
|10|Spirometry |7792.77|209|


- d. What is the average total claim cost for encounters, broken down by payer?

|sn|name|avg_total_claim_cost|
|---|---|---|
||Medicaid|6205.22|
||NO_INSURANCE|5593.2|
||Anthem|4236.81|
||Humana|3269.3|
||Blue Cross Blue Shield|3245.58|
||Cigna Health|2996.95|
||UnitedHealthcare|2848.34|
||Aetna|2767.05|
||Medicare|2167.55|
||Dual Eligible|1696.19|


**Decisions that can be affected by these insights.**
Number of encounters with zero payer coverage and the percentage of total encounters it represents helps the hospital know what proportion of their patients have insurance coverage, to better plan for this. The top 10 most frequent procedures performed and the average base costs for each, and the top 10 procedures with the highest average base cost, number of times there were performed enables the hospital to prioritize inventory restocking for profit maximization. This affects stock management.

#### OBJECTIVE 3: PATIENT BEHAVIOR ANALYSIS
- a. How many unique patients were admitted each quarter over time?

|sn|quarter|num_unique_patient|
|---|---|---|
|1|1|775|
|2|2|776|
|3|3|698|
|4|4|670|


- b. How many patients were readmitted within 30 days of 
a previous encounter?

|sn|patient_name|discharge_date|readmission_date|days_to_readmission|
|---|---|---|---|---|
|1|Mr. Mariano 761 Okon634|2011-01-02|2011-01-05|3 days|
|2|Mr. Abraham100 Ruecker817|2011-01-04|2011-01-23|18 days|
|3|Mr. Simon598 Grant908|2011-01-05|2011-01-07|2 days|
|4|Mr. Mariano761 Okon634|2011-01-05|2011-01-08|3 days|


- c. Which patients had the most readmissions?

|sn|patient_name|num_readmission|
|---|---|---|
|1|Mrs. Kimberly627 Collier206|1376|
|2|Mr. Mariano761 Okon634|876|
|3|Mrs. Shani239 Parisian75|871|
|4|Mr. Gail741 Glover433|442|
|5|Mr. Ward668 Nicola769|421|


**Decisions that can be affected by these insights**
The unique patients admitted each year gives the hospital an overview of the total number of its patients. The patients readmitted within 30 days points to either more serious cases or where the hospital need better experienced personnel on. 


### Feedback time
Please kindly provide your comment and thoughts here

[Click me to comment](https://www.linkedin.com/posts/njoku-okechukwu-val_i-have-just-built-a-project-using-postgresql-activity-7435793855872131072-6YUz?utm_source=share&utm_medium=member_desktop&rcm=ACoAABdVi94BiqeCAQwRdMBvvMrH7vxcpms-ON4)