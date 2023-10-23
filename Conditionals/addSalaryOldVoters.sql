DROP TABLE oldVoters;
CREATE TABLE oldVoters AS SELECT * FROM Voters WHERE birthDate<'1/1/1980';
ALTER TABLE oldVoters ADD salary NUMBER(10) DEFAULT 0;
UPDATE oldVoters
SET salary=1500
WHERE employmentStatus='Employed';


--sqlite3
/*
DROP TABLE oldVoters;
CREATE TABLE oldVoters AS SELECT * FROM Voters WHERE birthDate<'1980-1-1';
ALTER TABLE oldVoters ADD salary NUMBER(10) DEFAULT 0;
UPDATE oldVoters
SET salary=1500
WHERE employmentStatus='Employed';
*/