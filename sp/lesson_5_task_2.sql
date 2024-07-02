CREATE TRIGGER TheSetIsOverTrigger
ON Студенты
AFTER INSERT, UPDATE
AS 
BEGIN
    UPDATE Направления
    SET [Набор окончен] = CASE
        WHEN (
            SELECT COUNT(*)
            FROM Студенты
            WHERE Студенты.Направление = Направления.Наименование
                AND Студенты.Балл >= (SELECT [Минимальный балл] FROM Направления WHERE Направления.Наименование = Студенты.Направление)
        ) >= [Всего мест] THEN 1
        ELSE 0
    END
    WHERE [Наименование] IN (
        SELECT DISTINCT I.Направление
        FROM INSERTED I
    );
END;