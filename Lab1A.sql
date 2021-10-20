--Find all titles with an undefined price in table titles
select title from titles t 
where price is null


--Find all titles with an undefined price in table titles and supply a price of $20.00 for those with no defined price
select price, coalesce(price, '$20.00') from titles t 


--List the first 50 characters (of the pr_info column) of the pub_info table
select pr_info, LEFT(pr_info ,50) from pub_info pi2 

select pr_info, substring(pr_info, 1, 50)
from pub_info 


--Examine the Postgres function reference for alternative ways of converting date values to varchar.
SELECT
    ord_date,
    TO_CHAR(
        ord_date,
        'Day DDth Mon YYYY'
    )
FROM
    sales
ORDER BY
    ord_date
    
SELECT cast('2017-08-25' as varchar)

SELECT to_char(current_date,'DD Mon YYYY' )



--Locate and use one the functions that would allow you to specify the format to be used when outputting a date. Format the ord_date in sales so it looks like this: Tuesday 13th September 1994
SELECT
    ord_date,
    TO_CHAR(
        ord_date,
        'Day DDth Mon YYYY'
    )
FROM
    sales
ORDER BY
    ord_date