SELECT L.nameL, SUB1.locality, SUB1.AVGL FROM Localities L, (
  SELECT locality, AVG(DECODE(
    higherEducation,
    'None', 1, 
    'Basic', 2, 
    'Higher', 3,
    'PhD', 4)
  ) AVGL
  FROM Voters V, Localities L
  WHERE V.locality=L.localityID
  GROUP BY locality
) SUB1
WHERE SUB1.locality=L.localityID
AND SUB1.AVGL>ALL(
  SELECT AVG(DECODE(
    higherEducation,
    'None', 1, 
    'Basic', 2,  
    'Higher', 3,
    'PhD', 4, -1)
  ) EducationP
  FROM Voters, Localities
  WHERE Voters.LOCALIDAD=Localities.localityID
  GROUP BY province
);

--sqlite3
/*
SELECT L.nameL, SUB1.locality, SUB1.AVGL
FROM Localities L
JOIN (
  SELECT locality, AVG(
    CASE
      WHEN higherEducation = 'None' THEN 1
      WHEN higherEducation = 'Basic' THEN 2
      WHEN higherEducation = 'Higher' THEN 3
      WHEN higherEducation = 'PhD' THEN 4
    END
  ) AS AVGL
  FROM Voters V
  JOIN Localities L2 ON V.locality = L2.localityID
  GROUP BY locality
) SUB1 ON SUB1.locality = L.localityID
WHERE SUB1.AVGL > (
  SELECT MAX(EducationP)
  FROM (
    SELECT L3.province, AVG(
      CASE
        WHEN higherEducation = 'None' THEN 1
        WHEN higherEducation = 'Basic' THEN 2
        WHEN higherEducation = 'Higher' THEN 3
        WHEN higherEducation = 'PhD' THEN 4
      END
    ) AS EducationP
    FROM Voters V
    JOIN Localities L3 ON V.locality = L3.localityID
    GROUP BY L3.province
  )
);
*/