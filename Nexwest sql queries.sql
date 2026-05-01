Create database nexmart;
use nexmart;
CREATE TABLE nexmart (
    `Order ID`      VARCHAR(20),
    `Order Date`    VARCHAR(15),
    `Ship Date`     VARCHAR(15),
    `Customer ID`   VARCHAR(20),
    Region          VARCHAR(20),
    Category        VARCHAR(30),
    `Sub-Category`  VARCHAR(30),
    Sales           DECIMAL(10, 4),
    Profit          DECIMAL(10, 4)
);
 SELECT * FROM nexmart LIMIT 5;
 
 #Top 10 products By revenue- 
SELECT
    `Sub-Category`,
    COUNT(*)                                        AS total_orders,
    ROUND(SUM(Sales), 2)                            AS total_revenue,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2)       AS profit_margin
FROM nexmart
GROUP BY `Sub-Category`
ORDER BY total_revenue DESC
LIMIT 10;

#Regional Performance — Regions Above $100K Revenue
SELECT
    Region,
    ROUND(SUM(Sales), 2)                            AS total_revenue,
    COUNT(DISTINCT `Customer ID`)                   AS unique_customers,
    ROUND(AVG(Sales), 2)                            AS avg_order_value,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2)       AS profit_margin_pct
FROM nexmart
GROUP BY Region
HAVING SUM(Sales) > 100000
ORDER BY total_revenue DESC;

#Top 10 Customers by Lifetime Value
SELECT
    `Customer ID`,
    COUNT(*)                                        AS total_orders,
    ROUND(SUM(Sales), 2)                            AS lifetime_value,
    ROUND(AVG(Sales), 2)                            AS avg_order_value,
    MAX(`Order Date`)                               AS last_order_date
FROM nexmart
GROUP BY `Customer ID`
ORDER BY lifetime_value DESC
LIMIT 10;

#Calculate MoM growth using window functions
WITH monthly_revenue AS (
    SELECT
        DATE_FORMAT(
            STR_TO_DATE(`Order Date`, '%d-%m-%Y'),
            '%Y-%m'
        )                                           AS yr_month,
        ROUND(SUM(Sales), 2)                        AS monthly_revenue
    FROM nexmart
    GROUP BY yr_month
)
SELECT
    yr_month,
    monthly_revenue,
    LAG(monthly_revenue) OVER (ORDER BY yr_month)  AS prev_month_revenue,
    ROUND(
        100.0
        * (monthly_revenue - LAG(monthly_revenue) OVER (ORDER BY yr_month))
        / LAG(monthly_revenue) OVER (ORDER BY yr_month),
        2
    )                                               AS growth_pct
FROM monthly_revenue
ORDER BY yr_month DESC
LIMIT 24;

#Top Performers by Category (Window Functions)

WITH ranked_categories AS (
    SELECT
        Category,
        `Sub-Category`,
        ROUND(SUM(Sales), 2)                        AS total_revenue,
        ROUND(SUM(Profit) / SUM(Sales) * 100, 2)   AS profit_margin_pct,
        ROW_NUMBER() OVER (
            PARTITION BY Category
            ORDER BY SUM(Sales) DESC
        )                                           AS rnk
    FROM nexmart
    GROUP BY Category, `Sub-Category`
)
SELECT
    Category,
    `Sub-Category`          AS top_sub_category,
    total_revenue,
    profit_margin_pct
FROM ranked_categories
WHERE rnk = 1
ORDER BY total_revenue DESC;

#Overall KPI'S Summary
SELECT
    COUNT(*)                                        AS total_orders,
    COUNT(DISTINCT `Customer ID`)                   AS total_customers,
    COUNT(DISTINCT `Order ID`)                      AS unique_orders,
    ROUND(SUM(Sales), 0)                            AS total_revenue,
    ROUND(SUM(Profit), 0)                           AS total_profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 1)       AS overall_margin_pct
FROM nexmart;