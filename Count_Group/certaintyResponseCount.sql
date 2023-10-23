SELECT P.fullName, COUNT(QD.party) "Count" FROM Parties P, Query_Data QD
WHERE P.partyID=QD.party AND QD.response='Yes' AND QD.certainty>'0.8'
GROUP BY P.fullName;