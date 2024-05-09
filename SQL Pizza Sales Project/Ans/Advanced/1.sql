-- Calculate the percentage contribution of each pizza type to total revenue.

SELECT 
    pizza_types.category,
    ROUND(SUM(orders_details.quantity * pizzas.price) / total_sales * 100, 2) AS revenue_percentage
FROM 
    pizza_types 
JOIN 
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_id
JOIN 
    orders_details ON orders_details.pizza_id = pizzas.pizza_id
JOIN (
    SELECT 
        ROUND(SUM(orders_details.quantity * pizzas.price), 2) AS total_sales
    FROM 
        orders_details 
    JOIN 
        pizzas ON pizzas.pizza_id = orders_details.pizza_id
) AS total_sales_table
GROUP BY 
    pizza_types.category, total_sales
ORDER BY 
    revenue_percentage DESC;




