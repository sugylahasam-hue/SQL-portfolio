-- Задача: найти средний возраст клиентов, купивших Smartwatch в 2024 году

SELECT AVG(c.age) AS average_age
FROM Customer c
-- Соединяем таблицы Customer и Purchase по ключу клиента
JOIN Purchase p ON c.customer_key = p.customer_key
-- Соединяем таблицы Purchase и Product по ключу продукта
JOIN Product pr ON p.product_key = pr.product_key
-- Берем только покупки Smartwatch в 2024 году
WHERE pr.name = 'Smartwatch'
  AND YEAR(p.date) = 2024;
