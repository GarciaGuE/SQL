SET SERVEROUTPUT ON;
DECLARE
  CURSOR voter IS
  SELECT V.dni,V.fullName, V.locality FROM Voters V;
  COUNTER NUMBER:=0;
BEGIN
 FOR I IN voter LOOP
    IF SUBSTR(I.dni,LENGTH(I.dni),LENGTH(I.dni))=I.locality+1 
    THEN
        DBMS_OUTPUT.PUT_LINE(I.fullName);
        COUNTER:=COUNTER+1;
    END IF;
 END LOOP;
  DBMS_OUTPUT.PUT_LINE('There is a total of ' || COUNTER || ' Voters');
END;