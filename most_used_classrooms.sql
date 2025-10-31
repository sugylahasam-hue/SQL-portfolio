-- Задача: найти кабинеты, которые использовались чаще всего для занятий
-- Используем GROUP BY и HAVING, чтобы выбрать максимальное количество использований

-- Вариант без CTE
SELECT classroom
FROM Schedule
GROUP BY classroom
HAVING COUNT(*) = (
    SELECT MAX(cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM Schedule
        GROUP BY classroom
    ) AS sub
);

-- Вариант с CTE (для удобочитаемости)
WITH ClassCount AS (
    SELECT classroom, COUNT(*) AS cnt
    FROM Schedule
    GROUP BY classroom
)
SELECT classroom
FROM ClassCount
WHERE cnt = (SELECT MAX(cnt) FROM ClassCount);
