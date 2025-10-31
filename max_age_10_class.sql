-- Найти максимальный возраст среди учеников 10-х классов
SELECT MAX(TIMESTAMPDIFF(YEAR, birthday, NOW())) AS max_year
FROM Student
WHERE id IN (
    SELECT student
    FROM Student_in_class
    WHERE class IN (
        SELECT id
        FROM Class
        WHERE name LIKE '10%'
    )
);
