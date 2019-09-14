SELECT AVG(salary) FROM HR.EMPLOYEES;

SELECT 
    CONCAT(e.first_name, CONCAT(' ',e.last_name)) AS full_name, 
    d.department_name, 
    AVG(e.salary) AS average_salary
FROM HR.EMPLOYEES e
JOIN HR.DEPARTMENTS d
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE d.department_name = 'IT'
GROUP BY e.first_name, e.last_name,d.department_name, e.salary
HAVING AVG(e.salary) > 4000
ORDER BY average_salary DESC;


SELECT first_name, salary
FROM HR.employees
WHERE department_id = (SELECT department_id FROM HR.departments WHERE department_name = 'IT')
AND SALARY > (SELECT AVG(salary) FROM HR.EMPLOYEES);


SELECT 
    (e.first_name || ' ' || e.last_name) AS full_name, 
    d.department_name, 
    e.HIRE_DATE,
    to_char(e.HIRE_DATE, 'MONTH') AS month,
    EXTRACT(month FROM e.HIRE_DATE) AS month_number
FROM HR.EMPLOYEES e
JOIN HR.DEPARTMENTS d
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE d.department_name IN( 'Marketing', 'Finance', 'Shipping') AND  EXTRACT(month FROM e.HIRE_DATE) = 8;

SELECT 
    e.first_name || ' ' || e.last_name AS full_name, 
    d.department_name, 
    e.salary, 
    CASE
        WHEN DEPARTMENT_NAME='Administration' THEN (salary + 250) 
        WHEN DEPARTMENT_NAME='Marketing' THEN (salary * 0.15) + salary
        WHEN DEPARTMENT_NAME='IT' THEN (salary * 0.08) + salary
        ELSE 0
    END AS promotion
FROM HR.EMPLOYEES e
JOIN HR.DEPARTMENTS d
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
ORDER BY promotion DESC;

SELECT 
    first_name || ' ' || last_name AS full_name, 
    (SELECT DEPARTMENT_NAME FROM HR.DEPARTMENTS d WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID) AS department_name, 
    salary, 
    CASE    (SELECT DEPARTMENT_NAME FROM HR.DEPARTMENTS d WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID)
        WHEN 'Administration' THEN (salary + 250) 
        WHEN 'Marketing' THEN (salary * 0.15) + salary
        WHEN 'IT' THEN (salary * 0.08) + salary
        ELSE 0
    END AS promotion
FROM HR.EMPLOYEES e
ORDER BY promotion DESC;

SELECT 
    e.first_name || ' ' || e.last_name AS full_name, 
    d.department_name, 
    e.salary, 
    DECODE(DEPARTMENT_NAME, 'Administration', (salary + 250), 
                            'Marketing', (salary * 0.15) + salary, 
                            'IT', (salary * 0.08) + salary, 
                            0)
    promotion
FROM HR.EMPLOYEES e
JOIN HR.DEPARTMENTS d
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
ORDER BY promotion DESC;
