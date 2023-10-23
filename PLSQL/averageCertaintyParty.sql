SET SERVEROUTPUT ON;
DECLARE
  CURSOR C IS 
  SELECT QD.certainty, P.fullName, QD.response
  FROM Query_data QD, Parties P
  WHERE P.partyID=QD.party
  ORDER BY QD.certainty DESC;
  Average NUMBER:=0;
  COUNTER NUMBER:=0;
BEGIN
  FOR ROW IN C LOOP 
    Average:=Average+ROW.certainty;
    COUNTER:=COUNTER+1;
  END LOOP;
  Average:=ROUND(Average/COUNTER, 3);
  DBMS_OUTPUT.PUT_LINE('The average of certainty is: ' || Average);
  FOR ROW IN C LOOP
    IF ROW.response='Yes' AND ROW.certainty>Average THEN
      DBMS_OUTPUT.PUT_LINE(ROW.fullName|| ' ' || ROW.certainty);
    END IF;
  END LOOP;
END;
