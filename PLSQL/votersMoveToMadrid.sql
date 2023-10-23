SET SERVEROUTPUT ON;
DECLARE
  CURSOR C IS 
  SELECT V.fullName, DECODE(L.nameL, 'Cordoba', 'Madrid', 'Montilla', 'Madrid', 'Baena', 'Madrid', L.NOMBRE) "Cities" FROM Voters V, Localities L
  WHERE L.localityID=V.locality;
BEGIN 
 FOR I IN C LOOP
    DBMS_OUTPUT.PUT_LINE(I.fullName || ' is from ' || I.Cities);
 END LOOP;
END;
