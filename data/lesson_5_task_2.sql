UPDATE Направления
SET [Всего мест] = CASE 
    WHEN [Код направления] = 1 THEN 2
    WHEN [Код направления] = 2 THEN 2
    WHEN [Код направления] = 3 THEN 1
    ELSE [Всего мест]
END;