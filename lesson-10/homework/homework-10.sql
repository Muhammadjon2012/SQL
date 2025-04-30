🟢 Easy-Level Tasks (10)

    Using the Employees and Departments tables, write a query to return the names and salaries of employees whose salary is greater than 50000, along with their department names.
    🔁 Expected Output: EmployeeName, Salary, DepartmentName
select e.name as employeename, e.salary, d.departmentname
from employees e
join departments d on e.departmentid = d.departmentid
where e.salary > 50000;
    Using the Customers and Orders tables, write a query to display customer names and order dates for orders placed in the year 2023.
    🔁 Expected Output: FirstName, LastName, OrderDate
      select c.firstname, c.lastname, o.orderdate
from customers c
join orders o on c.customerid = o.customerid
where year(o.orderdate) = 2023;

    Using the Employees and Departments tables, write a query to show all employees along with their department names. Include employees who do not belong to any department.
    🔁 Expected Output: EmployeeName, DepartmentName
    (Hint: Use a LEFT OUTER JOIN)
select e.name as employeename, d.departmentname
from employees e
left outer join departments d on e.departmentid = d.departmentid;
    Using the Products and Suppliers tables, write a query to list all suppliers and the products they supply. Show suppliers even if they don’t supply any product.
    🔁 Expected Output: SupplierName, ProductName

      select s.suppliername, p.productname
from suppliers s
left outer join products p on s.supplierid = p.supplierid;

    Using the Orders and Payments tables, write a query to return all orders and their corresponding payments. Include orders without payments and payments not linked to any order.
    🔁 Expected Output: OrderID, OrderDate, PaymentDate, Amount

      select o.orderid, o.orderdate, p.paymentdate, p.amount
from orders o
left join payments p on o.orderid = p.orderid
union
select o.orderid, o.orderdate, p.paymentdate, p.amount
from orders o
right join payments p on o.orderid = p.orderid;
    Using the Employees table, write a query to show each employee's name along with the name of their manager.
    🔁 Expected Output: EmployeeName, ManagerName

      select e.name as employeename, m.name as managername
from employees e
right join employees m on e.managerid = m.employeeid;

    Using the Students, Courses, and Enrollments tables, write a query to list the names of students who are enrolled in the course named 'Math 101'.
    🔁 Expected Output: StudentName, CourseName

      select s.name as studentname, c.coursename
from students s
join enrollments e on s.studentid = e.studentid
join courses c on e.courseid = c.courseid
where c.coursename = 'Math 101';
      
    Using the Customers and Orders tables, write a query to find customers who have placed an order with more than 3 items. Return their name and the quantity they ordered.
    🔁 Expected Output: FirstName, LastName, Quantity

      select c.firstname, c.lastname, o.quantity
from customers c
join orders o on c.customerid = o.customerid
where o.quantity > 3;

    Using the Employees and Departments tables, write a query to list employees working in the 'Human Resources' department.
    🔁 Expected Output: EmployeeName, DepartmentName

      select e.name as employeename, d.departmentname
from employees e
inner join departments d on e.departmentid = d.departmentid
where d.departmentname = 'Human Resources';

🟠 Medium-Level Tasks (9)

    Using the Employees and Departments tables, write a query to return department names that have more than 10 employees.
    🔁 Expected Output: DepartmentName, EmployeeCount

      select d.departmentname, count(e.employeeid) as employeecount
from employees e
join departments d on e.departmentid = d.departmentid
group by d.departmentname
having count(e.employeeid) > 10;

    Using the Products and Sales tables, write a query to find products that have never been sold.
    🔁 Expected Output: ProductID, ProductName

      select p.productid, p.productname
from products p
left join sales s on p.productid = s.productid
where s.productid is null;

    Using the Customers and Orders tables, write a query to return customer names who have placed at least one order.
    🔁 Expected Output: FirstName, LastName, TotalOrders

      select c.firstname, c.lastname, count(o.orderid) as totalorders
from customers c
left join orders o on c.customerid = o.customerid
group by c.firstname, c.lastname
having count(o.orderid) >= 1;

    Using the Employees and Departments tables, write a query to show only those records where both employee and department exist (no NULLs).
    🔁 Expected Output: EmployeeName, DepartmentName
        select e.name as employeename, d.departmentname
