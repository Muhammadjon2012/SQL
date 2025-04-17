Easy
I. Define the following terms: data, database, relational database, and table. 
Answer: 
1. Data:Facts or information, like numbers, words, or dates.
2. Database:A place to store and organize data.
3. Relational Database:A database where data is stored in tables that are linked to each other.
4. Table:A structure in a database with rows and columns to hold data.
II.List five key features of SQL Server.
Answer: Data Storage and Management,T-SQL (Transact-SQL),Security,Backup and Restore,High Availability.
III. What are the different authentication modes available when connecting to SQL Server?
Answer:Windows Authentication, SQL Server Authentication, Mixed Mode
Medium
I. Create a new database in SSMS named SchoolDB
  Answer:create database SchoolDB
II. Write and execute a query to create a table called Students with columns: StudentID (INT, PRIMARY KEY), Name (VARCHAR(50)), Age (INT). */
Answer:CREATE TABLE Students (StudentID INT PRIMARY KEY,Name VARCHAR(50),Age INT)
III. Describe the differences between SQL Server, SSMS, and SQL.
  Answer: SQL -A language used to talk to databases.SQL Server:A database system made by Microsoft.SSMS (SQL Server Management Studio):A tool to connect to SQL Server.
Hard
I. Research and explain the different SQL commands: DQL, DML, DDL, DCL, TCL with examples.
  Answer:
  DQL – Data Query Language - Used to read data from a database.Example:SELECT * FROM Students;Gets all data from the Students table.
  DML – Data Manipulation Language -  Used to change the data inside tables.Examples:INSERT INTO Students (StudentID, Name, Age) VALUES (1, 'Bob', 20); UPDATE Students SET Age = 21 WHERE StudentID = 1;
  DELETE FROM Students WHERE StudentID = 1;
  DDL – Data Definition Language - Used change the structure of database objects.Examples:CREATE TABLE Students (StudentID INT, Name VARCHAR(50), Age INT); ALTER TABLE Students ADD Gender VARCHAR(10);
  DROP TABLE Students;
  DCL – Data Control Language - Used to control access and permissions.
  TCL – Transaction Control Language - Used to manage transactions.
II. Write a query to insert three records into the Students table.
    Answer: Insert into Students 
VALUES (1, 'Aziz', 25),
       (2, 'Sofia', 30),
       (3, 'Bexruz', 28);
III. Create a backup of your SchoolDB database and restore it. (write its steps to submit)
Answer: to backup  - in the Object Explorer enter Databases - SchoolDB - Select Tasks - Back Up
        to restore - in Databases → Choose Restore Database...

   

  
