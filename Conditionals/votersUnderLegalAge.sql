SELECT fullName, locality,
    CASE
        WHEN birthDate > '2005-01-01' THEN 'Underage'
        ELSE 'Legal Age'
    END AS "Is Legal Age"
FROM Voters
WHERE locality IN (2,4,8)
ORDER BY "Legal Age";

