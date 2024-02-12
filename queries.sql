--1. Вывести сотрудника с максимальной заработной платой--
SELECT NAME, SALARY
FROM EMPLOYEE
WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEE);
--2. Вывести одно число: максимальную длину цепочки руководителей по таблице сотрудников (вычислить глубину дерева)--
WITH RECURSIVE DepartmentChain AS (
    SELECT ID, DEPARTMENT_ID_ID, 1 AS ChainLength
    FROM EMPLOYEE
    WHERE DEPARTMENT_ID_ID IS NULL

    UNION ALL

    SELECT e.ID, e.DEPARTMENT_ID_ID, dc.ChainLength + 1
    FROM EMPLOYEE e
    JOIN DepartmentChain dc ON e.Department_ID = dc.ID
)
SELECT MAX(ChainLength) AS MaxChainLength
FROM DepartmentChain;
--3.Вывести отдел, с максимальной суммарной зарплатой сотрудников--
SELECT DEPARTMENT_ID, SUM(SALARY) AS TotalSalary
FROM EMPLOYEE
GROUP BY DEPARTMENT_ID
ORDER BY TotalSalary DESC
LIMIT 1;
--4.Вывести сотрудника, чье имя начинается на "Р" и заканчивается на "н"--
SELECT *
FROM EMPLOYEE
WHERE Name LIKE 'Р%н';