-- head of table --
drop table if EXISTS fastfood;

create table if not EXISTS fastfood (
    item_id serial PRIMARY key,
    restaurant VARCHAR(50),
    item_name VARCHAR(500),
    calories int,
    protein int,
    fats int,
    sodium int,
    sugars int,
    cholesterol int,
    price FLOAT,
    carbs int,
    fiber int,
    item_type VARCHAR(50)
);

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'fastfood';

/copy fastfood(item_id, restaurant, item_name, calories, protein, fats, sodium, sugars, cholesterol, price, carbs, fiber, item_type)
from '/tmp/fastfood.csv'
DELIMITER ','
csv header;

select * from fastfood;

select * from fastfood
limit 10;

select * from fastfood
where item_type = 'Drink' and
not restaurant = 'Starbucks'
limit 10;

select * from fastfood
where item_type = 'Side'
order by price asc
limit 10;

select * from fastfood
where item_name like '%Small%'

select restaurant, percentile_cont(0.5) within group (ORDER BY calories) as median from fastfood
group by restaurant
order by median desc;

select * from fastfood
order by fats desc;

select restaurant, item_name, item_type from fastfood
where protein >= 20 or
fats <= 23
order by item_type asc;

select restaurant, item_name, item_type, protein, price from fastfood
where protein >= 30 and price <= 10
order by price desc;

select restaurant, count(restaurant) as restaurantCount from fastfood
where sugars < 15
group by restaurant
order by restaurantCount desc;
-- trying to see how many times a restaurant is in a specific cluster --

select * from fastfood

select item_name, item_type, restaurant, calories, protein, price, (price / protein) as PPratio from fastfood
where protein > 10
order by PPratio desc;
-- average protein to price ratio --
select item_name, item_type, restaurant, calories, protein, price, (price / protein) as ppratio from fastfood
where protein > 0 and price > 5.00 and not item_type = 'Drink'
order by ppratio desc;

select restaurant, avg(price / protein) as averageRatio from fastfood
where protein > 0
group by restaurant
order by averageRatio desc;

select item_type, restaurant, avg(calories) as averageCalories from fastfood
group by item_type, restaurant
order by averageCalories desc;

-- notes for next query : average calories = 430 & average sugars = 5
select * from fastfood
where calories < 430 and sugars > 5
order by sugars desc;

select item_id, item_name, restaurant, protein, price from fastfood
where protein > 25
order by price asc
limit 20;

select * from fastfood
where restaurant = 'Starbucks'
order by protein desc;

select item_name, item_type, restaurant, sugars, price from (select *, ROW_NUMBER()
over (PARTITION BY restaurant
order by price asc) as rn from fastfood where sugars > 5) ranked
where rn <= 1;

select * from fastfood
order by sodium desc;
-- to do this sort of query, need to use window functions; watch video on it later --
select * from (select *, ROW_NUMBER() 
over (PARTITION BY restaurant 
order by sodium desc) as rn from fastfood) ranked
where rn <= 1;

select restaurant, protein, fats, item_name from fastfood
where protein > 18 and fats < 21
-- query notes : average protein = 18 & fats = 21

select * from fastfood
where restaurant = 'Taco Bell'
order by fats asc;