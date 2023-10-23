SET SERVEROUTPUT ON;
DECLARE
  CURSOR C IS SELECT * FROM Parties;
  myName Parties.president%type;
  middleName Parties.president%type;
  lastName Parties.president%type;
BEGIN
  FOR ROW IN C LOOP
    myName:=SUBSTR(ROW.president, 1, INSTR(ROW.president, ' ') - 1);
    middleName:=SUBSTR(ROW.president, INSTR(ROW.president, ' ') + 1, INSTR(ROW.president, ' ', 1, 2) - INSTR(ROW.president, ' ') - 1);
    lastName:=SUBSTR(ROW.president, INSTR(ROW.president, ' ', 1, 2) + 1, LENGTH(ROW.president) - INSTR(ROW.president, ' ', 1, 2));
    IF SUBSTR(myName, -1)='o'
        AND SUBSTR(middleName, -1)='o'
        AND SUBSTR(lastName, -1)='o'
    THEN
      DBMS_OUTPUT.PUT_LINE(ROW.president);
    END IF;
  END LOOP;
END;