from employees e
inner join departments d on e.departmentid = d.departmentid;

    Using the Employees table, write a query to find pairs of employees who report to the same manager.
    🔁 Expected Output: Employee1, Employee2, ManagerID

        select e1.name as employee1, e2.name as employee2, e1.managerid
from employees e1
join employees e2 on e1.managerid = e2.managerid
where e1.employeeid < e2.employeeid and e1.managerid is not null;

    Using the Orders and Customers tables, write a query to list all orders placed in 2022 along with the customer name.
    🔁 Expected Output: OrderID, OrderDate, FirstName, LastName

        select o.orderid, o.orderdate, c.firstname, c.lastname
from orders o
join customers c on o.customerid = c.customerid
where year(o.orderdate) = 2022;

    Using the Employees and Departments tables, write a query to return employees from the 'Sales' department whose salary is above 60000.
    🔁 Expected Output: EmployeeName, Salary, DepartmentName

        select e.name as employeename, e.salary, d.departmentname
from employees e
join departments d on e.departmentid = d.departmentid
where d.departmentname = 'Sales' and e.salary > 60000;

    Using the Orders and Payments tables, write a query to return only those orders that have a corresponding payment.
    🔁 Expected Output: OrderID, OrderDate, PaymentDate, Amount

        select o.orderid, o.orderdate, p.paymentdate, p.amount
from orders o
join payments p on o.orderid = p.orderid;

    Using the Products and Orders tables, write a query to find products that were never ordered.
    🔁 Expected Output: ProductID, ProductName

        select p.productid, p.productname
from products p
left join orders o on p.productid = o.productid
where o.productid is null;

🔴 Hard-Level Tasks (9)

    Using the Employees table, write a query to find employees whose salary is greater than the average salary of all employees.
    🔁 Expected Output: EmployeeName, Salary

        select e.name as employeename, e.salary
from employees e
where e.salary > (select avg(salary) from employees);
    Using the Orders and Payments tables, write a query to list all orders placed before 2020 that have no corresponding payment.
    🔁 Expected Output: OrderID, OrderDate
        select o.orderid, o.orderdate
from orders o
join payments p on o.orderid = p.orderid
where o.orderdate < '2020-01-01' and p.paymentid is null;

    Using the Products and Categories tables, write a query to return products that do not have a matching category.
    🔁 Expected Output: ProductID, ProductName
select p.productid, p.productname
from products p
right join categories c on p.category = c.categoryid
where c.categoryid is null;
    Using the Employees table, write a query to find employees who report to the same manager and earn more than 60000.
    🔁 Expected Output: Employee1, Employee2, ManagerID, Salary

        select e1.name as employee1, e2.name as employee2, e1.managerid, e1.salary
from employees e1
join employees e2 on e1.managerid = e2.managerid
where e1.employeeid < e2.employeeid 
and e1.salary > 60000
and e2.salary > 60000;



    Using the Employees and Departments tables, write a query to return employees who work in departments whose name starts with the letter 'M'.
    🔁 Expected Output: EmployeeName, DepartmentName

        select e.name as employeename, d.departmentname
from employees e
join departments d on e.departmentid = d.departmentid
where d.departmentname like 'M%';
    Using the Products and Sales tables, write a query to list sales where the amount is greater than 500, including product names.
    🔁 Expected Output: SaleID, ProductName, SaleAmount
        select s.saleid, p.productname, s.saleamount
from sales s
join products p on s.productid = p.productid
where s.saleamount > 500;

    Using the Students, Courses, and Enrollments tables, write a query to find students who have not enrolled in the course 'Math 101'.
    🔁 Expected Output: StudentID, StudentName

        select s.studentid, s.name as studentname
from students s
where s.studentid not in (
    select e.studentid
    from enrollments e
    join courses c on e.courseid = c.courseid
    where c.coursename = 'Math 101'
);
    Using the Orders and Payments tables, write a query to return orders that are missing payment details.
    🔁 Expected Output: OrderID, OrderDate, PaymentID
        select o.orderid, o.orderdate, p.paymentid
from orders o
join payments p on o.orderid = p.orderid
where p.paymentid is null;

    Using the Products and Categories tables, write a query to list products that belong to either the 'Electronics' or 'Furniture' category.
    🔁 Expected Output: ProductID, ProductName, CategoryName

        select p.productid, p.productname, c.categoryname
from products p
join categories c on p.category = c.categoryid
where c.categoryname in ('Electronics', 'Furniture');

