SELECT nameL FROM Localities
WHERE populationL>(
    SELECT L.populationL FROM Localities L, Voters V
    WHERE L.localityID=V.locality AND V.birthDate=(
        SELECT MIN(birthDate) FROM Voters
        WHERE birthDate>(
            SELECT MIN(birthDate) FROM Voters
        )
    )
);