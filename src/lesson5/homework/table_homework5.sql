-- 1. Вывести продукты количество которых в продаже меньше
-- самого малого среднего количества продуктов в деталях заказов
-- (группировка по product_id).
-- Результирующая таблица должна иметь колонки product_name и units_in_stock.
SELECT
    AVG(quantity)
FROM order_details
GROUP BY product_id;

SELECT
    p.product_name,
    p.units_in_stock
FROM products AS p
JOIN order_details AS od
    USING(product_id)
WHERE units_in_stock < ALL (
                             SELECT
                                AVG(quantity)
                              FROM order_details
                              GROUP BY od.product_id
                            )
ORDER BY units_in_stock DESC;

-- 2. Напишите запрос, который выводит общую сумму фрахтов заказов
-- для компаний-заказчиков для заказов,
-- стоимость фрахта которых больше
-- или равна средней величине стоимости фрахта всех заказов,
-- а также дата отгрузки заказа должна находится
-- во второй половине июля 1996 года.
-- Результирующая таблица должна иметь колонки customer_id и freight_sum,
-- строки которой должны быть отсортированы по сумме фрахтов заказов.
SELECT
    customer_id,
    AVG(freight)
FROM orders
GROUP BY customer_id;

SELECT
    customer_id,
    SUM(freight)
FROM orders AS o
JOIN (
       SELECT
          customer_id,
          AVG(freight) AS freight_avg
       FROM orders
       GROUP BY customer_id
     ) AS foo
     USING(customer_id)
WHERE freight > freight_avg
    AND shipped_date BETWEEN '1996-07-15' AND '1996-07-31'
GROUP BY customer_id
ORDER BY SUM(freight);

-- 3. Напишите запрос, который выводит 3 заказа с наибольшей стоимостью,
-- которые были созданы после 1 сентября 1997 года включительно
-- и были доставлены в страны Южной Америки.
-- Общая стоимость рассчитывается как сумма стоимости деталей заказа
-- с учетом дисконта. Результирующая таблица должна иметь колонки
-- customer_id, ship_country и order_price,
-- строки которой должны быть отсортированы по стоимости заказа
-- в обратном порядке.


SELECT
    o.customer_id,
    o.ship_country,
    order_price
FROM orders AS o
JOIN (
       SELECT
         order_id,
         SUM(od.unit_price * od.quantity - od.unit_price * od.quantity * od.discount) AS order_price
       FROM order_details AS od
       GROUP BY order_id
        ) AS sub
    USING(order_id)
WHERE ship_country IN ('Argentina', 'Bolivia', 'Brazil', 'Chile',
                      'Colombia', 'Ecuador', 'Guyana', 'Paraguay',
                      'Peru', 'Suriname', 'Uruguay', 'Venezuela')
    AND order_date >= '1997-09-01'
ORDER BY order_price DESC
LIMIT 3;

-- 4. Вывести все товары (уникальные названия продуктов),
-- которых заказано ровно 10 единиц
-- (конечно же, это можно решить и без подзапроса).
SELECT DISTINCT
    p.product_name,
    od.quantity
FROM products AS p
JOIN order_details AS od
    USING(product_id)
WHERE quantity = 10;