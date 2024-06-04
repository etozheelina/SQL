IF NOT EXISTS (SELECT 1 FROM Студенты)
BEGIN
    BEGIN TRANSACTION;

    SET IDENTITY_INSERT Студенты ON;

    INSERT INTO Студенты (Идентификатор, Имя, Фамилия, Балл, Направление)
    VALUES 
        (1, 'Иван', 'Бунша', 220, 'История'),
        (2, 'Остап', 'Бендер', 170, 'Право'),
        (3, 'Александр', 'Тимофеев', 300, 'Физика');

    SET IDENTITY_INSERT Студенты OFF;
    COMMIT TRANSACTION;
    PRINT 'Данные добавлены в таблицу'

END
ELSE
BEGIN
    PRINT 'Таблица Студенты уже содержит данные'
END