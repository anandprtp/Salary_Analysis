# Business Requirements

This document outlines the detailed business requirements for the MySQL Employee Compensation Analysis Project. Each requirement represents a real-world business problem that can be solved using SQL queries on the employee compensation database.

## Problem 1: Employee Compensation Analysis
### Business Need
The organization needs to identify top earners across all years to understand compensation distribution and potentially review high-cost personnel.

### Requirements
- Find the top 10 employees who have earned the most (TotalPayBenefits) over all years
- Results should include employee names, job titles, and total compensation
- Sort results in descending order of total compensation

## Problem 2: High Overtime Employees
### Business Need
HR department needs to identify employees with disproportionately high overtime, which may indicate staffing issues, workload imbalances, or potential burnout situations.

### Requirements
- List employees whose overtime pay is more than 50% of their base pay in any given year
- Include employee name, job title, year, base pay, overtime pay, and the ratio of overtime to base pay
- Sort results by the overtime-to-base ratio in descending order

## Problem 3: Job Titles with Highest Earnings
### Business Need
Compensation analysts need to identify which job titles command the highest compensation to inform hiring decisions and budget allocations.

### Requirements
- Identify the top 5 job titles with the highest average TotalPayBenefits
- Results should include job title, number of employees with that title, and average total compensation
- Only include job titles held by at least 3 employees to ensure statistical relevance

## Problem 4: OvertimePay vs. Total Pay
### Business Need
Finance department needs to understand the contribution of overtime to total compensation costs to better plan budgets and identify departments with high overtime costs.

### Requirements
- Calculate the percentage contribution of overtime pay to the total earnings for each employee
- Include employee name, job title, total pay, overtime pay, and percentage
- Filter out employees with zero or null overtime pay
- Sort by percentage in descending order

## Problem 5: Agency-Wise Pay Analysis
### Business Need
Executive management needs to compare compensation across different agencies/departments to identify disparities and ensure equitable pay practices.

### Requirements
- Compare the total pay between different agencies
- Calculate average, minimum, maximum, and median compensation for each agency
- Include employee count per agency
- Sort results by average total compensation in descending order

## Problem 6: Yearly Salary Trends
### Business Need
Finance and HR departments need to track compensation trends over time to understand cost increases and for future budget planning.

### Requirements
- Calculate the average TotalPayBenefits for each year
- Determine if salaries are increasing or decreasing over time
- Include year, average compensation, and year-over-year percentage change
- Sort results chronologically

## Problem 7: Employee Status Distribution
### Business Need
HR department needs to understand the distribution of employment statuses for workforce planning and compliance reporting.

### Requirements
- Count how many employees fall under each Status category
- Include status category and employee count
- Calculate percentage of total workforce for each status
- Sort by employee count in descending order

## Problem 8: Duplicate Employee Names
### Business Need
Data quality team needs to identify potential duplicate records or employees who may have been assigned multiple employee IDs over time.

### Requirements
- Find employees with the same EmployeeName but different EmployeeID
- Include employee name, all associated employee IDs, and respective job titles
- Sort results alphabetically by employee name

## Problem 9: Most Common Job Titles
### Business Need
HR department needs to identify the most common job titles to understand workforce composition and standardize job classifications.

### Requirements
- List the 10 most common job titles and the number of employees assigned to each
- Include job title, employee count, and percentage of total workforce
- Sort results by employee count in descending order

## Problem 10: Salary Growth of Employees
### Business Need
Compensation analysts need to track individual employee salary growth over time to identify high-performers and ensure fair progression.

### Requirements
- For all employees, retrieve their total pay with benefits for each year
- Calculate the percentage growth in salary compared to the previous year
- Display "N/A" if no prior year data exists
- Include employee name, job title, year, current year compensation, previous year compensation, and growth percentage
- Sort results by employee name and year

## Data Requirements
The analysis requires a comprehensive employee compensation database with the following fields:
- EmployeeID (unique identifier)
- EmployeeName (full name)
- JobTitle (position title)
- BasePay (base salary)
- OvertimePay (overtime compensation)
- OtherPay (bonuses, stipends, etc.)
- Benefits (monetary value of benefits)
- TotalPay (sum of base, overtime, and other pay)
- TotalPayBenefits (total pay plus benefits)
- Year (fiscal or calendar year)
- Agency (department or organizational unit if applicable)
- Status (employment status: full-time, part-time, etc.)

All monetary values should be stored in a consistent currency format with two decimal places.