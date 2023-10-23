SELECT Q.voter, V.fullName, COUNT(Q.voter) "Count Votes" FROM Queries Q, Voters V
WHERE Q.voter=V.dni
GROUP BY Q.voter, V.fullName
HAVING COUNT(Q.voter)>3;