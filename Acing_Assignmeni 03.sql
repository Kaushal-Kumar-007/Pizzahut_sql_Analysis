create database pizzahut;
use pizzahut;
select size, sum(price) as " category wise price " 
 from pizzas group by size having sum(price) > 400 order by sum(price) desc ;
 select category, count(category) as "total count of pizza category"  from pizza_types group by category;
 create table orders(
 Order_ID int not null,
 Order_date date not null,
 Order_time time not null,
 primary key(Order_ID));
 select * from orders limit 4;
 
 create table order_details (
 order_details_id int not null,
 order_id int not null,
 pizza_id text not null,
 quantity int not null,
 primary key(order_details_id) );
 select * from order_details;
 
 SELECT * FROM pizzahut.orders;
-- select 'order count' as "Total number of order", 
-- count(Order_ID) as "total number of orders" from orders;

SELECT * FROM pizzahut.order_details;
-- Calculate the total revenue generated from pizza sales. 
-- SELECT 
--     ROUND(SUM(od.quantity * p.price), 2) AS 'Total revenue generated'
-- FROM
--     order_details AS od
--         INNER JOIN
--     pizzas AS p ON (od.pizza_id = p.pizza_id);
-- Identify the highest-priced pizza.

SELECT * FROM pizzahut.pizzas;
-- Identify the highest-priced pizza.
-- SELECT max(PRICE) AS "hIGHEST pRICE" from pizzas; 
-- select pizza_types.name as "pizza name", pizzas.price as "Highest Price"
-- from pizza_types inner join pizzas on pizza_types.pizza_type_id = pizzas.pizza_type_id
-- order by pizzas.price desc limit 1;
-- select pizza_types.name as "Pizza_name", max(pizzas.price) as "max price per pizza name" from 
-- pizza_types inner join pizzas on pizza_types.pizza_type_id = pizzas.pizza_type_id
-- group by pizza_types.name order by max(pizzas.price) desc limit 1;

-- select pt.name as "Pizza_name", p.price as "maximum price" from pizza_types as pt inner join pizzas as p 
-- on pt.pizza_type_id=p.pizza_type_id where p.price = (select max(price) from pizzas);

# Identify the most common pizza size ordered.
-- SELECT 
--     pizzas.size AS 'Pizza size',
--     COUNT(pizzas.size) AS ' Count of Pizza per pizza size'
-- FROM
--     pizzas
--         INNER JOIN
--     order_details ON pizzas.pizza_id = order_details.pizza_id
-- GROUP BY pizzas.size
-- ORDER BY COUNT(pizzas.size) DESC;

# List the top 5 most ordered pizza types 
# along with their quantities.

-- SELECT 
--     pizza_types.name, SUM(order_details.quantity) AS quantity
-- FROM
--     pizza_types
--         JOIN
--     pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
--         JOIN
--     order_details ON order_details.pizza_id = pizzas.pizza_id
-- GROUP BY pizza_types.name
-- ORDER BY quantity DESC
-- LIMIT 5;

# Join the necessary tables to find the total quantity 
# of each pizza category ordered.

-- SELECT 
--     pizza_types.category,
--     SUM(order_details.quantity) AS quantity
-- FROM
--     pizza_types
--         JOIN
--     pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
--         JOIN
--     order_details ON order_details.pizza_id = pizzas.pizza_id
-- GROUP BY pizza_types.category
-- ORDER BY quantity DESC;

# Determine the distribution of orders by hour of the day.
-- SELECT 
--     HOUR(Order_time), COUNT(order_id)
-- FROM
--     orders
-- GROUP BY HOUR(Order_time);

# Join relevant tables to find the category-wise 
# distribution of pizzas.
select category, count(name) from pizza_types group by category;



-- Group the orders by date and calculate the average number 
-- of pizzas ordered per day.
-- SELECT 
--     ROUND(AVG(quantity), 0) AS 'average order per day'
-- FROM
--     (SELECT 
--         orders.Order_date, SUM(order_details.quantity) AS quantity
--     FROM
--         orders
--     JOIN order_details ON orders.Order_ID = order_details.order_id
--     GROUP BY orders.Order_date) AS order_quantity;


-- Determine the top 3 most ordered 
-- pizza types based on revenue.

-- SELECT 
--     pizza_types.name,
--     SUM(order_details.quantity * pizzas.price) AS revenue
-- FROM
--     pizza_types
--         JOIN
--     pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
--         JOIN
--     order_details ON order_details.pizza_id = pizzas.pizza_id
-- GROUP BY pizza_types.name
-- ORDER BY revenue DESC
-- LIMIT 3;

-- Calculate the percentage contribution of 
-- each pizza type to total revenue.

-- SELECT 
--     pizza_types.category,
--     ROUND(SUM(order_details.quantity * pizzas.price) / (SELECT 
--                     ROUND(SUM(order_details.quantity * pizzas.price),
--                                 2) AS total_sales
--                 FROM
--                     order_details
--                         JOIN
--                     pizzas ON pizzas.pizza_id = order_details.pizza_id) * 100,
--             2) AS revenue
-- FROM
--     pizza_types
--         JOIN
--     pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
--         JOIN
--     order_details ON order_details.pizza_id = pizzas.pizza_id
-- GROUP BY pizza_types.category
-- ORDER BY revenue DESC; 

-- Analyze the cumulative revenue generated over time.

-- select order_date, 
-- sum(revenue) over(order by order_date) as cum_revenue
-- from
-- (select orders.order_date, sum(order_details.quantity*pizzas.price) as revenue
-- from order_details join pizzas on
-- order_details.pizza_id = pizzas.pizza_id join orders
-- on orders.Order_ID = order_details.order_id
-- group by orders.Order_date) as sales ;

-- Determine the top 3 most ordered pizza types based 
-- on revenue for each pizza category.

-- select name, revenue from 
-- (select category, name, revenue, rank() over(partition by category
-- order by revenue desc ) as rn
-- from 
-- (select pizza_types.category, pizza_types.name,
-- sum((order_details.quantity)* pizzas.price) as revenue from
-- pizza_types join pizzas on
-- pizza_types.pizza_type_id = pizzas.pizza_type_id join
-- order_details on order_details.pizza_id = pizzas.pizza_id
-- group by pizza_types.category, pizza_types.name) as a ) as b
-- where rn <= 3;


SELECT * FROM pizzahut.orders;
-- select 'order count' as "Total number of order", 
-- count(Order_ID) as "total number of orders" from orders;