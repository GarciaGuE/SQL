SELECT fullName, dni, birthDate FROM Voters
WHERE birthDate=(
    SELECT MIN(birthDate) FROM Voters 
    WHERE birthDate>(
        SELECT MIN(birthDate) FROM Voters
    )
);