SELECT Q.voter, V.fullName, COUNT(Q.voter) "Times" FROM Queries Q, Voters V
WHERE Q.voter=V.DNI AND V.birthDate!=(
    SELECT MIN(birthDate) FROM Voters 
    WHERE birthDate>(
        SELECT MIN(birthDate) FROM Voters
    )
)
GROUP BY Q.voter, V.fullName
ORDER BY "Times" DESC;
