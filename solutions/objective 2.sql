/*
a. How many encounters had zero payer coverage, and what percentage of 
total encounters does this represent?
*/

SELECT 
CASE 
    WHEN payer_coverage = 0.00 THEN 'Zero Coverage'
    ELSE 'Non-zero Coverage' END AS zero_coverage,
    count(*) AS num,
    round(count(*) * 100.0 / sum(count(*)) OVER(), 2) AS percentage
FROM encounters0
GROUP BY zero_coverage;

/*
b. What are the top 10 most frequent procedures performed and the average base cost for each?
*/

/*
get top 10 most frequent procedures performed and their average base cost
*/
SELECT 
    p.description,
    count(*) AS num_procedures,
    round(avg(base_cost) ,2) AS avg_base_cost_usd -- average base cost in usd
FROM procedures0 AS p
LEFT JOIN encounters0 AS e
ON p.patient = e.id
WHERE RIGHT(p.description,11) = '(procedure)'
GROUP BY p.description
ORDER BY num_procedures DESC
LIMIT 10;

/*
c. What are the top 10 procedures with the highest average base cost and the
number of times they were performed?
*/

/*
Solution Steps
Get top 10 higheest average base cost and number of of times they were performed
*/
SELECT 
    LEFT(p.description,length(p.description) - length('(procedure)')) AS procedure_name,
    round(avg(base_cost) ,2) AS avg_base_cost_usd, -- average base cost in usd
    count(*) AS num_perf_procedures
FROM procedures0 AS p
LEFT JOIN encounters0 AS e
ON p.patient = e.id
WHERE RIGHT(p.description,11) = '(procedure)'
GROUP BY p.description
ORDER BY avg_base_cost_usd DESC
LIMIT 10;

/*
d. What is the average total claim cost for encounters, broken down by payer?
*/

/*
Solution Steps
get average total claim from encounters
break it down by payer
*/
 
SELECT 
    p.name,
    round(avg(e.total_claim_cost), 2) AS avg_total_claim_cost
FROM encounters0 AS e
INNER JOIN payers0 AS p
ON e.payer = p.id
GROUP BY p.name
ORDER BY avg_total_claim_cost DESC;