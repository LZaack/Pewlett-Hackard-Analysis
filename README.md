# Pewlett-Hackard-Analysis
## Overview
The purpose of this analysis is divided into the following:

  **1** Determine the number of retiring employees per title, and 

  **2** Identify employees who are eligible to participate in a mentorship program.

## Results

To achieve the results asked, I created two deliverables:

### The Number of Retiring Employees by Title

`(i)` I retrieve the `emp_no`,  `first_name`, and `last_name` columns from the Employees table, and the `title`, `from_date`, and `to_date` columns from the Titles table;

`(ii)` I created the `retirement_titles` table using the INTO clause and joining both tables on the primary key;

`(iii)` Then I filtered the data on the `birth_date` column to retrieve the employees who were born between 1952 and 1955, and ordered by the employee number;

`(iv)` I exported the `retirement_titles` table, as it is shown:

![retirement_titles](/Pewlett-Hackard-AnalysisFolder/Queries/retirement_titles.png)

`(v)` After that, I retrieve the employee number, first and last name, and title columns from the `retirement_titles` table;

`(vi)` I used the `DISTINCT ON` statement to retrieve the first occurrence of the employee number for each set of rows defined by the `ON ()` clause;

`(vii)` I excluded those employees that have already left the company by filtering on `to_date` to keep only those dates that are equal to `'9999-01-01'`;

`(viii)` I create the `unique_titles` table using the INTO clause, and I exported it as follows:

![unique_titles](/Pewlett-Hackard-AnalysisFolder/Queries/unique_titles.png)

`(ix)` Then, I retrieved the number of employees by their most recent job title who are about to retire;

`(x)` I created the `retiring_titles` table to hold the number of titles sorted by the count of employees in descending order and exported as the next:

![retiring_titles](/Pewlett-Hackard-AnalysisFolder/Queries/retiring_titles.png)

### The Employees Eligible for the Mentorship Program

`(i)` I retrieve the `emp_no`, `first_name`, and `last_name` columns from the Employees table, `from_date`, and `to_date` columns from the Department Employee table, and `title` column from the Titles table;

`(ii)` I used a `DISTINCT ON` statement to retrieve the first occurrence of the employee number for each set of rows defined by the `ON ()` clause;

`(iii)` I created the `mentorship_eligibility` table using the INTO clause and joining both tables on the primary key;

`(iv)` Then I filtered the data on the `birth_date` column to retrieve the employees who were born in 1965, and ordered by the employee number;

`(v)` Finally, I exported the `mentorship_eligibility ` table:

![mentorship_eligibility](/Pewlett-Hackard-AnalysisFolder/Queries/mentorship_eligibility.png)

After all these processes the results can be interpreted in four conclusions:

  **First** The candidates to retire are the sum of 72, 458 employees;

  **Second** The 35.77% and the 34.40% of the retirement candidates are Senior Engineer and Senior Staff;

  **Third** The 70.17% are in senior positions, and just 23.35% are in lower positions, which means that there are going to be strategic positions vacant soon, which could probably affect the company’s operations.

  **Fourth** Just 6.48% of the retirement candidates work as Technique Leader or Assistant Engineer. 

## Summary

After delivering my analysis, they asked me to answer the following questions: 

  **A** How many roles will need to be filled as the "silver tsunami" begins to make an impact?

We can answer this question by filtering the retirement candidates from their birth date, as in the following table are those who were born in 1952 which are the first to retire. 

![first_retiring_titles](/Pewlett-Hackard-AnalysisFolder/Queries/first_retiring_titles.png)

  **B** Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

Probably no, if we sort the mentorship_eligibility table by title the result is going to be not enough qualified employees that could mentor the following generation, as is in the next image:

![mentorship_eligibility_per_title](/Pewlett-Hackard-AnalysisFolder/Queries/mentorship_eligibility_per_title.png)
