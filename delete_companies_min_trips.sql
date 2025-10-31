-- Задача: удалить компании, которые совершили наименьшее количество рейсов
-- Представлены три варианта решения

-- Вариант 1: через CTE
WITH R AS (
    SELECT c.id, COUNT(*) AS count
    FROM Trip t
    JOIN Company c ON c.id = t.company
    GROUP BY c.id
)
DELETE FROM Company
WHERE id IN (
    SELECT id
    FROM R
    WHERE count = (SELECT MIN(count) FROM R)
);

-- Вариант 2: через CTE, используя только таблицу Trip
WITH R AS (
    SELECT company, COUNT(*) AS count
    FROM Trip
    GROUP BY company
)
DELETE FROM Company
WHERE id IN (
    SELECT company
    FROM R
    WHERE count = (SELECT MIN(count) FROM R)
);

-- Вариант 3: без CTE, с подзапросом в HAVING
DELETE FROM Company
WHERE id IN (
    SELECT company
    FROM Trip
    GROUP BY company
    HAVING COUNT(*) = (
        SELECT MIN(hot)
        FROM (
            SELECT COUNT(*) AS hot
            FROM Trip
            GROUP BY company
        ) AS sub
    )
);
