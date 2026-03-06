-- duplicate all TABLEs
-- to preserve original dataset

CREATE TABLE IF NOT EXISTS encounters0
AS 
SELECT * FROM encounters;

CREATE TABLE IF NOT EXISTS patients0 
as
select * from patients;

CREATE TABLE IF NOT EXISTS payers0
as 
select * from payers;

CREATE TABLE IF NOT EXISTS procedures0
as 
select * from procedures;


