SELECT L.nameL, SUB.locality, AVG(Education) Average FROM (
  SELECT fullName, higherEducation, locality, DECODE(
      higherEducation,
      'None', 1, 
      'Basic', 2, 
      'Higher', 3,
      'PhD', 4
    ) Education FROM Voters
) SUB, Localities L
WHERE SUB.locality=L.localityID 
GROUP BY L.nameL, SUB.locality
ORDER BY Average DESC;

--sqlite3
/*
SELECT L.nameL, SUB.locality, AVG(Education) AS Average
FROM (
  SELECT fullName, higherEducation, locality, 
    CASE
      WHEN higherEducation = 'None' THEN 1
      WHEN higherEducation = 'Basic' THEN 2
      WHEN higherEducation = 'Higher' THEN 3
      WHEN higherEducation = 'PhD' THEN 4
    END AS Education
  FROM Voters
) SUB
JOIN Localities L ON SUB.locality = L.localityID
GROUP BY L.nameL, SUB.locality
ORDER BY Average DESC;
*/