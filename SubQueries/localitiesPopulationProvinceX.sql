SELECT L.nameL, L.populationL, P.community FROM Localities L, Provinces P
WHERE P.provinceID=L.province AND P.provinceID IN (1,2,3) AND L.populationL>(
    SELECT MIN(populationL) FROM Localities
    WHERE province='4'
);