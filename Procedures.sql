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


CREATE Procedure SelectCollege @clg nvarchar(50)
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


CREATE Procedure Select_StudentID @clg nvarchar(50)
AS
 SELECT std_name  FROM Student WHERE std_clg = @clg

Exec Select_StudentID @clg='dyp';


drop Procedure Select_StudentID;



DECLARE @COUNTER INT=1;
Declare @subtract INT=5;
SET @COUNTER =( SELECT COUNT(*) FROM Student)
While @COUNTER > 0
BEGIN
  UPDATE Marks SET Total_marks=Total_marks+@subtract;
  SET @COUNTER=@COUNTER-1;
END

SELECT * FROM Marks;