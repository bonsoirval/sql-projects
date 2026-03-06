/*
a. How many unique patients were admitted each quarter over time?
*/
SELECT 
    -- extract(year from start) as year,
    extract(quarter from start) as quarter,
    count(distinct patient) unique_patients
FROM encounters0
GROUP BY quarter
ORDER BY  quarter;

/*
b. How many patients were readmitted within 30 days of a previous encounter?
*/

/*
c. Which patients had the most readmissions?
*/