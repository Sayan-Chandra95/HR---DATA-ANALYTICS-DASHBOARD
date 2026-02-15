# HR Data Analytics Dashboard — SQL & Power BI Project

## Project Overview
This project analyzes HR data spanning several years to provide insights on workforce demographics, employee distribution, turnover, and tenure trends. Using SQL Server Management Studio (SSMS) for data cleaning and aggregation, and Power BI for interactive dashboards, this project enables HR managers to make data-driven decisions.

---

## Project Objectives
- Workforce Demographics: Analyze gender, age, and race/ethnicity distribution of employees.
- Employee Distribution: Explore employee counts by departments, job titles, and locations.
- Turnover Analysis: Measure turnover rates across departments and roles.
- Tenure Trends: Study average tenure and employee retention patterns.
- Interactive Dashboards: Enable slicing, filtering, and visualization of HR metrics in Power BI.

---

## Tools & Techniques
**Data Preparation (SQL/SSMS):**
- Cleaned datasets, handled missing values, and standardized dates.
- SQL queries for employee distribution, tenure, and turnover calculations.

**Data Visualization (Power BI):**
- Interactive dashboards showing key HR KPIs: employee count, turnover rate, average tenure.
- Charts include bar charts, line graphs, pie charts, and geo-maps.
- Slicers for filtering by department, gender, age group, and tenure.
- KPI tiles for instant insights into HR metrics.

---

## Key Business Questions Answered
- What is the gender and race/ethnicity distribution of employees?
- How is the workforce distributed across departments and locations?
- Which departments have the highest turnover rates?
- What is the average tenure for employees and terminated employees?
- How has employee count changed over time?
- Which job titles have high attrition or retention?

---

## Key Insights
- Balanced gender distribution across departments; slight male predominance.
- Majority of employees aged 25–35 years.
- Some departments show higher attrition rates, highlighting retention concerns.
- Average tenure is higher in technical roles compared to operational roles.
- Employee growth is consistent over the years with spikes in hiring during certain months.

---

## Dashboard Snapshots

**Overall HR Analytics Dashboard**  
![HR Analytics Dashboard 1](./Hr_Analytics_1.png)

**Turnover and Hiring Trends**  
![HR Analytics Dashboard 2](./Hr_Analytics_2.png)

---

## Files in Repository
- `HR Report.pbix` — Power BI report file.
- `HR.sql` — SQL scripts used to prepare and analyze HR data.
- CSV files — Cleaned datasets used for Power BI dashboards:
  - `AVG_tenure.csv`
  - `Age_Distribution.csv`
  - `Age_Gender_Distribution.csv`
  - `Avg_Length_Employment.csv`
  - `Count_change.csv`
  - `Gender_breakdown.csv`
  - `Gender_department.csv`
  - `Location.csv`
  - `Race_breakdown.csv`
  - `State.csv`
  - `Termination_rate.csv`
  - `jobtitle_distribution.csv`

---

## Business Impact
- Enables HR teams to make data-driven decisions.
- Identifies departments and roles with high turnover.
- Optimizes workforce planning, recruitment, and retention strategies.
- Visualizes key HR KPIs for quick and informed decision-making.
