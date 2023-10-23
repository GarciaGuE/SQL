SELECT V.fullName, V.employmentStatus, COUNT(Q.voter) AS "Times" FROM Queries Q, Voters V
WHERE Q.voter=V.dni AND V.employmentStatus='Employed'
GROUP BY V.fullName, V.employmentStatus
HAVING COUNT(Q.voter)<(
    SELECT AVG(COUNT(voter)) FROM Queries
    GROUP BY voter
)
ORDER BY "Times" DESC;

--sqlite3
/*
SELECT V.fullName, V.employmentStatus, COUNT(Q.voter) AS "Times" 
FROM Queries Q
JOIN Voters V ON Q.voter = V.dni
WHERE V.employmentStatus = 'Employed'
GROUP BY V.fullName, V.employmentStatus
HAVING COUNT(Q.voter) < (
    SELECT AVG(Count)
    FROM (SELECT COUNT(voter) AS Count FROM Queries GROUP BY voter)
)
ORDER BY "Times" DESC;
*/