SELECT fullName, birthDate FROM Voters
WHERE fullName LIKE '%S%' AND birthDate<'2/12/1990' OR fullName LIKE '%s%' AND birthDate<'2/12/1990';

--sqlite3
-- SELECT fullName, birthDate FROM Voters
-- WHERE fullName LIKE '%S%' AND birthDate<'1990-12-2' OR fullName LIKE '%s%' AND birthDate<'1990-12-2';
