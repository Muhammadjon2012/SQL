Basic-Level Tasks (10)
1. Create a table Employees with columns: EmpID INT, Name (VARCHAR(50)), and Salary (DECIMAL(10,2)).
  answer: create table Employees (EmpID int, name Varchar(50), Salary decimal (10,2))
2. Insert three records into the Employees table using different INSERT INTO approaches (single-row insert and multiple-row insert).
  anwer: Single-row INSERT - insert into Employees values (1, 'Alisher' , 3200150.125)
         multiple-row insert - insert into Employees (EmpID, name, Salary)
                                values
                                                          (2, 'Bakhodir', 4000050.75),
                                                          (3, 'Nargiza', 51200005.00);
3. Update the Salary of an employee where EmpID = 1.
answer: update Employees 
	             set Salary = 500000
            	where EmpId=1
4. Delete a record from the Employees table where EmpID = 2.
answer: delete from Employees 
         where EmpID =2 
5. Demonstrate the difference between DELETE, TRUNCATE, and DROP commands on a test table.
asnwer:  Delete – Remove some or all rows from a table (DELETE FROM X WHERE ID = 1;) Removes specific rows,you can undo it,the table is still there after the command)
truncate - Remove all rows quickly (TRUNCATE TABLE X ) Deletes all rows,very fast,you can’t undo it,the table stays, but it becomes empty
Drop-Remove the entire table (DROP TABLE X) Deletes everything — all rows and the table itself,you can’t undo it,gone forever
6. Modify the Name column in the Employees table to VARCHAR(100).
  answer: alter table Employees 
          alter column name varchar(100) 
7. Add a new column Department (VARCHAR(50)) to the Employees table.
  answer: alter table Employees
          add Depatments varchar(50); 
8. Change the data type of the Salary column to FLOAT.
  answer: alter table Employees
          alter column Salary float  
9. Create another table Departments with columns DepartmentID (INT, PRIMARY KEY) and DepartmentName (VARCHAR(50)).
  asnwer: Create table Departements (DepartmentId int, Departmentname varchar(50))
10.Remove all records from the Employees table without deleting its structure.
  anwer: truncate table Employees 
Intermediate-Level Tasks (6)
11. Insert five records into the Departments table using INSERT INTO SELECT from an existing table.
  anwer: first I created table with named oldDepartements, then inserted values into it - Create table oldDepartements (DepartmentId int, Departmentname varchar(50))
insert into oldDepartements values (1, 'Financial'), (2, 'HR'), (3, 'Production'), (4, 'Account'), (5, 'Operating')
THEN gave command insert into Departements select * from oldDepartements
12. Update the Department of all employees where Salary > 5000 to 'Management'.
  answer: first I created column Salary (alter table Departements add Salary float) then inserted salaries 
  (Update Departements set Salary = 3500 where DepartmentId=1
Update Departements set Salary = 5000 where DepartmentId=2
Update Departements set Salary = 4000 where DepartmentId=3
Update Departements set Salary = 2600 where DepartmentId=4
Update Departements set Salary = 9000 where DepartmentId=5)
then insert into Departements values (6, 'Management', 12000) cause task links to 'Management'/ then answer to question is update Departements set Departmentname = 'Management' where Salary > 5000
13. Write a query that removes all employees but keeps the table structure intact.
  answer truncate table Employees 
14. Drop the Department column from the Employees table.
  alter table Employees
drop column Depatments 
15. Rename the Employees table to StaffMembers using SQL commands.
  answer: exec sp_rename 'Employees', 'StaffMembers'
16. Write a query to completely remove the Departments table from the database.
  answer: DROP TABLE Departements;
  Advanced-Level Tasks (9)
17. Create a table named Products with at least 5 columns, including: ProductID (Primary Key), ProductName (VARCHAR), Category (VARCHAR), Price (DECIMAL)
answer: create table Products (ProductID int, ProductName varchar(100), Category varchar(75), Price decimal, Producedin varchar (50))
18. Add a CHECK constraint to ensure Price is always greater than 0.
answer: alter table Products
add constraint greatzero check (Price>0)
19. Modify the table to add a StockQuantity column with a DEFAULT value of 50
answer: alter table Products
add StockQuantity int default 50
20. Rename Category to ProductCategory
answer: exec sp_rename 'Products.Category', 'ProductCategory', 'COLUMN'
21. Insert 5 records into the Products table using standard INSERT INTO queries
answer: insert into Products values (1, 'Hot dog', 'food', 25,'USA',70) 
insert into Products values (2, 'Banana', 'fruit', 15,'Inida',30)
insert into Products values (3, 'Cofee', 'drinks', 30,'Brazil',100)
insert into Products values (4, 'Pizza', 'fast food', 45,'Italy',10)
insert into Products values (5, 'Tomato', 'vegetable', 10,'Russia',120)
22. Use SELECT INTO to create a backup table called Products_Backup containing all Products data.
    answer: select * into Products_Backup from Products
23. Rename the Products table to Inventory
answer exec sp_rename 'Products', 'Inventory'
24. Alter the Inventory table to change the data type of Price from DECIMAL(10,2) to FLOAT.
    answer: alter table Inventory
alter column Price float 
25. Add an IDENTITY column named ProductCode that starts from 1000 and increments by 5.
answer: alter table Inventory add ProductCode int identity(1000,5)
