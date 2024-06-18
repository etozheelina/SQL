-- Проверяем, существует ли таблица Направления, и если да, то удаляем её
IF OBJECT_ID('dbo.Направления', 'U') IS NOT NULL
    DROP TABLE dbo.Направления;
GO

-- Создаем таблицу Направления
CREATE TABLE Направления (
    [Код направления] INT PRIMARY KEY IDENTITY(1,1),
    Наименование VARCHAR(100),
    [Минимальный балл] INT
);
GO

-- Вставляем данные из таблицы Студенты в таблицу Направления 
INSERT INTO Направления (Наименование, [Минимальный балл])
SELECT DISTINCT 'История', 160
FROM Студенты
WHERE Направление = 'История'
UNION ALL
SELECT DISTINCT 'Право', 180
FROM Студенты
WHERE Направление = 'Право'
UNION ALL
SELECT DISTINCT 'Физика', 200
FROM Студенты
WHERE Направление = 'Физика';
GO

