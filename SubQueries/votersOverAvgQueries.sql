SELECT Q.voter, V.fullName, COUNT(Q.voter) "Times" FROM Queries Q, Voters V
WHERE Q.voter=V.dni
GROUP BY Q.voter, V.fullName
HAVING COUNT(Q.voter)>(
    SELECT AVG(COUNT(voter)) FROM Queries GROUP BY voter
)
ORDER BY "Times" DESC;

--sqlite3
/*
SELECT Q.voter, V.fullName, COUNT(Q.voter) AS Times
FROM Queries Q
JOIN Voters V ON Q.voter = V.dni
GROUP BY Q.voter, V.fullName
HAVING Times > (SELECT AVG(Count) FROM (SELECT COUNT(voter) AS Count FROM Queries GROUP BY voter))
ORDER BY Times DESC;
*/