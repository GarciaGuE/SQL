SET SERVEROUTPUT ON;
DECLARE
  TYPE hashTable IS TABLE OF FLOAT INDEX BY VARCHAR2(100);
  myTable hashTable;
  KEY VARCHAR2(100);
  CURSOR results IS 
  SELECT fullName, result FROM Parties P, Event_Results E
  WHERE P.partyID=E.party;
BEGIN
  FOR I IN results LOOP
    IF NOT myTable.EXISTS(I.fullName) THEN
      myTable(I.fullName):=I.result;
    ELSE
      myTable(I.fullName):=myTable(I.fullName)+I.result;
    END IF;
  END LOOP;
  KEY:=myTable.FIRST;
  WHILE KEY IS NOT NULL LOOP
    DBMS_OUTPUT.PUT_LINE(KEY || ' => ' || myTable(KEY));
    KEY:=myTable.NEXT(KEY);
  END LOOP;
END;