Easy Tasks

    Write a SQL query to split the Name column by a comma into two separate columns: Name and Surname.(TestMultipleColumns)
  select  
    substring(name, 1, charindex(',', name) - 1) as name,  
    ltrim(substring(name, charindex(',', name) + 1, len(name))) as surname  
from testmultiplecolumns;

    Write a SQL query to find strings from a table where the string itself contains the % character.(TestPercent)
      select *  
from testpercent  
where column_name like '%[%]%';
      
    In this puzzle you will have to split a string based on dot(.).(Splitter)
      select  
    left(column_name, charindex('.', column_name) - 1) as part1,  
    substring(column_name, charindex('.', column_name) + 1, len(column_name)) as part2  
from splitter  
where column_name like '%.%';
      
    Write a SQL query to replace all integers (digits) in the string with 'X'.(1234ABC123456XYZ1234567890ADS)
      select regexp_replace(column_name, '[0-9]', 'X') as replaced_string  
from your_table_name;

    Write a SQL query to return all rows where the value in the Vals column contains more than two dots (.).(testDots)
      select *  
from testdots  
where len(vals) - len(replace(vals, '.', '')) > 2;
      
    Write a SQL query to count the spaces present in the string.(CountSpaces)
      select len(your_column) - len(replace(your_column, ' ', '')) as space_count
from countspaces;
    write a SQL query that finds out employees who earn more than their managers.(Employee)
      select e.employeeid, e.name, e.salary, e.managerid
from employee e
join employee m on e.managerid = m.employeeid
where e.salary > m.salary;
    Find the employees who have been with the company for more than 10 years, but less than 15 years. Display their Employee ID, First Name, Last Name, Hire Date, and the Years of Service (calculated as the number of years between the current date and the hire date).(Employees)
      select employeeid, firstname, lastname, hiredate,
       datediff(year, hiredate, getdate()) as years_of_service
from employees
where datediff(year, hiredate, getdate()) > 10
  and datediff(year, hiredate, getdate()) < 15;

Medium Tasks

    Write a SQL query to separate the integer values and the character values into two different columns.(rtcfvty34redt)
  select
  (select string_agg(value, '') 
   from string_split(col, '') 
   where value like '[0-9]') as integers,
  (select string_agg(value, '') 
   from string_split(col, '') 
   where value like '[^0-9]') as characters
from your_table;

    write a SQL query to find all dates' Ids with higher temperature compared to its previous (yesterday's) dates.(weather)
      select w1.id
from weather w1
join weather w2
  on w1.date = dateadd(day, 1, w2.date)
where w1.temperature > w2.temperature;

    Write an SQL query that reports the first login date for each player.(Activity)
      select player_id, min(login_date) as first_login_date
from activity
group by player_id;

    Your task is to return the third item from that list.(fruits)
      select fruit
from (
    select fruit, row_number() over (order by (select null)) as rn
    from fruits
) t
where rn = 3;

    Write a SQL query to create a table where each character from the string will be converted into a row.(sdgfhsdgfhs@121313131)
      with chars as (
    select substring('sdgfhsdgfhs@121313131', number, 1) as char
    from master..spt_values
    where type = 'P' and number between 1 and len('sdgfhsdgfhs@121313131')
)
select char from chars;

    You are given two tables: p1 and p2. Join these tables on the id column. The catch is: when the value of p1.code is 0, replace it with the value of p2.code.(p1,p2)
      select 
    p1.id,
    case when p1.code = 0 then p2.code else p1.code end as code
from p1
join p2 on p1.id = p2.id;
    Write an SQL query to determine the Employment Stage for each employee based on their HIRE_DATE. The stages are defined as follows:

        If the employee has worked for less than 1 year → 'New Hire'

        If the employee has worked for 1 to 5 years → 'Junior'

        If the employee has worked for 5 to 10 years → 'Mid-Level'

        If the employee has worked for 10 to 20 years → 'Senior'

        If the employee has worked for more than 20 years → 'Veteran'(Employees)
      select 
    employee_id,
    first_name,
    last_name,
    hire_date,
    case 
        when datediff(year, hire_date, getdate()) < 1 then 'New Hire'
        when datediff(year, hire_date, getdate()) between 1 and 5 then 'Junior'
        when datediff(year, hire_date, getdate()) > 5 and datediff(year, hire_date, getdate()) <= 10 then 'Mid-Level'
        when datediff(year, hire_date, getdate()) > 10 and datediff(year, hire_date, getdate()) <= 20 then 'Senior'
        when datediff(year, hire_date, getdate()) > 20 then 'Veteran'
    end as employment_stage
from employees;

    Write a SQL query to extract the integer value that appears at the start of the string in a column named Vals.(GetIntegers)
      select 
    vals,
    cast(left(vals, patindex('%[^0-9]%', vals + 'a') - 1) as int) as integer_start
from getintegers;

Difficult Tasks

    In this puzzle you have to swap the first two letters of the comma separated string.(MultipleVals)
  select
    vals,
    substring(vals, 3, len(vals)) + ',' + left(vals, 2) as swapped_vals
from
    multiplevals;



    Write a SQL query that reports the device that is first logged in for each player.(Activity)
      select
    player_id,
    device,
    min(login_date) as first_login_date
from
    activity
group by
    player_id,
    device
having
    min(login_date) = (
        select min(login_date)
        from activity a2
        where a2.player_id = activity.player_id
    );
    You are given a sales table. Calculate the week-on-week percentage of sales per area for each financial week. For each week, the total sales will be considered 100%, and the percentage sales for each day of the week should be calculated based on the area sales for that week.(WeekPercentagePuzzle)
