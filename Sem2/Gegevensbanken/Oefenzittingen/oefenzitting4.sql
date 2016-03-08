# Oef 1.1 en 1.2, zie oefenzitting 3

# 1.3
-- 3 resultaten
SELECT `FName`,`LName` 
FROM `employee` 
WHERE `SuperSsn` IN 
  (SELECT Ssn 
  FROM `employee` 
  WHERE `FName` = 'Franklin' AND `LName` = 'Wong')
  
# 1.4
-- GROUP BY collapsed op argument, SUM is nodig omdat SQL niet weet wat te doen met de columns die niet in het argument voorkomen.
SELECT W.Pno, SUM(W.Hours)
FROM `works_on` AS W JOIN `project` AS P ON W.Pno = P.Pnumber 
GROUP BY W.Pno

-- 1.5 en 1.6 in omgewisselde volgorde omdat assistent dat zegt.
# 1.6
-- Omweg:
SELECT *
FROM `employee` AS E LEFT JOIN `works_on` AS W ON E.Ssn = W.Essn
WHERE W.ESsn IS NULL

-- Assistent zijn methode:
SELECT `FName`,`LName`
FROM `employee` AS E 
WHERE NOT EXISTS 
	(SELECT W.ESsn
  FROM `works_on` AS W
  WHERE E.Ssn = W.Essn)
  
# 1.5
-- Uitleg?
SELECT `FName`,`LName`
FROM `employee` AS E 
WHERE NOT EXISTS
	(SELECT P.PNumber
     FROM `project` AS P
     WHERE NOT EXISTS 
	   (SELECT W.ESsn
      FROM `works_on` AS W
      WHERE E.Ssn = W.Essn AND W.PNo = P.PNumber))
      
# 1.7
-- 
SELECT D.DName, AVG(E.Salary)
FROM `department` AS D JOIN `employee` AS E ON D.Dnumber = E.Dno
GROUP BY D.Dnumber

# 1.8
SELECT AVG(E.Salary) 
FROM `employee` AS E 
WHERE E.Sex = 'F'

# 2.a
SELECT D.DName AS 'Department Name', COUNT(E.Ssn) AS 'Number of Employees' 
FROM `department` AS D JOIN `employee` AS E ON D.Dnumber = E.Dno 
GROUP BY D.Dnumber 
HAVING AVG(E.Salary) > 30000

# 2.b
-- WHERE is applied voor GROUP BY
SELECT D.DName AS 'Department Name', COUNT(E.Ssn) AS 'Number of Employees' 
FROM `department` AS D JOIN `employee` AS E ON D.Dnumber = E.Dno 
WHERE E.Sex = 'M'
GROUP BY D.Dnumber 

# 3.a
CREATE VIEW dept_managment(Department_name, Manager_name, Manager_salary)
AS SELECT D.Dname, E.Fname, E.Salary
FROM `department` AS D JOIN `employee` AS E ON D.MgrSsn = E.Ssn


