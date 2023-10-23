SELECT DISTINCT V.fullName, V.dni FROM Voters V, Queries Q
WHERE V.dni=Q.voter
ORDER BY V.dni DESC;