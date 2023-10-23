SELECT V.fullName, AVG(QD.certainty) "AVG RANGE" FROM Voters V, Query_Data QD, Queries Q
WHERE V.dni=Q.voter AND Q.queryID=QD.query AND QD.response='Yes'
GROUP BY V.fullName
HAVING AVG(QD.certainty)>0.5 AND AVG(QD.certainty)<0.8;