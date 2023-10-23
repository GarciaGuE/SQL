SELECT P.abbreviation, COUNT(ER.party) FROM Parties P, Event_Results ER
WHERE P.partyID=ER.party
GROUP BY P.abbreviation
HAVING COUNT(ER.party)=(
    SELECT MAX(COUNT(party)) FROM Event_Results
    GROUP BY party
);

--sqlite3
/*
SELECT P.abbreviation, COUNT(ER.party) AS PartyCount
FROM Parties P
JOIN Event_Results ER ON P.partyID = ER.party
GROUP BY P.abbreviation
HAVING COUNT(ER.party) = (
    SELECT MAX(PartyCount)
    FROM (
        SELECT COUNT(party) AS PartyCount
        FROM Event_Results
        GROUP BY party
    )
);
*/
