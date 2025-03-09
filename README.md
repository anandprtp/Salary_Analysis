# 📊 MySQL Employee Compensation Analysis Project

<div align="center">
  <img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL"/>
  <img src="https://img.shields.io/badge/Data%20Analysis-28A745?style=for-the-badge" alt="Data Analysis"/>
  <img src="https://img.shields.io/badge/Business%20Intelligence-0066B1?style=for-the-badge" alt="BI"/>
  <img src="https://img.shields.io/badge/SQL-F29111?style=for-the-badge" alt="SQL"/>
</div>

## 🌟 Overview
This project provides a detailed SQL-based analysis of employee compensation data, covering various business insights such as salary trends, overtime impact, agency-based pay distribution, and job title compensation comparisons. The project showcases SQL techniques including joins, aggregations, window functions, and data manipulation strategies.

<div align="center">
  <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/mysql/mysql-original-wordmark.svg" alt="mysql" width="100" height="100"/>
</div>

## 📋 Table of Contents
- [🎯 Business Problems](#-business-problems)
- [📁 Project Structure](#-project-structure)
- [🗄️ Data Schema](#️-data-schema)
- [🚀 Setup Instructions](#-setup-instructions)
- [💡 Query Explanations](#-query-explanations)
- [📷 Sample Output](#-sample-output)
- [🤝 Contributing](#-contributing)
- [📜 License](#-license)

## 🎯 Business Problems
This project addresses key business insights, including:

1. **💰 Top Earners**: Identifying the highest-paid employees across years.
2. **⏱️ Overtime Impact**: Analyzing how overtime contributes to total pay.
3. **👔 Job Title Compensation**: Comparing earnings across different job titles.
4. **📈 Yearly Salary Trends**: Understanding compensation growth over time.
5. **🏢 Agency-Based Pay**: Analyzing pay differences across agencies.
6. **🔍 Duplicate Employee Names**: Identifying potential data inconsistencies.
7. **📊 Employee Status Analysis**: Evaluating employment status distributions.

For detailed problem statements, refer to [Business_Requirements.md](Business_Requirements.md).

## 📁 Project Structure
```
📂 Salary Insights/
├── 📄 README.md                   # Project overview and instructions
├── 📄 Business_Requirements.md    # Detailed business problems and requirements
├── 📄 salary_dump.sql             # Database schema and data dump
└── 📄 salary_insights.sql         # SQL queries solving all business problems
```

## 🗄️ Data Schema
The database consists of four main tables:

### **`job_titles`** (Stores job titles)
| Field       | Type         | Description                   |
|------------|--------------|--------------------------------|
| JobTitleID | int (PK)     | Unique identifier for job title |
| JobTitle   | varchar(255) | Name of the job title         |

### **`agencies`** (Stores agency details)
| Field      | Type         | Description                    |
|-----------|--------------|--------------------------------|
| AgencyID  | int (PK)     | Unique identifier for agency  |
| AgencyName| varchar(255) | Name of the agency            |

### **`employees`** (Stores employee information)
| Field        | Type         | Description                          |
|-------------|--------------|--------------------------------------|
| EmployeeID  | int (PK)     | Unique identifier for employee      |
| EmployeeName| varchar(255) | Employee’s full name                |
| Status      | text         | Employment status (Full-time, etc.) |
| Benefits    | text         | Employee benefits details           |
| AgencyID    | int (FK)     | Foreign key linking to agencies     |

### **`salaries`** (Stores salary details per employee per year)
| Field            | Type   | Description                               |
|----------------|--------|-------------------------------------------|
| SalaryID       | int (PK) | Unique identifier for salary record      |
| EmployeeID     | int (FK) | Foreign key linking to employees        |
| JobTitleID     | int (FK) | Foreign key linking to job_titles       |
| BasePay        | double | Base salary amount                       |
| OvertimePay    | double | Overtime compensation                    |
| OtherPay       | double | Other earnings (bonuses, stipends, etc.)|
| TotalPay       | double | Total salary before benefits            |
| TotalPayBenefits | double | Total compensation including benefits   |
| Year           | int    | Year of the salary record                |
| Notes         | text   | Additional salary-related notes         |

## 🚀 Setup Instructions
1. **Clone the repository**:
   ```bash
   git clone https://github.com/anandprtp/Salary_Analysis.git
   cd Salary_Analysis
   ```

2. **Import the database**:
   ```bash
   mysql -u your_username -p < salary_dump.sql
   ```

3. **Execute queries**:
   ```bash
   mysql -u your_username -p salary_dump < salary_insights.sql
   ```

   <details>
   <summary>📝 Alternative Method</summary>
   Run queries manually using MySQL Workbench or another SQL client.
   </details>

## 💡 Query Explanations
Each SQL query in `solutions.sql` includes:
- 🎯 The business problem being solved
- 🛠️ SQL techniques used (Joins, Aggregations, Window Functions, etc.)
- 📊 How to interpret the results

## 📷 Sample Output
Sample query outputs are stored in the `sample_outputs` folder to help validate results.

## 🤝 Contributing
Contributions are welcome! Feel free to submit a pull request.

## 📜 License
This project is licensed under the MIT License - see the LICENSE file for details.

<div align="center">
  <p>⭐ Star this repository if you find it useful! ⭐</p>
  <a href="https://github.com/yourusername/mysql-employee-compensation/issues">
    <img src="https://img.shields.io/github/issues/yourusername/mysql-employee-compensation?style=for-the-badge" alt="issues"/>
  </a>
  <a href="https://github.com/yourusername/mysql-employee-compensation/network/members">
    <img src="https://img.shields.io/github/forks/yourusername/mysql-employee-compensation?style=for-the-badge" alt="forks"/>
  </a>
  <a href="https://github.com/yourusername/mysql-employee-compensation/stargazers">
    <img src="https://img.shields.io/github/stars/yourusername/mysql-employee-compensation?style=for-the-badge" alt="stars"/>
  </a>
</div>

