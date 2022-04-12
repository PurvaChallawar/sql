SELECT Roll_ID, Total_marks ,
RANK() OVER ( ORDER BY Total_marks DESC ) 'Rank' 
From Marks 



SELECT Student.std_name, Marks.Roll_ID, Marks.Total_marks ,
RANK() OVER ( ORDER BY Total_marks DESC ) 'Rank' 
From Student,Marks