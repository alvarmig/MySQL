select * from HR.EMPLOYEES e 
JOIN HR.DEPARTMENTS d  
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
	
select 
	e.EMPLOYEE_ID, 
	CONCAT(e.FIRST_NAME, e.LAST_NAME) AS full_name, 
	e.EMAIL, e.JOB_ID, 
	d.DEPARTMENT_NAME, 
	d.MANAGER_ID 
from HR.EMPLOYEES e 
JOIN HR.DEPARTMENTS d  
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
WHERE ROWNUM <= 5

select 
	e.EMPLOYEE_ID, 
	CONCAT(e.FIRST_NAME, e.LAST_NAME) AS full_name,
	e.EMAIL, e.JOB_ID,j.JOB_TITLE, 
	j.MAX_SALARY  
from HR.EMPLOYEES e 
JOIN HR.JOBS j 
    ON e.JOB_ID = j.JOB_ID 
WHERE MAX_SALARY > 6000 
ORDER BY MAX_SALARY ASC

select 
	UPPER(first_name), 
	MAX(salary) 
FROM HR.EMPLOYEES 
GROUP BY first_name, salary

select 
	UPPER(first_name), 
	last_name,  MAX(salary) 
FROM HR.EMPLOYEES 
GROUP BY first_name, last_name, salar