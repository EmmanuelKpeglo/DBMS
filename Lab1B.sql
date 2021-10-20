s--Current Time
--Display the current date
select current_date 


--Display the current time
select current_time 


--Display the current timestamp
select current_timestamp 


--Current from strings
--Convert the string '2018-09-26' to a date
select to_date('2018 - 09 - 26', 'YYYY - MM - DD')


--Convert the string '2018-09-26' to a timestamp
select to_timestamp('2018 - 09 - 26', 'YYYY - MM - DD') 


--Subtracting dates
--How many days are there between '2018-09-26' and '2018-12-25'?
select ('2018-12-25'::date - '2018-09-26'::date) as "difference in days"



--How many days have elapsed since each book in TITLES was published?
select title, pubdate, current_date, (current_date - pubdate::date) as "Number of days elapsed" from titles t


--Extracting components from dates
--Display the year of publication of each book in TITLES.
select title, extract (year from pubdate) as "year of publication" from titles t 


--Display the day of publication of each book in TITLES.
select title, pubdate, extract (day from pubdate) as "day of publication" from titles t 

select title, pubdate, extract (day from pubdate) as "day of publication", to_char(pubdate, 'DAY') as "day of of week"  from titles t


--Using TIMESTAMPDIFF
select ('2018-03-02'::timestamp - '2018-02-01'::timestamp)


--Exercises
--In a SELECT-statement, add the difference between 2011-01-01 and the current date to the sales date field in the sales table.
--The output should show both the new value and original sales date, with the original in dd-mm-yy format.
select ord_date, to_char(ord_date, 'dd-mm-yy') as "new ord_date format", (ord_date + (current_date - '2011-01-01'::date)) as "new value" from sales s 


--Show how many days remain between now and Thanksgiving and/or Christmas and/or New Years Day.
--Thanksgiving
select current_date, to_char('2021-11-25'::date, 'yyyy-mm-dd') as "thanksgiving day", ('2021-11-25'::date - current_date) as "days remaining before thanksgiving day"


--Show how old you are as a number of days - you don't have to be too honest about your year of birth if you are over 25 
select (current_date - '1996-02-09'::date) as "number of days years old"


--For each of the publication dates in titles, display the difference between the pubdate and the current date in days as an integer.
select title, pubdate, (current_date - pubdate::date) as "difference between pubdate and currrent date" from titles t 


--From the sales table convert the date field to dd/mm/yy format
select ord_date, to_char(ord_date, 'dd/mm/yy') as "new ord_date format" from sales s 


--select from the sales table stor_id for sales on your birthday in "dd/mm/yy" format. If there are none, then pick sales for the date nearest to your birthdate. Search again for before your birthday.
select stor_id, to_char(ord_date, 'dd/mm/yy'),
case 
	when ord_date = ('1996-02-09'::date ) then 'ord_date'
	when ('1996-02-09'::date - ord_date) < 514 then 'haha'
	end as new_date
from sales s 
















