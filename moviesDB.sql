use moviesdb;
show tables;
select * from movies;
select * from actors;
select * from financials;

select industry  , count(movie_id) as cnt
from movies
group by industry
order by cnt;

select industry  , count(movie_id) as cnt
from movies
WHERE industry = 'Bollywood'
group by industry
order by cnt;


select a.movie_id , a.title , b.budget , b.revenue
from movies a
right join financials b
on a.movie_id = b.movie_id;

select * ,
case when unit = "Thousands" then revenue/1000
	when unit = "Billions" then revenue*1000
						else revenue
					end as revenue_mn
from financials;

create table test_financials as
select * ,
case when unit = "Thousands" then revenue/1000
	when unit = "Billions" then revenue*1000
						else revenue
					end as revenue_mn
from financials;
	
Select * from test_financials;

select * ,
case when revenue_mn > 1000 then "High Revenue"
		else "Low Revenue"
        end as revenue_category
from test_financials;

select * ,
(revenue - budget ) as Profit
From test_financials;

select * from movies;

select rank() over(order by imdb_rating desc) as Ranking , title , imdb_rating
from movies;

select dense_rank() over(order by imdb_rating desc) as Ranking , title , imdb_rating
from movies
limit 5;

select dense_rank() over(partition by industry order by imdb_rating desc) as Ranking , title , imdb_rating , industry
from movies;

select m.* ,
row_number() over (partition by imdb_rating)as ER
from Movies m;

select * from movies
limit 30;

select * from movies
limit 30 offset 30;

select * from movies
order by movie_id
limit 10 offset 20;

select * from movies;

select imdb_rating,
ifnull (imdb_rating , "Unknowm") as imbd_rating
from movies;

