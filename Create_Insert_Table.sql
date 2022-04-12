

CREATE TABLE Student (
  std_id int NOT NULL PRIMARY KEY,
  std_name nvarchar(100),
  std_clg nvarchar(100),
);



CREATE TABLE Departments (
    dept_ID int NOT NULL PRIMARY KEY,
    comp_dept nvarchar(50),
	civil_dept nvarchar(50),
	IT_dept nvarchar(50),
    std_id int FOREIGN KEY REFERENCES Student(std_id)
);


CREATE TABLE Marks (
    Roll_ID int NOT NULL PRIMARY KEY,
    Total_marks int,
	Percentagee decimal(10,2),
    std_id int FOREIGN KEY REFERENCES Student(std_id)
);





INSERT INTO Student (std_id,std_name,std_clg) 
VALUES (1,'Purva','DYP');

INSERT INTO Student (std_id,std_name,std_clg) 
VALUES (2,'Harshita','DYPIEMR');

INSERT INTO Student (std_id,std_name,std_clg) 
VALUES (3,'Sakshi','DYPCOE');

INSERT INTO Student (std_id,std_name,std_clg) 
VALUES (4,'Simran','DYPA');



INSERT INTO Departments(dept_ID,comp_dept,civil_dept,IT_dept,std_id) 
VALUES (1,'yes','no','no',1);

INSERT INTO Departments(dept_ID,comp_dept,civil_dept,IT_dept,std_id) 
VALUES (2,'no','yes','no',2);

INSERT INTO Departments(dept_ID,comp_dept,civil_dept,IT_dept,std_id) 
VALUES (3,'yes','no','no',3);

INSERT INTO Departments(dept_ID,comp_dept,civil_dept,IT_dept,std_id) 
VALUES (4,'no','no','yes',4);





INSERT INTO Marks(Roll_ID,Total_marks,Percentagee,std_id) 
VALUES (1,489,95,1);

INSERT INTO Marks(Roll_ID,Total_marks,Percentagee,std_id) 
VALUES (2,475,85,2);

INSERT INTO Marks(Roll_ID,Total_marks,Percentagee,std_id) 
VALUES (3,460,90,3);

INSERT INTO Marks(Roll_ID,Total_marks,Percentagee,std_id) 
VALUES (4,489,75,4);


CREATE VIEW Topper AS
SELECT std_id,Roll_ID
FROM Marks WHERE Percentagee > 93 ;
Select * from Topper;

CREATE VIEW Comp_dept AS
SELECT std_id from Departments Where comp_dept = 'yes';
Select * from Comp_dept;


SELECT * from Student where std_id=1;


Create VIEW ALL_PERCENT AS
SELECT Percentagee from Marks
where Percentagee < 80;
select * from ALL_PERCENT;


CREATE VIEW TOTAL_STUDENT AS
SELECT std_clg,std_name from Student
where std_clg = 'dypa';

select * from TOTAL_STUDENT;


DELETE FROM Departments where dept_ID=4;

Select * from Departments;

Select std_name from Departments,Student where Departments.dept_ID = Student.std_id;



CREATE VIEW BELONGS_TO_DEPARTMENT AS
SELECT std_name FROM Departments,Student 
where Student.std_id=Departments.dept_ID;

select * from BELONGS_TO_DEPARTMENT;


SELECT  std_name from Student join Departments;

SELECT Student.std_name 
FROM Student
INNER JOIN Departments ON Student.std_id=Departments.std_id;



INSERT INTO Departments(dept_ID,comp_dept,civil_dept,IT_dept,std_id) 
VALUES (4,'no','no','yes',4);



SELECT Student.std_name , Marks.Roll_ID ,Departments.comp_dept
FROM ((Student
INNER JOIN Departments ON Student.std_id=Departments.std_id)
INNER JOIN Marks ON Student.std_id=Marks.std_id);


SELECT Student.std_name,Departments.comp_dept 
FROM Student 
LEFT JOIN Departments ON Student.std_id=Departments.std_id;


INSERT INTO Student (std_id,std_name,std_clg) 
VALUES (5,'Avhad','DYPP');

SELECT * FROM Student;


SELECT Student.std_name,Departments.comp_dept 
FROM Student 
RIGHT JOIN Departments ON Student.std_id=Departments.std_id;


ALTER TABLE Student
ADD Gender varchar(255);


select * from Student;



select * from Student
SELECT Roll_ID, Total_marks ,
RANK() OVER ( ORDER BY Total_marks DESC ) 'Rank' 
From Marks 

