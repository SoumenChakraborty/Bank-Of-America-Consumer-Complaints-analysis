create database Consumer_Complaint;
use Consumer_Complaint;


-- Data Cleaning (Column Name error)


-- KPI
-- 1. Number of Compalints
select count(Complaint_ID) from consumer_complaints;

-- 2. Number of products
select count(distinct Product) from consumer_complaints;

-- 3. Most common Issue
select Issue, count(Issue)
from consumer_complaints
group by Issue order by count(Issue) desc limit 1;


-- Insights
-- 1. customer compalaint pattern (product based), (way of submitting report)
select Product, count(Issue)
from consumer_complaints
group by Product order by count(Issue) desc;

select Submission_medium, count(Issue)
from consumer_complaints
group by Submission_medium order by count(Issue) desc;


-- 2. Complaint resolved type
select Company_response_to_consumer, count(Company_response_to_consumer) as Total
from consumer_complaints
group by Company_response_to_consumer order by Total desc;

-- 3. Untimely response
select (select Count(Timely_response) from consumer_complaints where Timely_response = "No")*100/(select count(Complaint_ID) from consumer_complaints) as Untimely_response_Percentage
;

-- 4. Refunding issues
select Issue, count(Issue)
from consumer_complaints
where Company_response_to_consumer ="closed with monetary relief"
group by Issue order by count(Issue) desc;

