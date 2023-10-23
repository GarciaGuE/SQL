SELECT V.fullName, DECODE(L.nameL, 'Cordoba', 'Madrid', 'Montilla', 'Madrid', 'Baena', 'Madrid', L.nameL) "Name" FROM Voters V, Localities L
WHERE L.localityID=V.locality;

--sqlite3
/*SELECT V.fullName,
  CASE
    WHEN L.nameL IN ('Cordoba', 'Montilla', 'Baena') THEN 'Madrid'
    ELSE L.nameL
  END AS "Name"
FROM Voters V
INNER JOIN Localities L ON L.localityID = V.locality
ORDER BY "Name";
*/