Easy-Level Tasks

1. Using Products table, find the total number of products available in each category.
  answer: select category, count(*) as total_products from products group by category;
2. Using Products table, get the average price of products in the 'Electronics' category.
    answer: select avg(price) as average_price from products where category = 'Electronics';
3. Using Customers table, list all customers from cities that start with 'L'.
    answer: select * from customers where city like 'L%';
4. Using Products table, get all product names that end with 'er'.
  answer:select productname from products where productname like '%er';
5. Using Customers table, list all customers from countries ending in 'A'.
  answer: select * from customers where country like '%a';
6. Using Products table, show the highest price among all products.
  answer: select max(price) as highest_price from products;
7. Using Products table, use IIF to label stock as 'Low Stock' if quantity < 30, else 'Sufficient'.
  answer:select productname,iif(stockquantity < 30, 'Low Stock', 'Sufficient') as stock_status from products;
8. Using Customers table, find the total number of customers in each country.
  answer:select country, count(*) as total_customers from customers group by country;
9. Using Orders table, find the minimum and maximum quantity ordered.
  answer:select min(quantity) as min_quantity, max(quantity) as max_quantity from orders;

Medium-Level Tasks

10. Using Orders and Invoices tables, list customer IDs who placed orders in 2023 (using EXCEPT) to find those who did not have invoices.
  answer:select customerid from orders where year(orderdate) = 2023 except select customerid from invoices;
11. Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted including duplicates.
  answer:select productname from products union all select productname from products_discounted;
12. Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted without duplicates.
  answer: select productname from products union select productname from products_discounted;
13. Using Orders table, find the average order amount by year.
  answer:select year(orderdate) as order_year, avg(orderamount) as average_order_amount from orders group by year(orderdate) order by order_year;
14. Using Products table, use CASE to group products based on price: 'Low' (<100), 'Mid' (100-500), 'High' (>500). Return productname and pricegroup.
  answer: select productname,
       case 
           when price < 100 then 'Low'
           when price between 100 and 500 then 'Mid'
           when price > 500 then 'High'
           else 
  end from products;
15. Using Customers table, list all unique cities where customers live, sorted alphabetically.
  answer: select distinct city from customers order by city;
16. Using Sales table, find total sales per product Id.
  answer:select productid, sum(saleamount) as total_sales from sales group by productid;
17. Using Products table, use wildcard to find products that contain 'oo' in the name. Return productname.
  answer:select productname from products where productname like '%oo%';
18. Using Products and Products_Discounted tables, compare product IDs using INTERSECT.
  answer:select productid from products intersect select productid from products_discounted;

Hard-Level Tasks

19. Using Invoices table, show top 3 customers with the highest total invoice amount. Return CustomerID and Totalspent.
  answer: select customerid, sum(totalamount) as totalspent
from invoices
group by customerid
order by totalspent asc
limit 3;
20. Find product ID and productname that are present in Products but not in Products_Discounted.
  answer: select productid, productname
from products
where productid not in (from products_discounted);
21. Using Products and Sales tables, list product names and the number of times each has been sold. (Research for Joins)
  answer: select p.productname, count(s.saleid) as times_sold
from products p
left join sales s on p.productid = s.productid
group by p.productname
order by times_sold desc;
22. Using Orders table, find top 5 products (by ProductID) with the highest order quantities.
  answer:select productid, sum(quantity) as total_quantity
from orders
group by productid
order by total_quantity desc
limit 5;
