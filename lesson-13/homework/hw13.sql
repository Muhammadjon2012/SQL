Easy Tasks

    You need to write a query that outputs "100-Steven King", meaning emp_id + first_name + last_name in that format using employees table.
  select concat(employee_id, '-', first_name, ' ', last_name) as info from employees where employee_id = 100;
    Update the portion of the phone_number in the employees table, within the phone number the substring '124' will be replaced by '999'
      update employees set phone_number = replace(phone_number, '124', '999');
    That displays the first name and the length of the first name for all employees whose name starts with the letters 'A', 'J' or 'M'. Give each column an appropriate label. Sort the results by the employees' first names.(Employees)
      select first_name as name, length(first_name) as name_length
from employees
where first_name like 'A%' or first_name like 'J%' or first_name like 'M%'
order by first_name;
      
    Write an SQL query to find the total salary for each manager ID.(Employees table)
      select manager_id, sum(salary) as total_salary
from employees
group by manager_id;
      
    Write a query to retrieve the year and the highest value from the columns Max1, Max2, and Max3 for each row in the TestMax table
select   year,   greatest(max1, max2, max3) as highest_value from testmax;
      
    Find me odd numbered movies and description is not boring.(cinema)
      select *
from cinema
where movie = 1
  and description not like '%boring%';
      
    You have to sort data based on the Id but Id with 0 should always be the last row. Now the question is can you do that with a single order by column.(SingleOrder)      
    Write an SQL query to select the first non-null value from a set of columns. If the first column is null, move to the next, and so on. If all columns are null, return null.(person)
      select coalesce(id ,  ssn ,    passportid ,    itin ) as first_non_null
from person;

Medium Tasks

    Split column FullName into 3 part ( Firstname, Middlename, and Lastname).(Students Table)
      select
  substring(fullname, 1, charindex(' ', fullname) - 1) as firstname,
  substring(fullname, charindex(' ', fullname) + 1, charindex(' ', fullname, charindex(' ', fullname) + 1) - charindex(' ', fullname) - 1) as middlename,
  substring(fullname, charindex(' ', fullname, charindex(' ', fullname) + 1) + 1, len(fullname)) as lastname
from students;

    For every customer that had a delivery to California, provide a result set of the customer orders that were delivered to Texas. (Orders Table)
      select *
from orders
where customerid in (
    select distinct customerid
    from orders
    where deliverystate = 'California'
)
and deliverystate = 'Texas';

    Write an SQL statement that can group concatenate the following values.(DMLTable)
      select group concat(column_name separator ', ') as concatenated_values
from dmltable;

    Find all employees whose names (concatenated first and last) contain the letter "a" at least 3 times.

      select *
from employees
where len(lower(first_name + last_name)) - len(replace(lower(first_name + last_name), 'a', '')) >= 3;
      
    The total number of employees in each department and the percentage of those employees who have been with the company for more than 3 years(Employees)

      select 
    department_id,
    count(*) as total_employees,
    cast(100.0 * sum(case when datediff(year, hire_date, getdate()) > 3 then 1 else 0 end) / count(*) as decimal(5,2)) as pct_more_than_3_years
from employees
group by department_id;
      
    Write an SQL statement that determines the most and least experienced Spaceman ID by their job description.(Personal)

      select 
    jobdescription,
    spacemanid as most_experienced_spaceman
from personal
where MissionCount = (select max(MissionCount) from personal p2 where p2.jobdescription = personal.jobdescription)

union all

select 
    jobdescription,
    spacemanid as least_experienced_spaceman
from personal
where MissionCount = (select min(MissionCount) from personal p2 where p2.MissionCount = personal.MissionCount);

Difficult Tasks

    Write an SQL query that separates the uppercase letters, lowercase letters, numbers, and other characters from the given string 'tf56sd#%OqH' into separate columns.
    Write an SQL query that replaces each row with the sum of its value and the previous rows' value. (Students table)
      elect
  id,
  value,
  sum(value) over (order by id rows unbounded preceding) as running_total
from students;

    You are given the following table, which contains a VARCHAR column that contains mathematical equations. Sum the equations and provide the answers in the output.(Equations)
      select
  id,
  equation,
  cast(eval(equation) as decimal(10,2)) as result
from equations;
    Given the following dataset, find the students that share the same birthday.(Student Table)
      select
  birthday,
  count(*) as student_count
from student
group by birthday
having count(*) > 1;
    You have a table with two players (Player A and Player B) and their scores. If a pair of players have multiple entries, aggregate their scores into a single row for each unique pair of players. Write an SQL query to calculate the total score for each unique player pair(PlayerScores)
select
  case 
    when player_a < player_b then player_a
    else player_b
  end as player_1,
  case
    when player_a < player_b then player_b
    else player_a
  end as player_2,
  sum(score) as total_score
from PlayerScores
group by
  case 
    when player_a < player_b then player_a
    else player_b
  end,
  case
    when player_a < player_b then player_b
    else player_a
  end;
