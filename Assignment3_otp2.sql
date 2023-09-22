
INSERT INTO Skill (SkillName, Note)
VALUES
('Java', NULL),
('Python', NULL),
('Ruby', NULL),
('Front-end', NULL),
('PHP', NULL),
('SQL', NULL),
('C++', NULL),
('.NET', NULL);


INSERT INTO Department (DeptName, Note)
VALUES
('HR', NULL),
('IT', NULL),
('Finance', NULL),
('Marketing', NULL),
('Operations', NULL),
('Product Development', NULL),
('Customer Service', NULL),
('Sales', NULL);INSERT INTO Employee (EmpNo, EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, Status, Note, Level, Email)
VALUES
(1, 'Nguyen Van A', '2001-01-15', 1, '2', '2022-01-01', 60000, 1, NULL, 3, 'ANV@fsoft.com.vn'),
(2, 'Nguyen Ngoc B', '2001-03-20', 1, '8', '2022-02-15', 55000, 1, NULL, 2, 'BNN@fsoft.com.vn'),
(3, 'Vu Dinh C', '2002-05-11', 2, '5', '2023-08-15', 45000, 1, NULL, 2, 'CVD@fsoft.com.vn'),
(4, 'Quang Thi D', '1999-01-01', 2, '5', '2020-02-15', 65000, 1, NULL, 3, 'DQT@fsoft.com.vn'),
(5, 'Nguyen Thai E', '1997-07-25', 5, '8', '2019-02-15', 90000, 1, NULL, 2, 'ENT@fsoft.com.vn'),
(6, 'Nguyen Thanh F', '1985-06-24', 6, '2', '2017-02-15', 85000, 1, NULL, 4, 'FNT@fsoft.com.vn'),
(7, 'Ho Phuong G', '2000-10-27', 7, '2', '2021-09-15', 75000, 1, NULL, 2, 'GHP@fsoft.com.vn'),
(8, 'Dinh Thu H', '1990-08-08', 8, '0', '2023-08-01', 95000, 1, NULL, 4,'HDT@fsoft.com.vn');


INSERT INTO Emp_Skill(SkillNo, EmpNo, SkillLevel, RegDate, Description)
VALUES
(1,1,3,'2019-01-01', ''),
(2,2,3,'2019-01-01', ''),
(3,3,3,'2018-01-01', ''),
(4,4,3,'2017-01-01', ''),
(5,5,3,'2016-01-01', ''),
(6,6,3,'2014-01-01', ''),
(7,7,3,'2017-01-01', ''),
(8,8,3,'2014-01-01', '');

--
SELECT E.EmpName, E.Email, D.DeptName
FROM Employee E
JOIN Department D ON E.DeptNo = D.DeptNo
WHERE E.StartDate <= DATEADD(MONTH, -6, GETDATE());

GO

--
SELECT E.EmpName
FROM Employee E
JOIN Emp_Skill ES ON E.EmpNo = ES.EmpNo
JOIN Skill S ON ES.SkillNo = S.SkillNo
WHERE S.SkillName IN ('C++', '.NET');

GO

--
SELECT E.EmpName, E.Email AS EmpEmail, M.EmpName AS ManagerName, M.Email AS ManagerEmail
FROM Employee E
JOIN Employee M ON E.MgrNo = M.EmpNo;

GO
--
SELECT D.DeptName
FROM Department D
JOIN Employee E ON D.DeptNo = E.DeptNo
GROUP BY D.DeptName
HAVING COUNT(*) >= 2;

SELECT D.DeptName, E.EmpName
FROM Department D
JOIN Employee E ON D.DeptNo = E.DeptNo;

GO
--
SELECT E.EmpName, E.Email, ES.SkillNo
FROM Employee E
JOIN Emp_Skill ES ON E.EmpNo = ES.EmpNo
ORDER BY E.EmpName ASC;

--

GO
CREATE VIEW vw_EmployeeSkills AS
SELECT E.EmpName, S.SkillName, D.DeptName
FROM Employee E
JOIN Emp_Skill ES ON E.EmpNo = ES.EmpNo
JOIN Skill S ON ES.SkillNo = S.SkillNo
JOIN Department D ON E.DeptNo = D.DeptNo
WHERE E.Status = 1;

GO
SELECT * FROM vw_EmployeeSkills;

