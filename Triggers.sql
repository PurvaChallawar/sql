
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




