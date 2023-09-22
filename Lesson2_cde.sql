--c
CREATE VIEW ET_Passed_Trainees AS
SELECT *
FROM Trainee
WHERE ET_IQ + ET_Gmath >= 20
  AND ET_IQ >= 8
  AND ET_Gmath >= 8
  AND ET_English >= 18


--d

USE Test
SELECT * FROM ET_Passed_Trainees;

SELECT MONTH(Birth_Date) AS Birth_Month, COUNT(*) AS Passed_Trainees_Count
FROM Trainee
WHERE TraineeID IN (SELECT TraineeID FROM ET_Passed_Trainees)
GROUP BY MONTH(Birth_Date)

--e

USE Test
SELECT TOP 1
  DATEDIFF(YEAR, Birth_Date, GETDATE()) AS Age,
  Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes
FROM Trainee
ORDER BY LEN(Full_Name) DESC