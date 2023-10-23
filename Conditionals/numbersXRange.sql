SELECT dni, phone FROM Voters
WHERE phone LIKE '%6%6%' AND phone NOT LIKE '%6%6%6%6%' ;