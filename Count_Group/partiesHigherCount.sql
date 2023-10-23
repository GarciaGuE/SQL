SELECT P.fullName, COUNT(QD.party) "Count" FROM Parties AS P, Query_Data AS QD
WHERE P.partyID=QD.party
GROUP BY P.fullName
HAVING COUNT(QD.party)>10
ORDER BY COUNT(QD.party) ASC;