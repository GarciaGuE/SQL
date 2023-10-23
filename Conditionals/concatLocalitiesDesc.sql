SELECT CONCAT(CONCAT(A.nameL, ' comes before '), B.nameL) FROM Localities A, Localities B
WHERE A.localityID=B.localityID-1;

--sqlite3
-- SELECT A.nameL || ' comes before ' || B.nameL
-- FROM Localities A
-- JOIN Localities B ON A.localityID = B.localityID - 1;
