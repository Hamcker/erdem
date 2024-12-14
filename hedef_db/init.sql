-- Create the database if it does not exist
CREATE DATABASE IF NOT EXISTS TestDB;

-- Use the newly created database
USE TestDB;

-- Create the table if it does not exist
CREATE TABLE IF NOT EXISTS TestTable (
    ID INT PRIMARY KEY,
    Name VARCHAR(50)
);

-- Insert dummy data into TestTable
INSERT INTO TestTable (ID, Name) VALUES (1, 'Alice');
INSERT INTO TestTable (ID, Name) VALUES (2, 'Bob');
INSERT INTO TestTable (ID, Name) VALUES (3, 'Charlie');
INSERT INTO TestTable (ID, Name) VALUES (4, 'Diana');
INSERT INTO TestTable (ID, Name) VALUES (5, 'Eve');
