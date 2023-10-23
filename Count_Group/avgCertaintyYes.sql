SELECT V.fullName, AVG(QD.certainty) "AVGCert Yes" FROM Voters V, Query_Data QD, Queries Q
WHERE V.dni=Q.voter AND Q.queryID=QD.query AND QD.response='Yes'
GROUP BY V.fullName;