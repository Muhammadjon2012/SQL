Easy-Level Tasks (10)

1.Define and explain the purpose of BULK INSERT in SQL Server.
  answer:BULK INSERT in SQL Server is a command used to  import large amounts of data from a file (like CSV or TXT) into a database table.To save time and effort when loading big datasets into SQL Server.
2.List four file formats that can be imported into SQL Server.
  answer:CSV-TXT-XML-JSON-Excel 
3.Create a table Products with columns: ProductID (INT, PRIMARY KEY), ProductName (VARCHAR(50)), Price (DECIMAL(10,2)).
  answer:create table Products (ProductID int primary key, ProductName varchar(50), Price decimal(10,2))
4.Insert three records into the Products table using INSERT INTO.
  answer:insert into Products values (1, 'smartphone', 400.99), (2, 'laptop', 680.18), (3, 'projector', 250.00)
5. Explain the difference between NULL and NOT NULL with examples.
  answer:NULL means no value (empty), or unknowkn things maybe or not identified to user.NOT NULL means the column must have a value. 
  Examples in sql: CREATE TABLE Students (ID int,Name varchar(50) NULL);CREATE TABLE Courses (CourseID int, CourseName varchar(50) NOT NULL);
  in general NULL - optional; but NOT NULL - required
6.Add a UNIQUE constraint to the ProductName column in the Products table.
  answer:alter table Products
         add constraint UQ_ProductName unique (ProductName)
7.Write a comment in a SQL query explaining its purpose.
  answer:-- This ensures no two products have the same name--
8.Create a table Categories with a CategoryID as PRIMARY KEY and a CategoryName as UNIQUE.
  answer: create table Categories (CategoryID int primary key, CategoryName varchar(50) unique)
9.Explain the purpose of the IDENTITY column in SQL Server.
  answer:The IDENTITY column in SQL Server automatically generates unique, sequential numbers for each row. It's mainly used for primary keys.
         Example: createtable Employees(ID int, identity primary key, Name varchar(100))

Medium-Level Tasks (10)


10. Use BULK INSERT to import data from a text file into the Products table.
    answer: 1. create text file and insert there data 2. must know location of text file like C:\aa\bb\123.txt 3. then in SQL we use command bulk insert Products from FROM 'C:\aa\bb\123.txt'
with (fieldterminator = ',',rowterminator = '\n', firstrow = 2);
11.Create a FOREIGN KEY in the Products table that references the Categories table.
    answer: alter table Products
            add CategoryID int
            alter table Products
            add constraint FK_ProductswithCategories foreign key(CategoryID) references Categories(CategoryID)
12.Explain the differences between PRIMARY KEY and UNIQUE KEY with examples.
    answer: primary key - Uniquely identifies each row in a table, cannot contain NULL values,each table can have only one primary key.
            example: create table Employees (EmployeeID int primary key,Name varchar(50));
            unique key - ensures all values in a column are unique, can contain NULL values,table can have multiple unique keys. 
            exapmle: create table Employees (EmployeeID int primary key, Name(50) unique, origin varchar(100));
13.Add a CHECK constraint to the Products table ensuring Price > 0.
    answer:alter table Products
           add constraint CHK_Price check (Price>0)
14.Modify the Products table to add a column Stock (INT, NOT NULL).
    answer:alter table Products
add Stock int not null 
15.Use the ISNULL function to replace NULL values in a column with a default value.
    answer:alter table Products
add Stock int not null default 0
16.Describe the purpose and usage of FOREIGN KEY constraints in SQL Server.
    answer:foreign key constraint in SQL Server is used to link two tables together by ensuring that a column in one table matches a valid value in another table. It helps maintain data integrity by preventing invalid data in the child table.
           Purpose:Enforces relationships between tables.

    Hard-Level Tasks (10)

17. Write a script to create a Customers table with a CHECK constraint ensuring Age >= 18.
    answer:
18.Create a table with an IDENTITY column starting at 100 and incrementing by 10.
    answer: create table Customers (ID int primary key, Name varchar(50),age int, check (age>=18))
19.Write a query to create a composite PRIMARY KEY in a new table OrderDetails.
    answer: create table OrderDetails (OrderID int, ProductID int, QuantityID int, primary key (OrderID, ProductID))
20.Explain with examples the use of COALESCE and ISNULL functions for handling NULL values.
    answer: Both are SQL functions used to handle NULL values by replacing them with a specified default value. ISNULL Function checks if a value is NULL. If it is, it returns the replacement value; otherwise, it returns the original value.
 COALESCE Functionreturns the first non-NULL value in a list of expressions. It can handle multiple expressions, unlike ISNULL, which only handles two.
21.Create a table Employees with both PRIMARY KEY on EmpID and UNIQUE KEY on Email.
    answer:create table Employees (ID int primary key, Name varchar(50), Homeadress varchar(100), Salary decimal(10,2), Email varchar (30) unique)
22.Write a query to create a FOREIGN KEY with ON DELETE CASCADE and ON UPDATE CASCADE options.
    answer:foregin key (CustomerID) references Customers(CustomerID) on delete cascade ON UPDATE CASCADE

