SELECT concat(NAME,concat("(",concat(substr(OCCUPATION,1,1),")"))) FROM OCCUPATIONS ORDER BY NAME ASC;

SELECT "There are total ", count(OCCUPATION), concat(lower(occupation),"s.") FROM OCCUPATIONS GROUP BY OCCUPATION ORDER BY count(OCCUPATION) ASC;

SELECT
    CASE 
        WHEN Occupation = 'Doctor' THEN CONCAT(Name, '(D)')
        WHEN Occupation = 'Actor' THEN CONCAT(Name,'(A)')
        WHEN Occupation = 'Singer' THEN CONCAT(Name, '(S)')
        WHEN Occupation = 'Professor' THEN CONCAT(Name, '(P)')
    END
FROM OCCUPATIONS; 

SELECT CONCAT(CONCAT('There are a total of ',count(*)),lower(occupation),"s." ) 
FROM OCCUPATIONS 
GROUP BY Occupation;

SELECT concat(NAME,concat("(",concat(substr(OCCUPATION,1,1),")"))) FROM OCCUPATIONS ORDER BY NAME ASC;

SELECT "There are a total of ", count(OCCUPATION), concat(lower(occupation),"s.") FROM OCCUPATIONS GROUP BY OCCUPATION ORDER BY count(OCCUPATION), OCCUPATION ASC