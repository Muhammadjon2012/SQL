Puzzle 1: Finding Distinct Values

Question: Explain at least two ways to find distinct values based on two columns.

answer: select distinct col1, col2
from inputtbl
 2nd way - select col1, col2
from inputtbl
group by col1, col2;
Puzzle 2: Removing Rows with All Zeroes
Question: If all the columns have zero values, then don’t show that row. In this case, we have to remove the 5th row while selecting data.
  answer: 	select *from TestMultipleZero
where not (A = 0 and B = 0 and C = 0 and D = 0);
Puzzle 3: Find those with odd ids
	   select *from section1 where id % 2 != 0;
Puzzle 4: Person with the smallest id (use the table in puzzle 3)
	   select *from section1 order by idlimit 1;
Puzzle 5: Person with the highest id (use the table in puzzle 3
  select *from section1 order by id asc limit 1;
  Puzzle 6: People whose name starts with b (use the table in puzzle 3)
select *from section1 where name like 'B%';

Puzle 7: Write a query to return only the rows where the code contains the literal underscore _ (not as a wildcard).
  select *from ProductCodes where Code like '%\_%';
