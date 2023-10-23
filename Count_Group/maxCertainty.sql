SELECT P.fullName, MAX(QD.certainty) "MXCERT"  FROM Parties P, Query_Data QD
WHERE P.partyID=QD.party
GROUP BY P.fullName
ORDER BY MAX(QD.certainty) DESC;