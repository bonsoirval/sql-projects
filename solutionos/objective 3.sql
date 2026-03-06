/*
a. How many unique patients were admitted each quarter over time?
*/
SELECT 
    -- extract(year from start) as year,
    EXTRACT(quarter FROM START) AS quarter,
    count(DISTINCT patient) unique_patients
FROM encounters0
GROUP BY quarter
ORDER BY  quarter;

/*
b. How many patients were readmitted within 30 days of a previous encounter?
*/

WITH NextAdmissions AS (
    SELECT 
        patient,
        stop AS discharge_date,
        "start" AS next_admission_date,
        -- Get the next admission date for the same patient
        LEAD("start") OVER (PARTITION BY patient ORDER BY "start") AS next_adm
    FROM encounters0
)
SELECT 
    DISTINCT p.prefix || ', '|| p.first || ' ' || p.last AS patient_name,
    -- na.patient,
    to_char(na.discharge_date, 'yyyy-mm-dd') AS discharge_date,
    to_char(na.next_adm, 'yyyy-mm-dd') AS readmission_date,
    EXTRACT(days FROM (na.next_adm - na.discharge_date)) || ' days' AS days_to_readmission
FROM NextAdmissions AS na
JOIN patients0  AS p
ON p.id = na.patient
WHERE na.next_adm IS NOT NULL 
  AND (na.next_adm - na.discharge_date) <= INTERVAL '30 days'
ORDER BY discharge_datep;

/*
c. Which patients had the most readmissions?
*/


WITH NextAdmissions AS (
    SELECT 
        patient,
        stop AS discharge_date,
        "start" AS next_admission_date,
        -- Get the next admission date for the same patient
        LEAD("start") OVER (PARTITION BY patient ORDER BY "start") AS next_adm
    FROM encounters0
)
SELECT 
    p.prefix || ', '|| p.first || ' ' || p.last AS patient_name,
    count(*) AS num_readmission
--     to_char(na.discharge_date, 'yyyy-mm-dd') as discharge_date,
--     to_char(na.next_adm, 'yyyy-mm-dd') AS readmission_date,
--     extract(days from (na.next_adm - na.discharge_date)) || ' days' AS days_to_readmission
FROM NextAdmissions AS na
JOIN patients0  AS p
ON p.id = na.patient
WHERE na.next_adm IS NOT NULL 
  AND (na.next_adm - na.discharge_date) <= INTERVAL '30 days'
  GROUP BY patient_name 
  ORDER BY num_readmission DESC