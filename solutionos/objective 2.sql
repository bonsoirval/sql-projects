/*
a. How many encounters had zero payer coverage, and what percentage of 
total encounters does this represent?
*/

select 
case 
    when payer_coverage = 0.00 then 'Zero Coverage'
    else 'Non-zero Coverage' end as zero_coverage,
    count(*) as num,
    round(count(*) * 100.0 / sum(count(*)) over(), 2) AS percentage
from encounters0
group by zero_coverage;

/*
b. What are the top 10 most frequent procedures performed and the average base cost for each?
*/

/*
get top 10 most frequent procedures performed and their average base cost
*/
select 
    p.description,
    count(*) as num_procedures,
    round(avg(base_cost) ,2) as avg_base_cost_usd -- average base cost in usd
from procedures0 as p
left join encounters0 as e
on p.patient = e.id
where right(p.description,11) = '(procedure)'
GROUP BY p.description
order by num_procedures desc
limit 10;

/*
c. What are the top 10 procedures with the highest average base cost and the
number of times they were performed?
*/

/*
Solution Steps
Get top 10 higheest average base cost and number of of times they were performed
*/
select 
    left(p.description,length(p.description) - length('(procedure)')) as procedure_name,
    round(avg(base_cost) ,2) as avg_base_cost_usd, -- average base cost in usd
    count(*) as num_perf_procedures
from procedures0 as p
left join encounters0 as e
on p.patient = e.id
where right(p.description,11) = '(procedure)'
GROUP BY p.description
order by avg_base_cost_usd desc
limit 10;

/*
d. What is the average total claim cost for encounters, broken down by payer?
*/

/*
Solution Steps
get average total claim from encounters
break it down by payer
*/

select 
    p.name,
    round(avg(e.total_claim_cost), 2) as avg_total_claim_cost
from encounters0 as e
inner join payers0 as p
on e.payer = p.id
group by p.name
order by avg_total_claim_cost desc;