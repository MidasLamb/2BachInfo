# Exercise 6.16 a
SELECT FName, LName 
FROM employee AS E INNER JOIN works_on AS W ON E.Ssn = W.ESsn
	INNER JOIN project AS P ON W.PNo = P.PNumber 
WHERE P.PName = 'ProductX' AND W.Hours >= 10 AND E.DNo = 5;

# Exercise 6.16 b
SELECT FName, LName
FROM employee AS E INNER JOIN dependent AS D ON Ssn = ESsn
WHERE E.FName = D.Dependent_Name;


# Exercise 3.11 a
-- OK
INSERT INTO employee VALUES ('Robert', 'F', 'Scott', '943775543', '1972-06-21', '2365 Newcastle Rd, Bellaire, TX', 'M', 58000, '888665555', 1);

# Exercise 3.11 b
-- no department with DNum 2 ERROR
INSERT INTO project VALUES ('ProductA', 4, 'Bellaire', 2);

# Exercise 3.11 c
-- Duplicate entry '4' for key 'PRIMARY'
INSERT INTO department VALUES ('Production', 4, '943775543', '2007-10-01');

# Exercise 3.11 d
-- Column 'PNo' cannot be null
INSERT INTO works_on VALUES ('677678989', NULL, '40.0');

# Exercise 3.11 e
-- OK
INSERT INTO dependent VALUES ('453453453', 'John', 'M', '1990-12-12', 'spouse');

# Exercise 3.11 f
-- 4 rijen verwijderd.
DELETE FROM works_on WHERE ESsn = '333445555';

# Exercise 3.11 g
-- Cannot delete or update a parent row: a foreign key constraint fails (`company`.`employee`, CONSTRAINT `employee_superssn` FOREIGN KEY (`SuperSsn`) REFERENCES `employee` (`Ssn`))
DELETE FROM employee WHERE Ssn = '987654321';

# Exercise 3.11 h
-- Cannot delete or update a parent row: a foreign key constraint fails (`company`.`works_on`, CONSTRAINT `works_on_pno` FOREIGN KEY (`PNo`) REFERENCES `project` (`PNumber`))
DELETE FROM project WHERE PName = 'ProductX';

# Exercise 3.11 i
-- 1 rij bijgewerkt
UPDATE department SET MgrSsn = '123456789', MgrStartDate = '2007-10-01' WHERE DNumber = 5;

# Exercise 3.11 j
-- 1 rij bijgewerkt.
UPDATE employee SET SuperSsn = '943775543' WHERE Ssn = '999887777';

# Exercise 3.11 k
-- 1 rij bijgewerkt.
UPDATE works_on SET Hours = '5.0' WHERE (ESsn = '999887777' AND PNo = 10);

# Exercise 11
SELECT FName, LName, sum(works_on.Hours) AS TotalHours FROM employee, works_on WHERE Ssn = ESsn GROUP BY Ssn