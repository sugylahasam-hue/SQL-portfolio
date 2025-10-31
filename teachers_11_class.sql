-- Задача: вывести идентификаторы преподавателей, 
-- которые хотя бы один раз преподавали в каждом из 11-х классов

SELECT Schedule.teacher
FROM Schedule
-- Соединяем с таблицей Class, чтобы получить названия классов
JOIN Class ON Class.id = Schedule.class
-- Берем только 11-е классы
WHERE Class.name LIKE '11%'
GROUP BY Schedule.teacher
-- Оставляем только тех учителей, которые преподавали во всех 11-х классах
HAVING COUNT(DISTINCT Class.id) = (
    SELECT COUNT(*) 
    FROM Class 
    WHERE name LIKE '11%'
);
