SELECT Q.voter, V.fullName, COUNT(Q.voter) "Times" FROM Queries Q, Voters V
WHERE Q.voter=V.dni
GROUP BY Q.voter, V.fullName
ORDER BY "Times" DESC;
