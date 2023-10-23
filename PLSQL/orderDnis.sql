SET SERVEROUTPUT ON;
DECLARE
  CURSOR DNIS IS 
  SELECT dni FROM Voters ORDER BY dni DESC;
  prevDni Voters.dni%TYPE;
BEGIN
  FOR aDni IN DNIS LOOP
    IF dniS%ROWCOUNT>1 THEN
      DBMS_OUTPUT.PUT_LINE(prevDni|| ' comes before ' ||aDni.dni);
    END IF;
      prevDni:=aDni.dni;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('The smallest one is: ' || prevDni);
END;