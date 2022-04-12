
SELECT * , ROW_NUMBER() OVER (ORDER BY GENDER ) AS NUMBERING FROM Student;


SELECT Student.std_name,Student.std_clg,Departments.dept_ID,
ROW_NUMBER() OVER (ORDER BY STD_CLG DESC) 
from Student,Departments 
where Student.std_id=Departments.dept_ID;




SELECT Student.std_name,Departments.dept_ID, ROW_NUMBER() OVER (ORDER BY Student.std_name DESC) FROM Student
LEFT JOIN Departments On Departments.std_id=Student.std_id 
LEFT JOIN Marks On Marks.std_id=Student.std_id
Where Departments.comp_dept='yes' AND Marks.Percentagee > 80;