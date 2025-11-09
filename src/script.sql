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

