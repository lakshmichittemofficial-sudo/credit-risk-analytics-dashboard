# Credit Risk Analytics Dashboard
### End-to-End Portfolio Risk Analysis | Power BI & MySQL

---

## Project Overview

A comprehensive credit risk analysis project simulating 
real-world retail bank portfolio monitoring. Analysed a 
28,638 account loan portfolio to identify default risk 
patterns, validate risk classification models, and deliver 
actionable lending policy recommendations.

**Tools Used:** Power BI Desktop | MySQL Workbench | 
Power Query | DAX

**Domain:** Credit Risk | Retail Banking | Financial Analytics

**Relevant Roles:** Data Analyst | Credit Analyst | 
Risk Analyst | Business Analyst

---

## Business Problem

A retail bank needs to understand the health of its £276M 
loan portfolio. The Risk Committee requires answers to 4 
critical questions:

1. How healthy is the overall portfolio?
2. Which customers are most likely to default?
3. How much money is at risk of being lost?
4. Where should the bank act first to reduce losses?

---

## Dataset

- **Source:** Kaggle — Credit Risk Dataset
- **Size:** 32,581 rows × 12 columns (raw)
- **After cleaning:** 28,638 rows × 15 columns
- **Key variables:** Age, Income, Employment Length, 
  Loan Amount, Interest Rate, Loan Grade, Default Status

---

## Data Cleaning & Transformation (Power Query)

| Step | Action | Reason |
|------|--------|--------|
| Removed nulls | loan_int_rate, person_emp_length | Critical risk variables — incomplete rows excluded |
| Removed outliers | Age > 80, Income > 2,000,000 | Data entry errors skewing analysis |
| Renamed columns | All 12 columns renamed | Stakeholder readable labels |
| Created Income Band | Low/Medium/High/Very High | Customer segmentation |
| Created Risk Tier | Low/Medium/High/Critical | Interest rate based risk proxy |
| Created Default Label | Default/No Default | Human readable status |

**Data correction noted:** Income Band formula corrected 
during build — Medium threshold fixed from 7,000 to 70,000. 
Always document corrections transparently.

---

## Dashboard Structure

### Page 1 — Portfolio Overview
High level portfolio health metrics

**Key Metrics:**
- Total Customers: 28,632
- Portfolio Value: £276M
- Average Interest Rate: 11.04%
- Default Rate: 22% (industry average 2-5%)

---

### Page 2 — Risk Analysis
Default rate validation across customer segments

**Key Findings:**
- Risk Tier model validated — perfect progressive 
  relationship from 9% (Low) to 69% (Critical)
- Debt Consolidation loans carry highest default 
  risk at 28% — counterintuitive finding
- Low Income customers default at 46% — double 
  portfolio average

---

### Page 3 — Default Analysis
Exposure quantification and policy thresholds

**Key Findings:**
- Loan Grade A-G progression cross-validates 
  Risk Tier model independently
- Medium Risk holds £126M exposure — biggest 
  systemic threat despite lower default rate
- Critical policy threshold identified at 12% 
  interest rate — default rate doubles above this point

---

### Page 4 — Portfolio Explorer
Interactive customer profiling with dynamic filtering

**Interactive Features:**
- 5 synced slicers filtering entire dashboard
- Stress test parameter — projects portfolio losses 
  at different default rate scenarios
- Navigation buttons across all pages

---

## Key Analytical Findings

### Finding 1 — Portfolio Is Significantly Distressed
22% default rate against industry average of 2-5%. 
Average interest rate of 11.04% confirms subprime 
portfolio positioning.

### Finding 2 — Risk Model Validated
Interest rate based Risk Tier classification shows 
perfect progressive default relationship:

| Risk Tier | Default Rate |
|-----------|-------------|
| Low Risk | 9% |
| Medium Risk | 16% |
| High Risk | 40% |
| Critical Risk | 69% |

### Finding 3 — Medium Risk Is Biggest Systemic Threat
Despite Critical Risk having 69% default rate, 
Medium Risk holds £126M exposure vs Critical Risk's £6M.
Expected Loss = Probability of Default × Exposure
Critical Risk: 69% × £6M   = £4.1M
Medium Risk:   16% × £126M = £20.2M
Medium Risk expected loss is 5x larger than Critical Risk.

### Finding 4 — Critical Interest Rate Threshold
Clear default rate inflection point at 12%:

| Interest Rate Band | Default Rate |
|-------------------|-------------|
| Under 8% | 9% |
| 8-12% | 15% |
| 12-16% | 31% |
| 16-20% | 62% |
| Above 20% | 86% |

### Finding 5 — Dominant Borrower Profile
Typical high-risk customer: Age 22-25, 0-3 years 
employment, renting, borrowing for education or 
medical necessity.

---

## Policy Recommendations

1. **Interest Rate Cap:** Implement enhanced credit 
   committee approval for all loans above 12% interest rate
2. **Medium Risk Monitoring:** Establish quarterly 
   portfolio review program for Medium Risk segment 
   given £126M exposure
3. **Income-Based Limits:** Reduce maximum loan amounts 
   for Low Income band customers — currently defaulting 
   at 46%
4. **Debt Consolidation Scrutiny:** Highest default 
   purpose at 28% — require proof of debt repayment 
   plan at application
5. **Young Borrower Assessment:** Implement income 
   trajectory scoring for borrowers under 25 with 
   under 3 years employment

---

## SQL Analysis

8 queries covering portfolio health, risk segmentation, 
collections prioritisation and Expected Loss calculation.

See: [SQL/SQL_Queries_CreditRisk_LakshmiChittem.sql]

**Key SQL techniques used:**
- CASE WHEN for dynamic risk tier classification
- GROUP BY for customer segmentation
- SUM(CASE WHEN) for conditional aggregation
- Expected Loss formula implementation
- Multi-dimensional segmentation combining 
  two CASE WHEN statements

---

## Skills Demonstrated

| Category | Skills |
|----------|--------|
| Data Cleaning | Power Query, Null handling, Outlier removal, Data transformation |
| Analytics | Risk classification, Default prediction, Portfolio analysis, Expected Loss |
| Visualisation | Power BI, DAX measures, Interactive slicers, KPI cards |
| SQL | MySQL, CASE WHEN, GROUP BY, Aggregations, Subqueries |
| Domain Knowledge | Credit risk, Basel III, FCA compliance, Lending policy |
| Soft Skills | Hypothesis formation, Stakeholder communication, Data storytelling |

---

## About The Analyst

Lakshmi Chittem — Data & Credit Risk Analyst
- MSc Business Management — Loughborough University
- Former Credit Analyst — E.ON Next UK
- Based in Hyderabad | Open to Relocation

📧 chittem.lakshmi@outlook.com
🔗 [https://www.linkedin.com/in/chittemlakshmiharipriya/]
💻 github.com/lakshmichittemofficial-sudo

---

*Project built as part of a financial analytics portfolio 
targeting Data Analyst, Credit Analyst and Risk Analyst 
roles at JP Morgan, Citi, HSBC, Deloitte and Accenture.*
