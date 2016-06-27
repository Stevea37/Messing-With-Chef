USE master;
GO

-- Go create learnchef database
CREATE DATABASE learnchef;
GO
USE learnchef;
GO
-- Create the customers table
CREATE TABLE customers(
        id uniqueidentifier NOT NULL DEFAULT newid(),
        PRIMARY KEY(id),
        first_name VARCHAR(64),
        last_name VARCHAR(64),
        email VARCHAR(64)   
);
GO
-- Add sample information
INSERT INTO customers(id, first_name, last_name, email) VALUES(newid(), 'Steven', 'Ayers', 'steven.ayers@learnchef.com');
INSERT INTO customers(id, first_name, last_name, email) VALUES(newid(), 'Sophie', 'Williams', 'Sophie.Williams@learnchef.com');
INSERT INTO customers(id, first_name, last_name, email) VALUES(newid(), 'Dilan', 'Shah', 'Dilan.Shah@learnchef.com');
GO
