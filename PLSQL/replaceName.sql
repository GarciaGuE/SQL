SET SERVEROUTPUT ON;
DECLARE
  myName Voters.fullName%TYPE;
BEGIN
  SELECT REPLACE(fullName, 'Jose', 'Pepe')
  INTO myName 
  FROM Voters
  WHERE dni=30983712;
  DBMS_OUTPUT.PUT_LINE(myName);
END;