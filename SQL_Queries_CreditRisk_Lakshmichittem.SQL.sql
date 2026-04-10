-- Credit Risk Analysis (SQL)
-- ANalyst -- Lakshmi Chittem
-- Dataset-- Retail Loan Portfolio (28683)
-- Tool -- Mysql Workbench

create database Credit_risk_db;
Use Credit_risk_db;
show tables;

-- Query 1 Portfolio Health Summary
-- how big is our portfolio and how healthy is it overall.
select
 count(*) as Total_customers,
 sum(loan_amnt)as Total_portfolio_Value, 
 round(avg(loan_int_rate),2) as Avg_interest_Rate,
 round(avg(loan_status),2) as Default_Rate
from Credit_Risk_Clean;
-- Expected Result = customer = 28683, 
-- value - 276542650, avg intrst rate - 11.04%
-- Default rat -- 22%
-- why the query = established baseline health of entire portfolio in 4 mems

-- Query 2 Default Rate by Risk Tier
-- Does our intrest rate based risk 
-- classification actually predict defaults?
select 
case when loan_int_rate < 8 then 'Low Risk'
when loan_int_rate < 13 then 'Medium Risk'
when loan_int_rate < 18 then 'High Risk'
else 'critical risk'
end as risk_tier,
 round(avg(loan_amnt),2) as Avg_Loan_Amount,
 round(avg(loan_status),2) as Default_Rate
from Credit_Risk_Clean
group by risk_tier
order by default_rate desc;
-- Expected Result = critical risk- 0.69 highest default,high risk- 0.40 
-- medium risk - 0.16 and low risk - 0.09 lowest default
-- why this query - validates our classification model 
-- case when recreate power query logic inside sql 

-- Query 3= Top 10 highest risk individual risk accounts
-- Which specific accounts should the collections team priortise first 
select 
person_age as age,
person_income as annual_income,
loan_amnt as Loan_amount,
loan_int_rate as Intrest_rate,
loan_grade as Loan_grade,
loan_intent as Loan_purpose,
case 
when loan_status = 1 then 'Default'
else 'No Default'
End as Default_Label
From credit_risk_clean
where loan_status = 1 
order by loan_amount desc
limit 10;  
-- Expected Result = 
-- 10 rows showing highest 

-- Query 4 Default Rate by Loan Purpose
-- which loan purpose carry highest default risk?

Use Credit_risk_db;
select 
loan_intent as Loan_purpose,
count(*) as Total_loans,
round(avg(loan_status),2) as Default_Rate,
round(avg(loan_amnt),2) as Avg_loan_Amount,
round(sum(loan_amnt),2) as Total_Exposure
From credit_risk_clean
group by loan_intent 
order by Default_Rate desc;

-- Expected Result
-- Debtconsolidation highest default - 0.28 
-- following by medical and home improv = 0.27 n 0.26 respectively
-- why this query = combines rate and volume analysis 
-- Identifies where bank should tighten criteria


-- Query 5 Income Band Risk Analysis
-- How does income level affect default probability 
Use Credit_risk_db;
select 
case 
when person_income < 30000 then 'Low'
when person_income < 70000 then 'Medium'
when person_income < 120000 then 'High'
else 'Very High'
end as income_band,
count(*) as Total_customers,
round(avg(loan_status),2) as Default_Rate,
round(avg(loan_amnt),2) as Avg_Loan_Amount,
round(avg(loan_int_rate),2) as Avg_intrest_rate
from credit_risk_clean
group by Income_band
order by Default_Rate desc;

-- Expected result
-- income highest default -0.46 , medium -0.20, high- 0.12
-- why this query = shows income banding technique in sql
-- multiple avg columns show full picture per band
-- low income 46% default confirms financial stress

-- Query 6 High risk Customers segmentation
-- who exactly are our most dangerous customers combining all factors.

select 
case
when loan_int_rate < 8 then 'Low Risk'
when loan_int_rate < 13 then 'Medium Risk'
when loan_int_rate < 18 then 'High Risk'
else 'Critical Risk'
end as 'Risk_tier',
 case
 when person_income < 30000 then'Low'
 when person_income < 70000 then 'Medium'
 when person_income < 120000 then 'High'
 else 'Very High'
 end as income_band,
 count(*) as Total_customers,
 round(avg(loan_status),2) as default_rate,
 round(sum(loan_amnt),2) as Total_exposure
 from credit_risk_clean
 group by Risk_tier, Income_band
 order by Default_rate desc
 limit 10;
 
 -- Expected result 
 -- critical risk + Low income = highes default rate
 -- this combination shows the worst case borrower
 -- Why this query - Multi dimensional analysis
 -- Two case whens combined in same query 
 -- group by two columns simultaneously
 -- shows intersecting risk factors together
 -- this is called customer segmentation in banking
 
-- query 7 = Loan Grade Default Analysis
-- Does the banks own internal grading sys predict defaults accurately
use credit_risk_db;
select
loan_grade as Loan_Grade,
count(*) Total_loans,
 round(avg(loan_status),2) as default_rate,
 round(avg(loan_amnt),2) as Avg_loan_amount,
 round(avg(loan_int_rate),2) as avg_intrest_rate,
 sum(case when loan_status = 1 
 then Loan_amnt else 0 end) as total_defaulted_value
 from credit_risk_clean
 group by loan_grade
 order by loan_grade asc;
 -- Expected Result
 -- Grade A lowest default rate
 -- Grade G highest deault rate
 -- Perfect A through G Progression 
 -- why this query: 
 -- calculates total loan value only for defaulted
 -- accounts per grade, shows actual money lost not just percentage.
 -- cross validates our risk tiers model against banks own grading sys.
 
 -- Query 8 expected loss calculation 
 -- What is mathmateically projected loss per risk tier
 
 select 
 case
 when loan_int_rate < 8 Then 'Low Risk'
 when loan_int_rate < 13 then 'Medium Risk'
 when loan_int_rate < 18 then 'High Risk'
 else 'critical risk'
 end as risk_tier,
 count(*) as Total_customers,
 round(avg(loan_status),2) as Default_rate,
 round(sum(loan_amnt),2) as total_exposure,
 round(sum(loan_amnt) * avg(loan_status),2) as expected_loss
  from credit_risk_clean
 group by Risk_Tier
 order by expected_loss desc;
 -- Expected Result
 -- Medium Risk highest Expected Loss despite lower default rate
 -- because of volume confimrs power BI findings as
 -- Medium Risk is biggest threat not critical risk
 -- why this query = implements expected loss formula 
 -- expected loss = probability of default * exposure
 -- this is a real basel III banking concept 
