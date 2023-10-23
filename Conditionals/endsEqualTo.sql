SELECT L.nameL "Locality", P.nameP "Province" FROM Localities L, Provinces P
WHERE L.province=P.provinceID AND SUBSTR(L.populationL,-1,1)=SUBSTR(P.provinceID,-1,1);