USE salary_insights; -- Connect to database

/*
1. Employee Compensation Analysis
Find the top 10 employees who have earned the most (TotalPayBenefits) over all years.
*/
SELECT 
    e.EmployeeID,
    e.EmployeeName,
    ROUND(SUM(s.TotalPayBenefits), 2) AS TotalEarnings
FROM
    employees e
        LEFT JOIN
    salaries s ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID , e.EmployeeName
ORDER BY TotalEarnings DESC
LIMIT 10;


/*
2. High Overtime Employees
List employees whose overtime pay is more than 50% of their base pay in any given year.
*/
WITH high_ot AS (
	SELECT 
    EmployeeID,
    Year,
    ROUND(SUM(OvertimePay),2) AS total_ot,
    ROUND(SUM(BasePay),2) AS total_bp
FROM
    salaries
GROUP BY EmployeeID, Year
HAVING SUM(OvertimePay) > SUM(BasePay) * 0.5
)
SELECT 
    e.EmployeeId,
    e.EmployeeName,
    high_ot.Year,
    total_ot,
    total_bp
FROM
    employees e
        JOIN
    high_ot ON e.EmployeeId = high_ot.EmployeeID
ORDER BY total_ot DESC;


/*
3. Job Titles with Highest Earnings
Identify the top 5 job titles with the highest average TotalPayBenefits.
*/
WITH avg_salaries AS (
	SELECT 
    JobTitleID, ROUND(AVG(TotalPayBenefits), 2) AS avg_tpb
FROM
    salaries
GROUP BY JobTitleID
)
SELECT 
    a.JobTitleId, jt.JobTitle, a.avg_tpb
FROM
    job_titles jt
        JOIN
    avg_salaries a ON jt.JobTitleID = a.JobTitleID
ORDER BY a.avg_tpb DESC
LIMIT 5;


/*
4. OvertimePay vs. Total Pay
Find employees whose overtime pay makes up more than 20% of their TotalPayBenefits.
*/
SELECT 
    e.EmployeeID,
    e.EmployeeName,
    ROUND(SUM(s.OvertimePay) / SUM(s.TotalPayBenefits) * 100,
            2) AS percent
FROM
    employees e
        JOIN
    salaries s ON s.EmployeeID = e.EmployeeID
WHERE
    s.TotalPayBenefits > 0
        AND s.OvertimePay > 0
GROUP BY e.EmployeeID , e.EmployeeName
HAVING percent > 20
ORDER BY percent DESC;


/*
5. Agency-Wise Pay Analysis
Compare the total pay (TotalPayBenefits) between different agencies (assuming multiple agencies exist in the future).
*/
SELECT 
    a.AgencyID,
    a.AgencyName,
    ROUND(SUM(TotalPayBenefits), 2) AS total_pay
FROM
    agencies a
        LEFT JOIN
    employees e ON e.AgencyID = a.AgencyID
        LEFT JOIN
    salaries s ON s.EmployeeID = e.EmployeeID
GROUP BY a.AgencyID , a.AgencyName
ORDER BY total_pay DESC;


/*
6. Yearly Salary Trends
Find the average TotalPayBenefits for each year and analyze if salaries are increasing or decreasing over time.
*/
SELECT 
    Year, AVG(TotalPayBenefits) AS AvgTotalPayBenefits
FROM
    salaries
GROUP BY Year
ORDER BY Year;


/*
7. Employee Status Distribution
Find how many employees fall under each Status category.
*/
SELECT 
    COALESCE(Status, 'Unknown') AS Status,
    COUNT(*) AS employee_count
FROM
    employees
GROUP BY Status
ORDER BY employee_count DESC;


/*
9. Job Title Distribution Across Agencies
Analyze how job titles are distributed across different agencies. 
Find the number of employees for each job title in each agency, 
but only for job titles that appear in more than two different agencies.
*/
WITH cte AS (
	SELECT 
    COUNT(DISTINCT a.AgencyName) agency, jt.JobTitle
FROM
    job_titles jt
        JOIN
    salaries s ON jt.JobTitleID = s.JobTitleID
        JOIN
    employees e ON s.EmployeeID = e.EmployeeID
        JOIN
    agencies a ON a.AgencyID = e.AgencyID
GROUP BY jt.JobTitle
HAVING agency > 2
)
SELECT 
    a.AgencyName,
    jt.JobTitle,
    COUNT(e.EmployeeID) AS num_employees
FROM
    job_titles jt
        JOIN
    salaries s ON jt.JobTitleID = s.JobTitleID
        JOIN
    employees e ON s.EmployeeID = e.EmployeeID
        JOIN
    agencies a ON a.AgencyID = e.AgencyID
WHERE
    jt.JobTitle IN (SELECT 
            JobTitle
        FROM
            cte)
GROUP BY a.AgencyName , jt.JobTitle
ORDER BY a.AgencyName , num_employees DESC;


/*
10. Salary Growth of Employees
For all employees, retrieve their total pay with benefits for each year. Additionally, 
calculate the percentage growth in salary compared to the previous year. If no prior year data exists, display "N/A".
*/
WITH yearly_salaries AS (
SELECT 
    EmployeeID, Year, 
    SUM(TotalPayBenefits) AS total_pay_benefits,
    LAG(SUM(TotalPayBenefits)) OVER(PARTITION BY EmployeeID ORDER BY Year) AS prev_year_salary
FROM
    salaries
    GROUP BY EmployeeID, Year
)
SELECT 
    EmployeeID,
    Year,
    total_pay_benefits,
    CASE
        WHEN prev_year_salary IS NULL THEN 'N/A'
        ELSE CONCAT(ROUND((total_pay_benefits - prev_year_salary) / prev_year_salary * 100,
                        2),
                '%')
    END AS salary_growth_percentage
FROM
    yearly_salaries
ORDER BY EmployeeID , Year;