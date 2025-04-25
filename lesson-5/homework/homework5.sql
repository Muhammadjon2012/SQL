Lesson 5: Aliases, Unions, and Conditional columns

Easy-Level Tasks


1. Write a query that uses an alias to rename the ProductName column as Name in the Products table.
  answer:select productname as name from products;
2. Write a query that uses an alias to rename the Customers table as Client for easier reference.
  answer:select client.firstname, client.lastname, client.email from customers as client;
3. Use UNION to combine results from two queries that select ProductName from Products and ProductName from Products_Discounted.
  answer: select productname from products
          union
          select productname from products_discounted;
4. Write a query to find the intersection of Products and Products_Discounted tables using INTERSECT.
  answer: select productname from products
          intersect
          select productname from products_discounted;
5. Write a query to select distinct customer names and their corresponding Country using SELECT DISTINCT.
  answer:select distinct firstname, lastname, country from customers;
6. Write a query that uses CASE to create a conditional column that displays 'High' if Price > 1000, and 'Low' if Price <= 1000 from Products table.
  answer:select productname, price, case when price > 1000 then 'High' else 'Low' end as price_level from products;
7. Use IIF to create a column that shows 'Yes' if Stock > 100, and 'No' otherwise (Products_Discounted table, StockQuantity column).
  answer:select productname,stockquantity, iif(stockquantity > 100, 'Yes', 'No') as stock_status from products_discounted;

Medium-Level Tasks


8. Use UNION to combine results from two queries that select ProductName from Products and ProductName from OutOfStock tables.
  answer:   select productname from products
            union
            select productname from outofstock
9. Write a query that returns the difference between the Products and Products_Discounted tables using EXCEPT.
  answer: select productname from products
          except
          select productname from products_discounted;
10. Create a conditional column using IIF that shows 'Expensive' if the Price is greater than 1000, and 'Affordable' if less, from Products table.
  answer: select productname, price, iif(price > 1000, 'Expensive', 'Affordable') as price_categoryfrom products;
11. Write a query to find employees in the Employees table who have either Age < 25 or Salary > 60000.
  answer:select *from employees where age < 25 or salary > 60000;
12. Update the salary of an employee based on their department, increase by 10% if they work in 'HR' or EmployeeID = 5
  answer:   update employees set salary = salary * 1.10 where DepartmentName = 'HR' or employeeid = 5;

Hard-Level Tasks

13. Use INTERSECT to show products that are common between Products and Products_Discounted tables.
  answer:    select productname from products intersect select productname from products_discounted;
14. Write a query that uses CASE to assign 'Top Tier' if SaleAmount > 500, 'Mid Tier' if SaleAmount BETWEEN 200 AND 500, and 'Low Tier' otherwise. (From Sales table)
  answer: select saleid, saleamount,
    case
        when saleamount > 500 then 'Top Tier'
        when saleamount between 200 and 500 then 'Mid Tier'
        else 'Low Tier' end as sale_tier from sales;
15. Use EXCEPT to find customers' ID who have placed orders but do not have a corresponding record in the Invoices table.
  answer: select customerid from orders except select customerid from invoices;
16. Write a query that uses a CASE statement to determine the discount percentage based on the quantity purchased. Use orders table.
  Result set should show customerid, quantity and discount percentage. 
  The discount should be applied as follows: 1 item: 3% Between 1 and 3 items : 5% Otherwise: 7%
answer: select customerid, quantity, case
        when quantity = 1 then 3
        when quantity between 2 and 3 then 5
        else 7 end as discount_percentage from orders;
