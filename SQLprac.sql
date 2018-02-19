--display name of students by sorting last 3 characters
--if 3 characters are same then sort by their ID's
select name from students where marks>75 order by right(name,3),id 

--to replace all NULL values with 0
select isnull(marks,0) from student

--checking for type of triangle
select case
          when A+B>C and B+C>A and A+C>B then 
          case
          when A=B and B=C then 'Equilateral'
          when A=B or B=C or A=C then 'Isosceles'
          when A!=B and B!=C and A!=C then 'Scalene'
          end
          else 'Not A Triangle'
       end
from triangles     

--to assign sequence numbers
select ROW_NUMBER() over(order by firstname) as Seq,FirstName,LastName from Person.Person 
where FirstName like '%ss%';

--to assign rank according to marks
select *,(select count(*) from student si where si.marks>=so.marks) as ranking from student so
