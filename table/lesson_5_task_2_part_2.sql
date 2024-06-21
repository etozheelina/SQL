-- Создаем таблицу Направления, если она не существует
IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_NAME = 'Направления'
)
BEGIN
    CREATE TABLE Направления (
        [Код направления] INT PRIMARY KEY IDENTITY(1,1),
        Наименование VARCHAR(100),
        [Минимальный балл] INT
    );
END;
GO

-- Обновляем данные в таблице Направления, если они уже существуют
MERGE INTO Направления AS target
USING (
    SELECT 'История' AS Направление, 160 AS [Минимальный балл]
    UNION ALL
    SELECT 'Право', 180
    UNION ALL
    SELECT 'Физика', 200
) AS source
ON target.Наименование = source.Направление
WHEN MATCHED THEN 
    UPDATE SET target.[Минимальный балл] = source.[Минимальный балл]
WHEN NOT MATCHED THEN
    INSERT (Наименование, [Минимальный балл])
    VALUES (source.Направление, source.[Минимальный балл]);
GO

