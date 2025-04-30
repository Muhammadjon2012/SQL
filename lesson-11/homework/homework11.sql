🟢 Easy-Level Tasks (7)

    Return: OrderID, CustomerName, OrderDate
    Task: Show all orders placed after 2022 along with the names of the customers who placed them.
    Tables Used: Orders, Customers
select o.orderid, c.firstname + ' ' + c.lastname as customername, o.orderdate
from orders o
join customers c on o.customerid = c.customerid
where o.orderdate > '2022';
    Return: EmployeeName, DepartmentName
    Task: Display the names of employees who work in either the Sales or Marketing department.
    Tables Used: Employees, Departments

      select e.name as employeename, d.departmentname
from employees e
join departments d on e.departmentid = d.departmentid
where d.departmentname in ('Sales', 'Marketing');

    Return: DepartmentName, TopEmployeeName, MaxSalary
    Task: For each department, show the name of the employee who earns the highest salary.
    Tables Used: Departments, Employees (as a derived table)

      select d.departmentname, 
       e.name as topeemplname, 
       e.salary as maxsalary
from departments d
join (
    select departmentid, 
           name, 
           salary,
              from employees
) e on d.departmentid = e.departmentid


    Return: CustomerName, OrderID, OrderDate
    Task: List all customers from the USA who placed orders in the year 2023.
    Tables Used: Customers, Orders

      select c.firstname + ' ' + c.lastname as customername, o.orderid, o.orderdate
from customers c
join orders o on c.customerid = o.customerid
where c.country = 'USA' and year(o.orderdate) = 2023;

    Return: CustomerName, TotalOrders
    Task: Show how many orders each customer has placed.
    Tables Used: Orders (as a derived table), Customers

      select c.firstname + ' ' + c.lastname as customername, count(o.orderid) as totalorders
from customers c
left join orders o on c.customerid = o.customerid
group by c.firstname, c.lastname;

    Return: ProductName, SupplierName
    Task: Display the names of products that are supplied by either Gadget Supplies or Clothing Mart.
    Tables Used: Products, Suppliers

      select p.productname, s.suppliername
from products p
join suppliers s on p.supplierid = s.supplierid
where s.suppliername in ('Gadget Supplies', 'Clothing Mart');

    Return: CustomerName, MostRecentOrderDate, OrderID
    Task: For each customer, show their most recent order. Include customers who haven't placed any orders.
    Tables Used: Customers, Orders (as a derived table)

      select c.firstname + ' ' + c.lastname as customername, 
       o.mostrecentorderdate, 
       o.orderid
from customers c
left join (
    select customerid, 
           orderid, 
           orderdate 
    from orders

🟠 Medium-Level Tasks (6)

    Return: CustomerName, OrderID, OrderTotal
    Task: Show the customers who have placed an order where the total amount is greater than 500.
    Tables Used: Orders, Customers

      select c.firstname + ' ' + c.lastname as customername, o.orderid, o.totalamount as ordertotal
from orders o
join customers c on o.customerid = c.customerid
where o.totalamount > 500;

    Return: ProductName, SaleDate, SaleAmount
    Task: List product sales where the sale was made in 2022 or the sale amount exceeded 400.
    Tables Used: Products, Sales

      select p.productname, s.saledate, s.saleamount
from sales s
join products p on s.productid = p.productid
where year(s.saledate) = 2022 or s.saleamount > 400;

    Return: ProductName, TotalSalesAmount
    Task: Display each product along with the total amount it has been sold for.
    Tables Used: Sales (as a derived table), Products

      select p.productname, sum(s.saleamount) as totalsalesamount
from products p
join sales s on p.productid = s.productid
group by p.productname;

    Return: EmployeeName, DepartmentName, Salary
    Task: Show the employees who work in the HR department and earn a salary greater than 50000.
    Tables Used: Employees, Departments

      select e.name as employeename, d.departmentname, e.salary
from employees e
join departments d on e.departmentid = d.departmentid
where d.departmentname = 'HR' and e.salary > 50000;

    Return: ProductName, SaleDate, StockQuantity
    Task: List the products that were sold in 2023 and had more than 50 units in stock at the time.
    Tables Used: Products, Sales

      select p.productname, s.saledate, p.stockquantity
from sales s
join products p on s.productid = p.productid
where year(s.saledate) = 2023 and p.stockquantity > 50;

    Return: EmployeeName, DepartmentName, HireDate
    Task: Show employees who either work in the Sales department or were hired after 2020.
    Tables Used: Employees, Departments
      select e.name as employeename, d.departmentname, e.hiredate
from employees e
join departments d on e.departmentid = d.departmentid
where d.departmentname = 'Sales' or e.hiredate > '2020';

🔴 Hard-Level Tasks (7)

    Return: CustomerName, OrderID, Address, OrderDate
    Task: List all orders made by customers in the USA whose address starts with 4 digits.
    Tables Used: Customers, Orders

      select c.firstname + ' ' + c.lastname as customername, o.orderid, c.address, o.orderdate
from customers c
join orders o on c.customerid = o.customerid
where c.country = 'USA' and c.address like '____%';

    Return: ProductName, Category, SaleAmount
    Task: Display product sales for items in the Electronics category or where the sale amount exceeded 350.
    Tables Used: Products, Sales

      select p.productname, p.category, s.saleamount
from sales s
join products p on s.productid = p.productid
where p.category = 'Electronics' or s.saleamount > 350;

    Return: CategoryName, ProductCount
    Task: Show the number of products available in each category.
    Tables Used: Products (as a derived table), Categories

      select c.categoryname, count(p.productid) as productcount
from categories c
left join products p on c.categoryid = p.category
group by c.categoryname;

    Return: CustomerName, City, OrderID, Amount
    Task: List orders where the customer is from Los Angeles and the order amount is greater than 300.
    Tables Used: Customers, Orders


      elect c.firstname + ' ' + c.lastname as customername, c.city, o.orderid, o.totalamount as amount
from customers c
join orders o on c.customerid = o.customerid
where c.city = 'Los Angeles' and o.totalamount > 300;

      
    Return: EmployeeName, DepartmentName
    Task: Display employees who are in the HR or Finance department, or whose name contains at least 4 vowels.
    Tables Used: Employees, Departments

      select e.name as employeename, d.departmentname
from employees e
join departments d on e.departmentid = d.departmentid
in d.departmentname in ('HR', 'Finance')
   
    Return: ProductName, QuantitySold, Price
    Task: List products that had a sales quantity above 100 and a price above 500.
    Tables Used: Sales, Products 
      select p.productname, sum(s.quantity) as quantitysold, p.price
from sales s
join products p on s.productid = p.productid
group by p.productname, p.price
having sum(s.quantity) > 100 and p.price > 500;

    Return: EmployeeName, DepartmentName, Salary
    Task: Show employees who are in the Sales or Marketing department and have a salary above 60000.
    Tables Used: Employees, Departments

      select e.name as employeename, d.departmentname, e.salary
from employees e
join departments d on e.departmentid = d.departmentid
in d.departmentname in ('Sales', 'Marketing') and e.salary > 60000;
