-- Задача: добавить отзыв с рейтингом 5 на жилье по адресу "11218, Friel Place, New York"
-- Отзыв оставляется от имени пользователя "George Clooney"
-- Первичный ключ (id) формируется как количество записей в таблице Reviews + 1
-- Предполагается, что резервация комнаты уже существует

INSERT INTO Reviews (id, reservation_id, rating)
SELECT 
    (SELECT COUNT(*) + 1 FROM Reviews),  -- новый id для таблицы Reviews
    r.id,                                -- id существующей резервации
    5                                     -- рейтинг
FROM Reservations r
JOIN Rooms rm ON r.room_id = rm.id       -- соединяем с комнатой по room_id
JOIN Users u ON r.user_id = u.id         -- соединяем с пользователем по user_id
WHERE rm.address = '11218, Friel Place, New York'
  AND u.name = 'George Clooney';
