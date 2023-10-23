ALTER TABLE VotersADD CONSTRAINT check_phone CHECK(phone>=600000000 AND phone<=799999999);
INSERT INTO Voters VALUES(45555555, 'Antonio Moya', 'Basicos', 'Estudiante', 'amoyano@uco.es', 5, '29/08/1999', 500000000);

--sqlite cannot add a check constraint to an existing table