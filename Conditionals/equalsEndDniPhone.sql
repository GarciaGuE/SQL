SELECT fullName, dni, phone FROM Voters
WHERE SUBSTR(DNI,-1,1)=SUBSTR(phone,-1,1);