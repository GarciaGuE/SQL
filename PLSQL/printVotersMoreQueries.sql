SET SERVEROUTPUT ON;
DECLARE
  CURSOR C IS
  SELECT voter, COUNT(voter) Times FROM Queries
  GROUP BY voter
  ORDER BY Times DESC;
  Average FLOAT;
BEGIN
  SELECT AVG(COUNT(voter)) INTO Average FROM Queries 
  GROUP BY voter;
  FOR AROV IN C LOOP
    IF AROV.Times>Average THEN
    DBMS_OUTPUT.PUT_LINE(AROV.voter || ' has participated ' || AROV.Times || ' times.');
    END IF;
  END LOOP;
END;
