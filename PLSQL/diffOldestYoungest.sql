SET SERVEROUTPUT ON;
DECLARE
  oldestDate Voters.birthDate%TYPE;
  newestDate Voters.birthDate%TYPE;
  oldestName Voters.fullName%TYPE;
  newestName Voters.fullName%TYPE;
  diff NUMBER(2);
BEGIN
  SELECT A.birthDate, A.fullName, B.birthDate, B.fullName
  INTO oldestDate, oldestName, newestDate, newestName
  FROM Voters A, Voters B
  WHERE A.birthDate=(
    SELECT MIN(birthDate) FROM Voters
  ) AND B.birthDate=(
    SELECT MAX(birthDate) FROM Voters
  ); 
  diff:=ROUND((newestDate-oldestDate)/365);
  DBMS_OUTPUT.PUT_LINE('Oldest person: ' || oldestName || ' ' || oldestDate);
  DBMS_OUTPUT.PUT_LINE('Youngest person: ' || newestName || ' ' || newestDate);
  DBMS_OUTPUT.PUT_LINE('The difference is: ' || diff || ' years');
END;