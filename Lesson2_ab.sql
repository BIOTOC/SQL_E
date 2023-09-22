
-- a:

CREATE TABLE Trainee (
  TraineeID INT IDENTITY(1,1) PRIMARY KEY,
  Full_Name VARCHAR(100) NOT NULL,
  Birth_Date DATE NOT NULL,
  Gender VARCHAR(10) NOT NULL,
  ET_IQ INT NOT NULL CHECK (ET_IQ >= 0 AND ET_IQ <= 20),
  ET_Gmath INT NOT NULL CHECK (ET_Gmath >= 0 AND ET_Gmath <= 20),
  ET_English INT NOT NULL CHECK (ET_English >= 0 AND ET_English <= 50),
  Training_Class VARCHAR(10),
  Evaluation_Notes TEXT
);

INSERT INTO Trainee (Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes)
VALUES
  ('Nguyen Van A', '2002-01-04', 'male', 15, 16, 40, 'ClassA', 'Good'),
  ('Dinh Thu B', '2002-02-23', 'female', 12, 11, 20, 'ClassA', 'Needs improvement'),
  ('Dao Anh C', '2001-02-02', 'male', 13, 20, 45, 'ClassA', 'Great'),
  ('Nguyen Thai D', '2002-04-12', 'male', 15, 16, 42, 'ClassA', 'Great'),
  ('Nguyen Anh E', '2003-06-14', 'male', 17, 18, 48, 'ClassA', 'Great'),
  ('Pham Ngoc F', '2002-06-12', 'female', 14, 16, 35, 'ClassB', 'Good'),
  ('Nguyen Thanh G', '2002-02-11', 'female', 15, 14, 35, 'ClassB', 'Good'),
  ('Pham Quynh H', '2003-10-26', 'female', 17, 18, 40, 'ClassB', 'Great'),
  ('Cao Duc I', '2002-04-17', 'male', 18, 19, 45, 'ClassB', 'Great'),
  ('Vu Dinh K', '2002-09-12', 'male', 15, 16, 40, 'ClassB', 'Good')
  ;

--b:

ALTER TABLE Trainee
ADD Fsoft_Account VARCHAR(255);

--c:

CREATE VIEW ET_Passed_Trainees AS
SELECT *
FROM Trainee
WHERE ET_IQ + ET_Gmath >= 20
  AND ET_IQ >= 8
  AND ET_Gmath >= 8
  AND ET_English >= 18


--d:

SELECT * FROM ET_Passed_Trainees;

SELECT MONTH(Birth_Date) AS Birth_Month, COUNT(*) AS Passed_Trainees_Count
FROM Trainee
WHERE TraineeID IN (SELECT TraineeID FROM ET_Passed_Trainees)
GROUP BY MONTH(Birth_Date)

