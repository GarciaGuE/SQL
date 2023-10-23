SELECT fullName, dni, locality FROM Voters
WHERE SUBSTR(dni,-1,1)=locality+1;
-- sqlite3
--SELECT fullName, dni, locality FROM Voters
--WHERE SUBSTR(dni, -1, 1) = CAST(locality + 1 AS TEXT);

--Alternative
SELECT fullName, dni, locality FROM Voters
WHERE SUBSTR(dni, LENGTH(dni)-LENGTH(locality)+1)=locality+1;
-- sqlite3
--SELECT fullName, dni, locality FROM Voters
--WHERE SUBSTR(dni, LENGTH(dni) - LENGTH(locality) + 1) = CAST(locality + 1 AS TEXT);