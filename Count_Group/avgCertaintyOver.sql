SELECT P.fullName, AVG(QD.certainty) "AVG Certainty NO" FROM Parties P, Query_data QD
WHERE P.partyID=QD.party AND QD.response='No'
GROUP BY P.fullName
HAVING AVG(QD.certainty)>0.6;