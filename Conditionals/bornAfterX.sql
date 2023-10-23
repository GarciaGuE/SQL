-- In some cases Dates have different formats, 
--so it is important to know the format of the date 
--you are working with.
SELECT fullName, birthDate FROM Voters
WHERE birthDate > '1/01/1990';

/*sqlite3
SELECT fullName, birthDate FROM Voters
WHERE birthDate > '1990-1-1';
*/
