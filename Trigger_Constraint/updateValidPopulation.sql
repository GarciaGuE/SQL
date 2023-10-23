SET SERVEROUTPUT ON; --Delete this line if you are using sqlite3
CREATE OR REPLACE TRIGGER ValidPopulation
BEFORE UPDATE ON Localities FOR EACH ROW
BEGIN
  IF :NEW.populationL<1 OR :NEW.populationL>40000000 THEN
    :NEW.populationL:=:OLD.populationL;
  END IF;
END;

--sqlite3
/*
CREATE TRIGGER ValidPopulation
BEFORE UPDATE ON Localities FOR EACH ROW
WHEN (NEW.populationL < 1 OR NEW.populationL > 40000000)
BEGIN
  SELECT RAISE(IGNORE);
END;
*/

UPDATE Localities SET populationL=0 WHERE localityID=1;