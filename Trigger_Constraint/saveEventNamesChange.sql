SET SERVEROUTPUT ON; --Delete this line if you are using sqlite3

-- Run this script to create the table where trigger will save the changes
CREATE TABLE AUDIT_TABLE(
  changedData VARCHAR2(100), 
  fromTable VARCHAR2(100)
);

CREATE OR REPLACE TRIGGER UpdateeventNameSave
AFTER UPDATE ON Events FOR EACH ROW
BEGIN
  INSERT INTO AUDIT_TABLE VALUES(:OLD.eventName || ' ' || :NEW.eventName, 'Events');
END;

--sqlite3
/*
CREATE TRIGGER UpdateeventNameSave
AFTER UPDATE ON Events FOR EACH ROW
BEGIN
  INSERT INTO AUDIT_TABLE VALUES(OLD.eventName || ' ' || NEW.eventName, 'Events');
END;
*/

UPDATE Events SET eventName='Madrid2021' WHERE eventID=6;