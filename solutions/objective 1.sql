/*
OBJECTIVE 1: ENCOUNTERS OVERVIEW

- a. How many total encounters occurred each year?
*/

/*
Solution Steps
Create cte to 
1. counts encounters,
2. create column encounter_year - 
    start year when both start and stop year are the sem
    "start to stop" when start and stop years are not the same
*/
WITH encounter_period AS (
    SELECT 
    count(*) as num_encounters,
    CASE
        -- line below extracts year component of the timestamp and compares it

        WHEN extract(year from start) = extract(year from stop) THEN extract(year from start)::text
        ELSE extract(year from start) || ' to ' || extract(year from stop)::text
        END AS encounter_year
FROM encounters0
GROUP BY start, stop
)
SELECT 
    encounter_year, -- select encounter year created in the cte above
    count(*) as num_encounter -- count number of year occurance
FROM encounter_period
GROUP BY encounter_year -- group by the year
ORDER BY num_encounter desc -- other by descending number of num_encounter
LIMIT 10;


/*
- b. For each year, what percentage of all encounters belonged to each encounter class
-- (ambulatory, outpatient, wellness, urgent care, emergency, and inpatient)?

*/

/*
Solution Steps
Get encounterclass, how many times it occured, then percentage of the encounter class
over all other encounterclass*/
SELECT 
    encounterclass,
    count(*) as occurence,
    round(count(*) * 100.0 / sum(count(*)) over(), 2) as perc_occurence
FROM encounters0
GROUP BY encounterclass
ORDER BY occurence desc
LIMIT 5;

/*
c. What percentage of encounters were over 24 hours versus under 24 hours?
*/

/*
Solution Steps
stop - start converted to interval of hours
categorize them ad over 24 hours and under 24 hours as duration_group
*/
WITH duration_cte AS (
    SELECT 
        CASE 
            WHEN stop - start > interval '24 hours' THEN 'Over 24 Hours'
            ELSE 'Under 24 Hours'
        END AS duration_group
    FROM encounters0
)
/*
select duration group,
count number of occurance
find percentage of occurrence over
*/
SELECT 
    duration_group,
    count(*) AS occurrence,
    round(count(*) * 100.0 / sum(count(*)) over(), 2) AS percentage
FROM duration_cte
GROUP BY duration_group;