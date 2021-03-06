
-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT E.EMP_NO, LAST_NAME, FIRST_NAME, SEX, SALARY 
  FROM EMPLOYEES E, SALARIES S
 WHERE E.EMP_NO = S.EMP_NO;  --300024 ROWS
--another way to do the same thing:
SELECT E.EMP_NO, LAST_NAME, FIRST_NAME, SEX, SALARY 
  FROM EMPLOYEES E
  INNER JOIN SALARIES S ON E.EMP_NO = S.EMP_NO;  --300024 ROWS
 
-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE 
  FROM EMPLOYEES E
 WHERE HIRE_DATE >= '1986-01-01'
   AND HIRE_DATE <= '1986-12-31';

-- List the manager of each department with the following information:
--department number, department name, the manager's employee number, last name, first name.
SELECT DM.DEPT_NO,D.DEPT_NAME, DM.EMP_NO, E.LAST_NAME, E.FIRST_NAME 
  FROM DEPT_MGR DM, EMPLOYEES E, DEPTS D
 WHERE DM.EMP_NO = E.EMP_NO
   AND D.DEPT_NO = DM.DEPT_NO;

-- List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT DM.DEPT_NO, DM.EMP_NO, E.LAST_NAME, E.FIRST_NAME, D.DEPT_NAME
  FROM DEPT_EMP DM, EMPLOYEES E, DEPTS D
 WHERE DM.EMP_NO = E.EMP_NO
   AND D.DEPT_NO = DM.DEPT_NO;

-- List first name, last name, and sex for employees 
--whose first name is "Hercules" and last names begin with "B."
SELECT FIRST_NAME, LAST_NAME, SEX
  FROM EMPLOYEES
 WHERE FIRST_NAME = 'Hercules'
   AND LAST_NAME LIKE 'B%';

-- List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
SELECT DM.EMP_NO, E.LAST_NAME, E.FIRST_NAME, D.DEPT_NAME
  FROM DEPT_EMP DM, EMPLOYEES E, DEPTS D
 WHERE DM.EMP_NO = E.EMP_NO
   AND D.DEPT_NO = DM.DEPT_NO
   and D.DEPT_NAME = 'Sales'; --52245 rows
--another way to get the same thing:
SELECT DM.EMP_NO, E.LAST_NAME, E.FIRST_NAME, sales.DEPT_NAME
  FROM DEPT_EMP DM, EMPLOYEES E, (SELECT DEPT_NO, DEPT_NAME FROM DEPTS WHERE DEPT_NAME='Sales') sales
 WHERE DM.EMP_NO = E.EMP_NO
   AND sales.DEPT_NO = DM.DEPT_NO;
   
-- List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT DM.EMP_NO, E.LAST_NAME, E.FIRST_NAME, D.DEPT_NAME
  FROM DEPT_EMP DM, EMPLOYEES E, DEPTS D
 WHERE DM.EMP_NO = E.EMP_NO
   AND D.DEPT_NO = DM.DEPT_NO
   and D.DEPT_NAME IN ('Sales','Development'); 


-- In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
SELECT LAST_NAME, COUNT(*) COUNT 
  FROM EMPLOYEES
 GROUP BY LAST_NAME
 ORDER BY COUNT DESC;