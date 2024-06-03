IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'Студенты'
)
BEGIN
    CREATE TABLE Студенты (
        Идентификатор INT PRIMARY KEY IDENTITY(1,1),
        Имя NVARCHAR(100) NOT NULL,
        Фамилия NVARCHAR(100) NOT NULL

    );
END;