IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'Студенты' AND COLUMN_NAME = 'Направление'
)
BEGIN 
    ALTER TABLE Студенты 
    ADD [Направление] VARCHAR(100);
END;