SELECT Student.std_name, Marks.Roll_ID, Marks.Total_marks ,
RANK() OVER ( ORDER BY Total_marks DESC ) 'Rank' 
From Student,Marks




CREATE VIEW Topper_OF_Comp_Deptt AS
SELECT Student.std_id,Marks.Percentagee FROM Student,Departments,Marks 
where   Marks.Percentagee > 93 AND Departments.comp_dept='yes';

select * from  Topper_OF_Comp_Deptt;



SELECT Marks.Percentagee,Departments.dept_ID
FROM Marks
LEFT JOIN Departments ON (Departments.comp_dept='yes'  AND Percentagee > 93);









CREATE PROCEDURE SelectAllStudents
AS
SELECT * FROM  Student
GO;
EXEC SelectAllStudents;

CREATE PROCEDURE SelectAllDepartments
AS
SELECT * FROM  Departments
GO;
EXEC SelectAllDepartments;

CREATE PROCEDURE SelectAllMarks
AS
SELECT * FROM  Marks
GO;
Exec SelectAllMarks;

CREATE Procedure SelectDepartment @clg nvarchar(50)
AS
 SELECT * FROM Student WHERE std_clg = @clg
Exec SelectDepartment @clg='dypcoe';





CREATE Procedure Highest_marks 
AS 
SELECT std_id from Marks Where Percentagee > 80;
exec Highest_marks;


CREATE Procedure Second_Highest_marks 
AS 
SELECT std_id from Marks Where Percentagee > 80;
exec Second_Highest_marks;

CREATE Procedure least_percentage
AS 
SELECT std_id from Marks Where Percentagee < 80;
exec least_percentage;






SELECT Student.std_name,Departments.dept_ID FROM Student
LEFT JOIN Departments On Departments.std_id=Student.std_id Where Departments.IT_dept='yes';

SELECT Student.std_name,Departments.dept_ID FROM Student
LEFT JOIN Departments On Departments.std_id=Student.std_id 
LEFT JOIN Marks On Marks.std_id=Student.std_id
Where Departments.comp_dept='yes' AND Marks.Percentagee > 80;


CREATE Procedure Select_StudentID @clg nvarchar(50)
AS
 SELECT std_name  FROM Student WHERE std_clg = @clg

Exec Select_StudentID @clg='dyp';


drop Procedure Select_StudentID;


Select * from Marks;

DECLARE @COUNTER INT=1;

Declare @subtract INT=5;

SET @COUNTER =( SELECT COUNT(*) FROM Student)


While @COUNTER > 0
BEGIN
  
  UPDATE Marks SET Total_marks=Total_marks+@subtract;
  SET @COUNTER=@COUNTER-1;


END




SELECT * FROM Marks;





CREATE TRIGGER marksUpdate
on Marks
after insert
as
begin
	
	Declare @subtract INT=5;
 
     UPDATE Marks SET Total_marks=Total_marks+@subtract;
    
end
go

drop trigger marksUpdate;

INSERT INTO Marks(Roll_ID,Total_marks,Percentagee,std_id) 
VALUES (6,399,79,5);

select * from Marks;



CREATE TRIGGER PercentUpdate
on Marks 
after insert
as
begin
     UPDATE Marks SET Percentagee=Percentagee + 2;
    
end
go

select * from Marks;
SELECT * FROM Student;
INSERT INTO Student (std_id,std_name,std_clg,Gender) 
VALUES (6,'Sujal','SVS','MALE');
INSERT INTO Marks(Roll_ID,Total_marks,Percentagee,std_id) 
VALUES (5,429,96,5);



CREATE TRIGGER UPADTE_ID
on DEPARTMENTS
AFTER DELETE
as
begin
     UPDATE Departments SET dept_ID=dept_ID-1;
end
GO

SELECT * FROM Departments;
DELETE FROM Departments WHERE dept_ID=4;
SELECT * FROM Departments;



SELECT Student.std_name,Departments.dept_ID, ROW_NUMBER() OVER (ORDER BY Student.std_name DESC) FROM Student
LEFT JOIN Departments On Departments.std_id=Student.std_id 
LEFT JOIN Marks On Marks.std_id=Student.std_id
Where Departments.comp_dept='yes' AND Marks.Percentagee > 80;



SELECT * , ROW_NUMBER() OVER (ORDER BY GENDER ) AS NUMBERING FROM Student;


SELECT Student.std_name,Student.std_clg,Departments.dept_ID,ROW_NUMBER() OVER (ORDER BY STD_CLG DESC) from Student,Departments where Student.std_id=Departments.dept_ID;
