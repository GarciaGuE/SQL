SET SERVEROUTPUT ON;
DECLARE
  myName Voters.fullfullName%TYPE;
  myEmail Voters.email%TYPE;
  myDni NUMBER:=30983712;
BEGIN
  SELECT fullfullName, email 
  INTO myName, myEmail 
  FROM Voters 
  WHERE dni=myDni;
  DBMS_OUTPUT.PUT_LINE(myName||' with email: '|| myEmail);
END;