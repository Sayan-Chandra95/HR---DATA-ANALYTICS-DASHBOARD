create database Human_Resource_Project
use Human_Resource_Project

Select *
From HR

EXEC sp_help 'HR'

UPDATE hr

-- Changing data type of Termdate
SET termdate = TRY_CONVERT(date, LEFT(termdate, 10))
WHERE termdate IS NOT NULL AND termdate <> '';

ALTER TABLE hr
ALTER COLUMN termdate DATE;

-- Adding a 'Age' column in the table

Alter table dbo.HR Add Age INT;

update HR
Set Age =
 datediff(Year,birthdate,Getdate())
  - CASE
   when dateadd(YEAR,Datediff(YEAR,birthdate,Getdate()),birthdate) > Getdate()
   Then 1
   Else 0
   END;

--What is the gender breakdown of employees in the company?
Select gender, count(*) AS count
From HR
Where Age >=18 and termdate IS NULL
Group by gender;

--What is the race/ethnicity breakdown of employees in the company?
Select race, count(*) AS count
From HR
Where Age >=18 and termdate IS NULL
Group by race
Order by count(*) desc ;

--What is the age distribution of employees in the company?

Select min(Age), Max(Age)
From HR;

Select 
 Case
  When Age>= 18 AND Age<=25 Then '18-25'
  When Age>= 26 AND Age<=35 Then '26-35'
  When Age>= 36 AND Age<=45 Then '36-45'
  When Age>= 46 AND Age<=55 Then '46-55'
  Else '55+'
END AS Age_Group,Gender,
count(*) AS Count
From HR
Where Age >=18 and termdate IS NULL
Group by  Case
  When Age>= 18 AND Age<=25 Then '18-25'
  When Age>= 26 AND Age<=35 Then '26-35'
  When Age>= 36 AND Age<=45 Then '36-45'
  When Age>= 46 AND Age<=55 Then '46-55'
  Else '55+'
END, Gender
Order by Age_Group,Gender DESC;

--How many employees work at headquarters versus remote locations?

Select location, Count(*) AS Count
From HR
Where Age >=18 and termdate IS NULL
Group by location;

--What is the average length of employment for employees who have been terminated?

Select
 Round(AVG(DATEDIFF(Year,hire_date,termdate)),0) AS Avg_Length_Employment
From HR
Where Age >=18 and termdate IS NOT NULL and termdate <= GETDATE();

--How does the gender distribution vary across departments and job titles?

Select gender,department,count(*) AS Count
From HR
Where Age >=18 and termdate IS NULL
Group by gender,department
Order by department;

--What is the distribution of job titles across the company?

Select jobtitle, count(*) AS Distribution
From HR
Where Age >=18 and termdate IS NULL
Group by jobtitle
Order by jobtitle desc;

--Which department has the highest turnover rate?
Select department, Total_Count,terminated_count,
CAST(terminated_count AS FLOAT) / Total_Count * 100 AS termination_rate
From
(Select department, Count(*) AS Total_Count,
Sum(CASE When termdate IS NOT NULL and termdate <= GETDATE()
Then 1 Else 0
END) AS terminated_count
From HR
Where Age >= 18
Group by department) AS Secondary
Order by termination_rate DESC; 

--What is the distribution of employees across locations by state?

Select location_state, Count(*) AS Count
From HR
Where Age >=18 AND termdate IS NULL
Group by location_state
Order by Count DESC;

--How has the company's employee count changed over time based on hire and term dates?

Select year, hires, terminated_count,
(hires-terminated_count) AS net_change,
Round(cast(hires-terminated_count AS float)/hires*100,2) AS net_change_percent
From
(Select
Year(hire_date) AS year,
Count(*) AS hires,
Sum(CASE When termdate IS NOT NULL and termdate <= GETDATE()
Then 1 Else 0
END) AS terminated_count
From HR
Where Age >= 18
Group by Year(hire_date)) AS Secondary
Order by year;

--What is the tenure distribution for each department?

Select department,
Round(AVG(DATEDIFF(year,termdate,hire_date)),0) AS AVG_tenure
From HR
Where Age >=18 and termdate IS NOT NULL and termdate <= GETDATE()
Group by department;