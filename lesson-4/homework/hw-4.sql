Lesson 4: Filtering and Ordering Data

Easy-Level Tasks (10)

1.  Write a query to select the top 5 employees from the Employees table.
  answer:select top 5 *from Employees order by Salary desc;
2. Use SELECT DISTINCT to select unique ProductName values from the Products table.
  answer:select distinct productname from products;
3. Write a query that filters the Products table to show products with Price > 100.
  answer:select *from products where price > 100;
4. Write a query to select all CustomerName values that start with 'A' using the LIKE operator.
  answer:select firstname, lastname from customers where firstname like 'a%';
5. Order the results of a Products query by Price in ascending order.
  answer: select *from products order by price asc;
6. Write a query that uses the WHERE clause to filter for employees with Salary >= 60000 and Department = 'HR'.
  answer:select *from employees where salary >= 60000  and departmentname = 'hr';
7. Use ISNULL to replace NULL values in the Email column with the text "noemail@example.com".From Employees table
  answer: SELECT EmployeeID,FirstName,LastName, DepartmentName, Salary, HireDate, Age, ISNULL(Email, 'noemail@example.com') AS Email, Country FROM Employees;
8. Write a query that shows all products with Price BETWEEN 50 AND 100.
  answer: select *from products where price between 50 and 100;
9. Use SELECT DISTINCT on two columns (Category and ProductName) in the Products table.
  answer: select distinct category, productname from products;
10. After SELECT DISTINCT on two columns (Category and ProductName) Order the results by ProductName in descending order.
  answer: select distinct category, productname from products order by productname desc;


Medium-Level Tasks (10)

11. Write a query to select the top 10 products from the Products table, ordered by Price DESC.
  answer: select top 10 *from products order by price desc
12. Use COALESCE to return the first non-NULL value from FirstName or LastName in the Employees table.
  answer: select EmployeeID, COALESCE(FirstName, LastName) as Name from Employees;
13. Write a query that selects distinct Category and Price from the Products table.
  answer:select distinct category, price from products;
14. Write a query that filters the Employees table to show employees whose Age is either between 30 and 40 or Department = 'Marketing'.
  answer: select * from employees where (age between 30 and 40) or departmentname = 'Marketing';
15. Use OFFSET-FETCH to select rows 11 to 20 from the Employees table, ordered by Salary DESC.
  answer:select *from employees order by salary desc offset 10 rows fetch next 10 rows only;
16. Write a query to display all products with Price <= 1000 and Stock > 50, sorted by Stock in ascending order.
  answer:select *from products where price <= 1000  and stockquantity > 50order by stockquantity asc;
17. Write a query that filters the Products table for ProductName values containing the letter 'e' using LIKE.
  answer:select *from products where productname like '%e%';
18. Use IN operator to filter for employees who work in either 'HR', 'IT', or 'Finance'.
  answer:select *from employees where departmentname in ('HR', 'IT', 'Finance');
19. Use ORDER BY to display a list of customers ordered by City in ascending and PostalCode in descending order.Use customers table
answer:select *from customers order by city asc, postalcode desc;


 Hard-Level Tasks

20. Write a query that selects the top 10 products with the highest sales, using TOP(10) and ordered by SalesAmount DESC.
   answer:select top 10 ProductID, sum(SaleAmount) as TotalSales from sales group by ProductID order by TotalSales desc;
21. Combine FirstName and LastName into one column named FullName in the Employees table. (only in select statement)
   answer:select EmployeeID,
       FirstName + ' ' + LastName as FullName,
       DepartmentName,
       Salary,
       HireDate,
       Age,
       Email,
       Country
from employees;
22. Write a query to select the distinct Category, ProductName, and Price for products that are priced above $50, using DISTINCT on three columns.
   answer:select distinct category, productname, price from products where price > 50;
23. Write a query that selects products whose Price is less than 10% of the average price in the Products table. (Do some research on how to find average price of all products)
   answer:select *from products where price < (select avg(price) * 0.10 from products);
24. Use WHERE clause to filter for employees whose Age is less than 30 and who work in either the 'HR' or 'IT' department.
   answer:select * from employees where age < 30   and departmentname in ('HR', 'IT');
25. Use LIKE with wildcard to select all customers whose Email contains the domain '@gmail.com'.
   answer:select * from customers where email like '%@gmail.com';
26. Write a query that uses the ALL operator to find employees whose salary is greater than all employees in the 'Sales' department.
   answer: select *from employees where salary > all (select salary from employees where departmentname = 'Sales');
27. Write a query that filters the Orders table for orders placed in the last 180 days using BETWEEN and CURRENT_DATE. (Search how to get the current date)
   answer: select *from orders where orderdate between CURRENT_DATE - INTERVAL '180' DAY and CURRENT_DATE;

