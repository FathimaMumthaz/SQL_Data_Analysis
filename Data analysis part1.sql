SELECT * FROM LOCATIONS;
SELECT * FROM DEPARTMENTS;
SELECT * FROM JOBS;
SELECT * FROM EMPLOYEES;
SELECT * FROM JOB_HISTORY;
SELECT * FROM REGIONS;
SELECT * FROM COUNTRIES;


-- Add new employee in the table. 

SELECT * FROM EMPLOYEES ORDER BY EMPLOYEE_ID DESC;

ROLLBACK;
COMMIT;

Insert into EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID)
VALUES (
207,
'Rahul',
'Dravid',
'rd@gmail.comm',
'515.123.9999',
TO_DATE('29-NOV-2021','dd-MON-yyyy'),
'HR_REP',
2400,
NULL,
101,
40
);

--Update the existing record which has incorrect data.
UPDATE EMPLOYEES
SET EMAIL = 'rd@gmail.com'
WHERE EMPLOYEE_ID = 207;


--Update COMMISSION_PCT to 0 COMMISSION_PCT is not available.
UPDATE EMPLOYEES
SET COMMISSION_PCT = 0
WHERE COMMISSION_PCT IS NULL;


--Remove the employee from table.
DELETE FROM EMPLOYEES
WHERE EMPLOYEE_ID = 207;

--Create backup table of employee.
CREATE TABLE EMPLOYEE_BACKUP AS (
SELECT * FROM EMPLOYEES;

SELECT * FROM EMPLOYEE_BACKUP;


--Remove all the records from table.
TRUNCATE TABLE EMPLOYEE_BACKUP;


--Insert all the records of employee table into backup table.
INSERT INTO EMPLOYEE_BACKUP
SELECT * FROM EMPLOYEES;
COMMIT;











SELECT * FROM LOCATIONS;
SELECT * FROM DEPARTMENTS;

SELECT COUNTRY_ID FROM LOCATIONS;
SELECT DISTINCT COUNTRY_ID LOCATIONS;

SELECT DISTINCT MANAGER_ID FROM DEPARTMENTS;
SELECT FIRST_NAME, LAST__NAME FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (108,200,203,204,121,145,103,201,114,100,205);

SELECT FIRST_NAME || ' ' || LAST__NAME AS NAME FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (108,200,203,204,121,145,103,201,114,100,205);

SELECT FIRST_NAME || ' ' || LAST__NAME AS EMPLOYEE_NAME FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (108,200,203,204,121,145,103,201,114,100,205);


SELECT FIRST_NAME || ' ' || LAST__NAME AS "EMPLOYEE NAME" FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (108,200,203,204,121,145,103,201,114,100,205);

SELECT FIRST_NAME || ' ' || LAST__NAME "EMPLOYEE NAME" FROM EMPLOYEES 
WHERE EMPLOYEE_ID IN (108,200,203,204,121,145,103,201,114,100,205); 

SELECT t_emp.FIRST_NAME || ' ' || t_emp.LAST__NAME "EMPLOYEE NAME" 
FROM EMPLOYEES t_emp 
WHERE EMPLOYEE_ID IN (108,200,203,204,121,145,103,201,114,100,205);








SELECT * FROM LOCATIONS;
SELECT * FROM DEPARTMENTS;
SELECT * FROM JOBS;
SELECT * FROM EMPLOYEES;
SELECT * FROM JOB_HISTORY;
SELECT * FROM REGIONS;
SELECT * FROM COUNTRIES;

--List down employee details based on complex nested conditions.
SELECT *
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME IN ('Purchasing', 'IT', 'Executive');

1.1. job id start with AD salary should be >10000
1.2 OR jon is as IT and salary <= 6000
2.1 Department name should be 'Purchasing', 'IT', 'Executive'
2.2 COMMISSION_PCT SHOULD BE 0
3.1 hire date should be after 1-JAN-2000

SELECT * 
FROM EMPLOYEES
WHERE (
(JOB_ID LIKE 'AD%' AND SALARY > 10000)
OR (JOB_ID LIKE 'IT%' AND SALARY <= 10000)
)
OR (
DEPARTMENT_ID IN (90, 60, 30)
AND COMMISSION_PCT = 0
)
AND HIRE_DATE > TO_DATE('1-JAN-2000', 'dd-MON-yyyy');
