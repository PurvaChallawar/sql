SELECT Student.std_name 
FROM Student
INNER JOIN Departments ON Student.std_id=Departments.std_id;



SELECT Student.std_name , Marks.Roll_ID ,Departments.comp_dept
FROM ((Student
INNER JOIN Departments ON Student.std_id=Departments.std_id)
INNER JOIN Marks ON Student.std_id=Marks.std_id);


SELECT Student.std_name,Departments.comp_dept 
FROM Student 
LEFT JOIN Departments ON Student.std_id=Departments.std_id;


SELECT Student.std_name,Departments.comp_dept 
FROM Student 
RIGHT JOIN Departments ON Student.std_id=Departments.std_id;

SELECT Student.std_name,Departments.comp_dept 
FROM Student 
FULL JOIN Departments ON Student.std_id=Departments.std_id;


SELECT Student.std_name,Departments.dept_ID FROM Student
LEFT JOIN Departments On Departments.std_id=Student.std_id Where Departments.IT_dept='yes';

SELECT Student.std_name,Departments.dept_ID FROM Student
LEFT JOIN Departments On Departments.std_id=Student.std_id 
LEFT JOIN Marks On Marks.std_id=Student.std_id
Where Departments.comp_dept='yes' AND Marks.Percentagee > 80;
