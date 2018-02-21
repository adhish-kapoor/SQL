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

--PIVOT is used to convert row data into columns
SELECT * --VendorID, [250] AS Emp1, [251] AS Emp2, [256] AS Emp3, [257] AS Emp4, [260] AS Emp5
FROM 
(SELECT PurchaseOrderID, EmployeeID, VendorID
FROM Purchasing.PurchaseOrderHeader) p
PIVOT
(
COUNT (PurchaseOrderID) --function(<data column>)
FOR EmployeeID IN
( [250], [251], [256], [257], [260] ) --list of pivoted columns
) AS pvt
ORDER BY pvt.VendorID;

--Use of OFFSET to fetch next rows
Select name,age from student order by name
OFFSET 20 --will start from 21
FETCH next 10 rows only; --end at 30

--last day of the month in yyyy-mm-dd format
select EOMONTH(GETDATE());
--Searching string inside another
select CHARINDEX('Adhish','My name is adhish') --returns 12 position of 'a'
select CHARINDEX('Adi','My name is adhish') --returns 0 as Adi is not found
