SET SERVEROUTPUT ON;--Delete this line if you are using sqlite3
CREATE OR REPLACE TRIGGER ValidDate
BEFORE UPDATE ON Queries FOR EACH ROW
BEGIN
  IF :NEW.eventDate<=SYSDATE THEN
    INSERT INTO AUDIT_TABLE VALUES('There were changes in eventDate, from ' || :NEW.eventDate || ' to ' || SYSDATE, 'Queries');
  ELSE
    RAISE_APPLICATION_ERROR(-20000, 'The date is not valid');
  END IF;
END;

UPDATE Queries SET eventDate='22/4/2021' WHERE queryID=1;

--sqlite3
/*
DROP TRIGGER IF EXISTS ValidDate;
CREATE TRIGGER ValidDate
BEFORE UPDATE ON Queries FOR EACH ROW
WHEN (NEW.eventDate>DATE(CURRENT_TIMESTAMP))
BEGIN
  SELECT RAISE(IGNORE);
END;

CREATE TRIGGER ValidDateAudit
BEFORE UPDATE ON Queries FOR EACH ROW
WHEN (NEW.eventDate<DATE(CURRENT_TIMESTAMP))
BEGIN
  INSERT INTO AUDIT_TABLE VALUES('There were changes in eventDate, from ' || NEW.eventDate || ' to ' || DATE(CURRENT_TIMESTAMP), 'Queries');
END;

UPDATE Queries SET eventDate='2023-12-12' WHERE queryID=1;
*/