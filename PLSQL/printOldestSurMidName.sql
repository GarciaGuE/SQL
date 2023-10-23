SET SERVEROUTPUT ON;
DECLARE
  dni Voters.dni%TYPE;
  name Voters.fullName%TYPE;
  surname Voters.fullName%TYPE;
  middleName VARCHAR(50);
BEGIN
  SELECT V.dni, V.fullName
  INTO dni, name
  FROM Voters V
  WHERE V.birthDate=(
    SELECT MIN(birthDate) FROM Voters
  );
  surname:=SUBSTR(name, INSTR(name, ' ')+1);
  middleName:=SUBSTR(surname, 1, INSTR(surname, ' ')-1);
  DBMS_OUTPUT.PUT_LINE(middleName || ', with dni ' || dni || ' is the oldest voter.');
END;