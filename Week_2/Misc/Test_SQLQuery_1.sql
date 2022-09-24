SELECT n.pizza_id, n.pizza_name, r.toppings 
FROM pizza_names n
LEFT JOIN pizza_recipes r
ON n.pizza_id = r.pizza_id
-- SELECT * FROM pizza_toppings
-- Creating CTE for recipes and toppings
WITH pizza_recipes_temp AS(
    SELECT r.pizza_id, 
           STRING_SPLIT(r.toppings, ',') AS topping_id) 
    FROM pizza_recipes r
)


SELECT pizza_id,TRIM([value]) AS toppings_id
FROM pizza_recipes
CROSS APPLY STRING_SPLIT(toppings,',')

select TYPE_NAME(exclusions)
FROM customer_orders