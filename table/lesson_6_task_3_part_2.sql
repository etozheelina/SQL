-- Добавление нового поля для идентификатора направления
IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'Студенты' AND COLUMN_NAME = 'КодНаправления'
)
BEGIN
    ALTER TABLE Студенты ADD КодНаправления INT;
END;
GO

-- Обновление поля "КодНаправления" в таблице "Студенты"
UPDATE S
SET S.КодНаправления = N.[Код направления]
FROM Студенты S
JOIN Направления N ON S.Направление = N.Наименование;
GO