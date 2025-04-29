🟢 Easy (10 puzzles)

    1. Using Products, Suppliers table List all combinations of product names and supplier names.
       answer: select p.productname, s.suppliername from products p cross join suppliers s;
    2. Using Departments, Employees table Get all combinations of departments and employees.
  answer: select d.departmentname, e.name from departments d cross join employees e;
    3. Using Products, Suppliers table List only the combinations where the supplier actually supplies the product. Return supplier name and product name
  answer: select s.suppliername, p.productname from products p inner join suppliers s on p.supplierid = s.supplierid;
    4. Using Orders, Customers table List customer names and their orders ID.
  answer: select c.firstname, c.lastname, o.orderid from orders o inner join customers c on o.customerid = c.customerid;
    5. Using Courses, Students table Get all combinations of students and courses.
  answer: select s.name, c.coursename from students s cross join courses c;
    6. Using Products, Orders table Get product names and orders where product IDs match.
  answer: select p.productname, o.orderid from products p inner join orders o on p.productid = o.productid;
    7. Using Departments, Employees table List employees whose DepartmentID matches the department.
  answer: select e.name, d.departmentname from employees e inner join departments d on e.departmentid = d.departmentid;
    8. Using Students, Enrollments table List student names and their enrolled course IDs.
  answer: select s.name, e.courseid from students s inner join enrollments e on s.studentid = e.studentid;
    9. Using Payments, Orders table List all orders that have matching payments.
  answer: select o.orderid, p.paymentid from orders o inner join payments p on o.orderid = p.orderid;
    10. Using Orders, Products table Show orders where product price is more than 100.
  answer: select o.orderid, p.productname, p.price from orders o inner join products p on o.productid = p.productid where p.price > 100;

🟡 Medium (10 puzzles)

    11. Using Employees, Departments table List employee names and department names where department IDs are not equal. It means: Show all mismatched employee-department combinations.
  answer: select e.name, d.departmentname from employees e inner join departments d on e.departmentid = d.departmentid;
    12. Using Orders, Products table Show orders where ordered quantity is greater than stock quantity.
  answer:select o.orderid, p.productname, o.quantity, p.stockquantity from orders o inner join products p on o.productid = p.productid where o.quantity > p.stockquantity;
    13. Using Customers, Sales table List customer names and product IDs where sale amount is 500 or more.
  answer:select c.firstname, c.lastname, s.productid from sales s inner join customers c on s.customerid = c.customerid where s.saleamount >= 500;
    14. Using Courses, Enrollments, Students table List student names and course names they’re enrolled in.
  answer: select s.name, c.coursename from students s inner join enrollments e on s.studentid = e.studentid inner join courses c on e.courseid = c.courseid;
    15. Using Products, Suppliers table List product and supplier names where supplier name contains “Tech”.
  answer: select p.productname, s.suppliername  from products p inner join suppliers s on p.supplierid = s.supplierid where s.suppliername like '%Tech%';
    16. Using Orders, Payments table Show orders where payment amount is less than total amount.
  answer: select o.orderid, o.totalamount, p.paymentid, p.amount from orders o inner join payments p on o.orderid = p.orderid where p.amount < o.totalamount;
    17. Using Employees table List employee names with salaries greater than their manager’s salary.
  answer: select e.name, e.salary, m.name as manager_name, m.salary as manager_salary from employees e inner join employees m on e.managerid = m.employeeid where e.salary > m.salary;
    18. Using Products, Categories table Show products where category is either 'Electronics' or 'Furniture'.
  answer: select p.productname, c.categoryname from products p inner join categories c on p.category = c.categoryid where c.categoryname in ('Electronics', 'Furniture');
    19. Using Sales, Customers table Show all sales from customers who are from 'USA'.
  answer: select s.saleid, s.productid, s.saleamount, c.firstname, c.lastname, c.country  from sales s inner join customers c on s.customerid = c.customerid where c.country = 'USA';
    20. Using Orders, Customers table List orders made by customers from 'Germany' and order total > 100.
  answer: select o.orderid, o.totalamount, c.firstname, c.lastname, c.country from orders o inner join customers c on o.customerid = c.customerid where c.country = 'Germany' and o.totalamount > 100;

🔴 Hard (5 puzzles)

    21. Using Employees table List all pairs of employees from different departments.
  answer:select e1.name as employee1, e2.name as employee2, e1.departmentid as department1, e2.departmentid as department2
from employees e1 inner join employees e2 on e1.employeeid < e2.employeeid
    22. Using Payments, Orders, Products table List payment details where the paid amount is not equal to (Quantity × Product Price).
  answer: select p.paymentid, p.amount as paid_amount, o.orderid, o.quantity, pr.price, (o.quantity * pr.price) as expected_amount
from payments p
inner join orders o on p.orderid = o.orderid
inner join products pr on o.productid = pr.productid
where p.amount != (o.quantity * pr.price);
    23. Using Students, Enrollments, Courses table Find students who are not enrolled in any course.
  answer: select s.studentid, s.name
from students s
left join enrollments e on s.studentid = e.studentid
where e.enrollmentid is null;
    24. Using Employees table List employees who are managers of someone, but their salary is less than or equal to the person they manage.
  answer:select e1.name as manager_name, e1.salary as manager_salary, e2.name as employee_name, e2.salary as employee_salary
from employees e1
inner join employees e2 on e1.employeeid = e2.managerid
where e1.salary >= e2.salary;
    25. Using Orders, Payments, Customers table List customers who have made an order, but no payment has been recorded for it.
  answer: select c.firstname, c.lastname, o.orderid
from orders o
inner join customers c on o.customerid = c.customerid
left join payments p on o.orderid = p.orderid

