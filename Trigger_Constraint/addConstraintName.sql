ALTER TABLE Events DISABLE CONSTRAINT check_name;
ALTER TABLE Events ADD CONSTRAINT check_name CHECK(SUBSTR(eventType, -1, 1)='o' AND SUBSTR(eventType, 1, 1)>='A' AND SUBSTR(eventType, 1, 1)<='Z');

--sqlite3 cannot add check constraint to existing table