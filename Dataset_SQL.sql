SELECT * FROM data.dataset_csv;
use data;
# If your column names have spaces, you must use backticks " ` " in MySQL.

-- KPI 1 - Manufacturing Qty ------------------------------------------------------------------------------

SELECT round(sum(`Today Manufactured Qty`),0) as Total_Manufactured_Qty from dataset_csv;

-- KPI 2 - Rejected Qty ------------------------------------------------------------------------------------

SELECT round(sum(`Rejected Qty`),0) as Total_Rejected_Qty from dataset_csv;

-- KPI 3 - Processed Qty -----------------------------------------------------------------------------------

select round(sum(`processed qty`),0) as Total_processed_Qty from dataset_csv;

-- KPI 4 - Wastage Qty - sum(rejected qty)/sum(processed qty) ----------------------------------------------

select concat(round(sum(`rejected Qty`)/sum(`processed Qty`)*100,2),"%")
 as Wastage_percentage from dataset_csv;
 
-- KPI 5 - Employee wise rejected Qty ---------------------------------------------------------------------

select `Emp Name`,
sum(`rejected Qty`) as Total_Rejected from dataset_csv
group by `Emp Name` 
order by total_rejected DESC;
 
 -- KPI 6 - Machine wise rejected Qty ----------------------------------------------------------------------
 
 select `Machine Code`,
 sum(`rejected qty`) as total_rejected 
 from dataset_csv
 group by `machine code`;
 
-- KPI 7 - Daily average production Qty ----------------------------------------------------------------------

select `doc date`,
round(avg(`produced Qty`),0) as Avg_production_Qty
from dataset_csv
group by `doc date`
order by `doc date` desc;

-- KPI 8 - Avg Rejected Vs avg Manufactured -------------------------------------------------------------------

SELECT 
    CASE 
        WHEN avg(`Rejected Qty`) > avg(`today Manufactured Qty`) THEN 'More Rejected'
        WHEN avg(`Rejected Qty`) < avg(`today Manufactured Qty`) THEN 'Less Rejected'
        ELSE 'Equal'
    END 
    as Comparison
FROM dataset_csv;

-- KPI - 9 - department wise Rejected vs manufactured -----------------------------------------------------------

select `department name`,
sum(`rejected Qty`) as total_rejected,
sum(`today manufactured Qty`) as total_manufactured,
case
when sum(`rejected Qty`) > sum(`today manufactured Qty`) then 'More_rejected'
when sum(`rejected Qty`) < sum(`today manufactured Qty`) then 'Less_rejected'
else 'equal'
end as Comparsion
from dataset_csv
group by `department name`;

-- KPI 10 - Average rejected Qty by employee ---------------------------------------------------------------------

select `emp name`,
round(avg(`rejected Qty`),2) as avg_rejected
from dataset_csv
group by `emp name`;
 
 
 
 
