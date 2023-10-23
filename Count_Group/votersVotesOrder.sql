SELECT V.fullName, COUNT(Q.voter) "Count Veces ASC" FROM Voters V, Queries Q 
WHERE V.dni=Q.voter
GROUP BY V.fullName
HAVING COUNT(Q.voter)>3
ORDER BY COUNT(Q.voter) ASC;