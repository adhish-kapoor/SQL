--display name of students by sorting last 3 characters
--if 3 characters are same then sort by their ID's
select name from students where marks>75 order by right(name,3),id 

--to replace all NULL values with 0
select isnull(marks,0) from student
