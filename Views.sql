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


CREATE VIEW BELONGS_TO_DEPARTMENT AS
SELECT std_name FROM Departments,Student 
where Student.std_id=Departments.dept_ID;

select * from BELONGS_TO_DEPARTMENT;