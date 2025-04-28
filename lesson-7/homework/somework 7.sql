Easy-Level Tasks (10)

  
1. Write a query to find the minimum (MIN) price of a product in the Products table.
answer: select min(price) from products;
2. Write a query to find the maximum (MAX) Salary from the Employees table.
  answer: select max(salary) from employees;
3. Write a query to count the number of rows in the Customers table using COUNT(*).
answer: select count(*) from customers;
4. Write a query to count the number of unique product categories (COUNT(DISTINCT Category)) from the Products table.
  answer: select count(distinct category) as unique_categories from products;
5. Write a query to find the total (SUM) sales amount for the product with id 7 in the Sales table.
  answer: select sum(saleamount)from sales where productid = 7;
6. Write a query to calculate the average (AVG) age of employees in the Employees table.
  answer: select avg(age) from employees;
7. Write a query that uses GROUP BY to count the number of employees in each department.
  answer:select departmentname, count(*) from employees group by departmentname;
8. Write a query to show the minimum and maximum Price of products grouped by Category. Use products table.
 answer:select category, min(price) , max(price) from products group by category;
9. Write a query to calculate the total (SUM) sales per Customer in the Sales table.
  answer:select customerid, sum(saleamount) from sales group by customerid;
10. Write a query to use HAVING to filter departments having more than 5 employees from the Employees table.(DeptID is enough, if you don't have DeptName).
  answer: select departmentname, count(*) from employees group by departmentname having count(*) > 5;

Medium-Level Tasks (9)

11. Write a query to calculate the total sales and average sales for each product category from the Sales table.
  answer: select productid, sum(saleamount) as total_sales, avg(saleamount) as average_sales
from sales
group by productid;
12. Write a query that uses COUNT(columnname) to count the number of employees from the Department HR.
  answer: select count(*) from employees where departmentname = 'HR';
13. Write a query that finds the highest (MAX) and lowest (MIN) Salary by department in the Employees table.(DeptID is enough, if you don't have DeptName).
  answer: select DepartmentName, max(salary) as highest_salary, min(salary) as lowest_salary
from employees
group by DepartmentName;
14. Write a query that uses GROUP BY to calculate the average salary per Department.(DeptID is enough, if you don't have DeptName).
  answer:select DepartmentName, avg(salary) as average_salary
from employees
group by DepartmentName;
15. Write a query to show the AVG salary and COUNT(*) of employees working in each department.(DeptID is enough, if you don't have DeptName).
  answer:select DepartmentName, avg(salary) as average_salary, count(*) as employee_count
from employees
group by DepartmentName;
16. Write a query that uses HAVING to filter product categories with an average price greater than 400.
  answer:
17. Write a query that calculates the total sales for each year in the Sales table, and use GROUP BY to group them.
answer: select year(saledate) as sale_year, sum(saleamount) as total_sales
from sales
group by year(saledate);
18. Write a query that uses COUNT to show the number of customers who placed at least 3 orders.
answer: select customerid, count(*) as order_count
from sales
group by customerid
having count(*) >= 3;
19. Write a query that applies the HAVING clause to filter out Departments with total salary expenses greater than 500,000.(DeptID is enough, if you don't have DeptName).
  answer: select DepartmentName, sum(Salary) as total_salary_expenses
from employees
group by DepartmentName
having sum(Salary) > 500000;

Hard-Level Tasks (6)

20. Write a query that shows the average (AVG) sales for each product category, and then uses HAVING to filter categories with an average sales amount greater than 200.
  answer:select category, avg(SaleAmount)
from products
group by category
having avg(SaleAmount) > 200;
21. Write a query to calculate the total (SUM) sales for each Customer, then filter the results using HAVING to include only Customers with total sales over 1500.
  answer:select customerid, sum(saleamount) as total_sales
from sales
group by customerid
having sum(saleamount) > 1500;
22. Write a query to find the total (SUM) and average (AVG) salary of employees grouped by department, and use HAVING to include only departments with an average salary greater than 65000.
  answer:select DepartmentName, sum(salary) as total_salary, avg(salary) as average_salary
from employees
group by DepartmentName
having avg(salary) > 65000;
23. Write a query that finds the maximum (MAX) and minimum (MIN) order value for each customer, and then applies HAVING to exclude customers with an order value less than 50.
  answer: select customerid, max(saleamount) as maximum_order_value, min(saleamount) as minimum_order_value
from sales
group by customerid
having max(saleamount) >= 50;
24. Write a query that calculates the total sales (SUM) and counts distinct products sold in each month, and then applies HAVING to filter the months with more than 8 products sold.
answer:select month(saledate) , sum(saleamount) , count(distinct productid)
from sales
group by month(saledate)
having count(distinct productid) > 8;
25. Write a query to find the MIN and MAX order quantity per Year. From orders table.
  answer: select year(orderdate) , min(orderquantity) , max(orderquantity) 
from orders
group by year(orderdate);
