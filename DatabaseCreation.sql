-- Database creation script
-- Date format is YYYY-MM-DD
DROP TABLE Query_Data;
DROP TABLE Queries;
DROP TABLE Event_Results;
DROP TABLE Events;
DROP TABLE Voters;
DROP TABLE Localities;
DROP TABLE Parties;
DROP TABLE Provinces;

CREATE TABLE Parties(
	partyID NUMBER(3) PRIMARY KEY,
	fullName VARCHAR2(64) NOT NULL,
	abbreviation VARCHAR(6),
	addrss VARCHAR2(64) NOT NULL,
	city VARCHAR2(64) NOT NULL,
	president VARCHAR2(32) NOT NULL,
	creationDate DATE NOT NULL,
	budget NUMBER(14)
);

CREATE TABLE Provinces(
	provinceID NUMBER(3) PRIMARY KEY,
	nameP VARCHAR2(64) NOT NULL,
	populationP NUMBER(38) NOT NULL,
	community VARCHAR2(64) NOT NULL
);

CREATE TABLE Localities(
	localityID NUMBER(3) PRIMARY KEY,
	nameL VARCHAR2(64) NOT NULL,
	populationL NUMBER(38) NOT NULL,
	province NUMBER(3) NOT NULL,
  	CONSTRAINT fk_locality_province FOREIGN KEY (province) REFERENCES Provinces(provinceID)
);

CREATE TABLE Voters(
	dni NUMBER(8) PRIMARY KEY,
	fullName VARCHAR2(64),
	higherEducation VARCHAR2(16) NOT NULL,
	employmentStatus VARCHAR2(16) NOT NULL,
	email VARCHAR2(32) NOT NULL,
	locality NUMBER(3) NOT NULL,
	birthDate DATE NOT NULL,
	phone NUMBER(14),
	CONSTRAINT ck_education CHECK (higherEducation IN ('None','Basic','Higher','PhD')),
	CONSTRAINT ck_employment CHECK (employmentStatus IN ('Student','Retired','Unemployed','Employed')),
	CONSTRAINT fk_locality_voter FOREIGN KEY (locality) REFERENCES Localities(localityID)
);

CREATE TABLE Events(
	eventID NUMBER(6) PRIMARY KEY,
	eventName VARCHAR(32) NOT NULL,
	eventDate DATE NOT NULL,
	eventType VARCHAR(16) NOT NULL,
	detail VARCHAR2(1024) null,
	CONSTRAINT ck_name CHECK (eventType IN ('European','General','Regional','Local','Others'))
);

CREATE TABLE Event_Results(
	resultID NUMBER(6) PRIMARY KEY,
	eventR NUMBER(6) NOT NULL,
	party NUMBER(3) NOT NULL,
	resultE REAL NOT NULL,
	CONSTRAINT fk_eventR_res FOREIGN KEY (eventR) REFERENCES Events(eventID),
	CONSTRAINT fk_party_res FOREIGN KEY (party) REFERENCES Parties(partyID)
);

CREATE TABLE Queries(
	queryID NUMBER(6) PRIMARY KEY,
	eventQ NUMBER(6) NOT NULL,
	voter NUMBER(8) NOT NULL,
	eventDate DATE NOT NULL,
	CONSTRAINT fk_eventQ FOREIGN KEY (eventQ) REFERENCES Events(eventID),
	CONSTRAINT fk_voter FOREIGN KEY (voter) REFERENCES Voters(dni)
);

CREATE TABLE Query_Data(
	dataID NUMBER(6) PRIMARY KEY,
	query NUMBER(6) NOT NULL,
	party NUMBER(3) NOT NULL,
	response VARCHAR(2) NOT NULL,
	certainty REAL NOT NULL,
	CONSTRAINT fk_query FOREIGN KEY (query) REFERENCES Queries(queryID),
	CONSTRAINT fk_party FOREIGN KEY (party) REFERENCES Parties(partyID),
	CONSTRAINT ck_response CHECK (response IN ('Yes','No'))
);

/*
INSERT INTO Parties VALUES (1, 'People''s Party', 'PP', '13 Genova St.', 'Madrid', 'Pablo Casado Blanco', '20/01/1989', 324143);
INSERT INTO Parties VALUES (2, 'Spanish Socialist Workers'' Party', 'PSOE', '70 Ferraz St.', 'Madrid', 'Pedro Sanchez Perez-Castejon', '02/05/1879', 420198);
INSERT INTO Parties VALUES (3, 'Citizens', 'Cs', '253 Alcala St.', 'Madrid', 'Albert Rivera Diaz', '01/06/2006', 35200);
INSERT INTO Parties VALUES (4, 'We Can', null, '21 Zurita St.', 'Madrid', 'Pablo Iglesias Turrión', '17/01/2014', 56290);
INSERT INTO Parties VALUES (5, 'United Left', 'IU', '35 Olympus St.', 'Madrid', 'Alberto Garzon Espinosa', '29/04/1986', 101310);
*/
INSERT INTO Parties VALUES (1, 'People''s Party', 'PP', '13 Genova St.', 'Madrid', 'Pablo Casado Blanco', '1989-01-20', 324143);
INSERT INTO Parties VALUES (2, 'Spanish Socialist Workers'' Party', 'PSOE', '70 Ferraz St.', 'Madrid', 'Pedro Sanchez Perez-Castejon', '1879-05-02', 420198);
INSERT INTO Parties VALUES (3, 'Citizens', 'Cs', '253 Alcala St.', 'Madrid', 'Albert Rivera Diaz', '2006-06-01', 35200);
INSERT INTO Parties VALUES (4, 'We Can', null, '21 Zurita St.', 'Madrid', 'Pablo Iglesias Turrión', '2014-01-17', 56290);
INSERT INTO Parties VALUES (5, 'United Left', 'IU', '35 Olympus St.', 'Madrid', 'Alberto Garzon Espinosa', '1986-04-29', 101310);

INSERT INTO Provinces VALUES (1, 'Cordoba', 788219, 'Andalusia');
INSERT INTO Provinces VALUES (2, 'Sevilla', 1939775, 'Andalusia');
INSERT INTO Provinces VALUES (3, 'Madrid', 6507184, 'Madrid');
INSERT INTO Provinces VALUES (4, 'Barcelona', 5576037, 'Catalonia');
INSERT INTO Provinces VALUES (5, 'Zaragoza', 970313, 'Aragon');
INSERT INTO Provinces VALUES (6, 'Valencia', 2578719, 'Valencian Community');

INSERT INTO Localities VALUES (1, 'Cordoba', 326609, 1);
INSERT INTO Localities VALUES (2, 'Montilla', 23365, 1);
INSERT INTO Localities VALUES (3, 'Baena', 19782, 1);
INSERT INTO Localities VALUES (4, 'Sevilla', 90566, 2);
INSERT INTO Localities VALUES (5, 'Utrera', 52674, 2);
INSERT INTO Localities VALUES (6, 'Carmona', 28595, 2);
INSERT INTO Localities VALUES (7, 'Getafe', 176659, 3);
INSERT INTO Localities VALUES (8, 'Leganes', 187173, 3);
INSERT INTO Localities VALUES (9, 'Madrid', 3182981, 3);
INSERT INTO Localities VALUES (10, 'Barcelona', 1620943, 4);
INSERT INTO Localities VALUES (11, 'Badalona', 220977, 4);
INSERT INTO Localities VALUES (12, 'Gerona', 97198, 4);
INSERT INTO Localities VALUES (13, 'Tarrasa', 215678, 4);
INSERT INTO Localities VALUES (14, 'Zaragoza', 674317, 5);
INSERT INTO Localities VALUES (15, 'Gandia', 75514, 6);
INSERT INTO Localities VALUES (16, 'Valencia', 786189, 6);

/*
INSERT INTO Voters VALUES (30983712, 'Jose Perez Perez', 'Basic', 'Unemployed','jpp@gmail.com',5,'23/02/1982',662234293);
INSERT INTO Voters VALUES (41867538, 'Laura Valenzuela Ferrer', 'PhD', 'Employed','lavafe@gmail.com',4,'09/09/1975',722657395);
INSERT INTO Voters VALUES (44826745, 'Pedro Jimenez Santos', 'Basic', 'Student','jimsanped@yahoo.es',4,'12/09/1997',625336491);
INSERT INTO Voters VALUES (30725352, 'Marta Sanchez Rodriguez', 'None', 'Unemployed','martita00@hotmail.com',1,'28/01/2000',654825492);
INSERT INTO Voters VALUES (45245264, 'Ana María Expósito Escudero', 'Higher', 'Employed','expositoeam@yahoo.es',6,'30/07/1992',692547885);
INSERT INTO Voters VALUES (31075940, 'Alberto Nuñez Fernandez', 'Basic', 'Retired','anfernandez@outlook.com',1,'14/05/1950',666350983);
INSERT INTO Voters VALUES (45374737, 'Carolina Lopez Muriel', 'Basic', 'Employed','karolop90@hotmail.com',5,'19/11/1988',643176224);
INSERT INTO Voters VALUES (30852845, 'Pablo Morales Raigan', 'PhD', 'Employed','morapa@telefonica.es',2,'25/03/1969',677534816);
INSERT INTO Voters VALUES (45628436, 'Manuel Medina Alvarez', 'Higher', 'Employed','manuelmedinalv@gmail.com',11,'01/01/1992',625826487);
INSERT INTO Voters VALUES (31087814, 'Luisa Cano Vega', 'None', 'Employed','louisecave@yahoo.es',3,'05/06/1981',645623736);
INSERT INTO Voters VALUES (45657294, 'Alvaro Diaz Gomez', 'Basic', 'Student','alvadigo@ono.es',5,'29/08/1999',757427827);
INSERT INTO Voters VALUES (08727847, 'Estrella Ortiz Mengual', 'Higher', 'Retired','esomen@gmail.com',4,'23/01/1953',611892544);
INSERT INTO Voters VALUES (75648104, 'Hector Mendoza Hernandez', 'PhD', 'Unemployed','he2men@yahoo.es',1,'14/10/1986',654264027);
INSERT INTO Voters VALUES (80762946, 'Andres Carrasco Cruz', 'Basic', 'Employed','andrescaracruz@yahoo.es',7,'11/09/1992',699427546);
INSERT INTO Voters VALUES (30559073, 'Lucia Hoyos Martin', 'Basic', 'Unemployed','hoyosmalu@hotmail.com',9,'31/03/1998',721988562);
INSERT INTO Voters VALUES (30559074, 'Martin Hoyos Martin', 'Basic', 'Employed','hoyosmama@hotmail.com',9,'01/03/1996',721988563);
INSERT INTO Voters VALUES (30559075, 'Jose Hoyos Martin', 'Higher', 'Employed','hoyosmaj@hotmail.com',9,'22/01/1993',721988560);
*/
INSERT INTO Voters VALUES (30983712, 'Jose Perez Perez', 'Basic', 'Unemployed','jpp@gmail.com',5,'1982-02-23',662234293);
INSERT INTO Voters VALUES (41867538, 'Laura Valenzuela Ferrer', 'PhD', 'Employed','lavafe@gmail.com',4,'1975-09-09',722657395);
INSERT INTO Voters VALUES (44826745, 'Pedro Jimenez Santos', 'Basic', 'Student','jimsanped@yahoo.es',4,'1997-09-12',625336491);
INSERT INTO Voters VALUES (30725352, 'Marta Sanchez Rodriguez', 'None', 'Unemployed','martita00@hotmail.com',1,'2000-01-28',654825492);
INSERT INTO Voters VALUES (45245264, 'Ana María Expósito Escudero', 'Higher', 'Employed','expositoeam@yahoo.es',6,'1992-07-30',692547885);
INSERT INTO Voters VALUES (31075940, 'Alberto Nuñez Fernandez', 'Basic', 'Retired','anfernandez@outlook.com',1,'1950-05-14',666350983);
INSERT INTO Voters VALUES (45374737, 'Carolina Lopez Muriel', 'Basic', 'Employed','karolop90@hotmail.com',5,'1988-11-19',643176224);
INSERT INTO Voters VALUES (30852845, 'Pablo Morales Raigan', 'PhD', 'Employed','morapa@telefonica.es',2,'1969-03-25',677534816);
INSERT INTO Voters VALUES (45628436, 'Manuel Medina Alvarez', 'Higher', 'Employed','manuelmedinalv@gmail.com',11,'1992-01-01',625826487);
INSERT INTO Voters VALUES (31087814, 'Luisa Cano Vega', 'None', 'Employed','louisecave@yahoo.es',3,'1981-06-05',645623736);
INSERT INTO Voters VALUES (45657294, 'Alvaro Diaz Gomez', 'Basic', 'Student','alvadigo@ono.es',5,'1999-08-29',757427827);
INSERT INTO Voters VALUES (08727847, 'Estrella Ortiz Mengual', 'Higher', 'Retired','esomen@gmail.com',4,'1953-01-23',611892544);
INSERT INTO Voters VALUES (75648104, 'Hector Mendoza Hernandez', 'PhD', 'Unemployed','he2men@yahoo.es',1,'1986-10-14',654264027);
INSERT INTO Voters VALUES (80762946, 'Andres Carrasco Cruz', 'Basic', 'Employed','andrescaracruz@yahoo.es',7,'1992-09-11',699427546);
INSERT INTO Voters VALUES (30559073, 'Lucia Hoyos Martin', 'Basic', 'Unemployed','hoyosmalu@hotmail.com',9,'1998-03-31',721988562);
INSERT INTO Voters VALUES (30559074, 'Martin Hoyos Martin', 'Basic', 'Employed','hoyosmama@hotmail.com',9,'1996-03-01',721988563);
INSERT INTO Voters VALUES (30559075, 'Jose Hoyos Martin', 'Higher', 'Employed','hoyosmaj@hotmail.com',9,'1993-01-22',721988560);


/*INSERT INTO Events VALUES (1, 'Europa2018', '23/04/2018', 'European','European Parliament Elections');
INSERT INTO Events VALUES (2, 'Europa2015', '20/03/2015', 'European','European Parliament Elections');
INSERT INTO Events VALUES (3, 'España17', '26/05/2017', 'General','General Elections');
INSERT INTO Events VALUES (4, 'España13', '30/05/2013', 'General','General Elections');
INSERT INTO Events VALUES (5, 'Andalusia', '23/09/2018', 'Regional','Andalusian Parliament Elections');
INSERT INTO Events VALUES (6, 'Madrid', '23/09/2018', 'Regional','Community of Madrid Elections');
INSERT INTO Events VALUES (7, 'Cataluña', '23/09/2018', 'Regional','Catalan Government Elections');
INSERT INTO Events VALUES (8, 'Cordoba', '22/01/2018', 'Local', 'Cordoba Municipal Elections');
INSERT INTO Events VALUES (9, 'Seville', '22/01/2018', 'Local', 'Seville Municipal Elections');
INSERT INTO Events VALUES (10, 'Madrid', '22/01/2018', 'Local', 'Madrid Municipal Elections');
INSERT INTO Events VALUES (11, 'Statute', '10/01/2018', 'Others', 'Approval of Andalusian Autonomy Statute');
*/
INSERT INTO Events VALUES (1, 'Europa2018', '2018-04-23', 'European', 'European Parliament Elections');
INSERT INTO Events VALUES (2, 'Europa2015', '2015-03-20', 'European', 'European Parliament Elections');
INSERT INTO Events VALUES (3, 'España17', '2017-05-26', 'General', 'General Elections');
INSERT INTO Events VALUES (4, 'España13', '2013-05-30', 'General', 'General Elections');
INSERT INTO Events VALUES (5, 'Andalusia', '2018-09-23', 'Regional', 'Andalusian Parliament Elections');
INSERT INTO Events VALUES (6, 'Madrid', '2018-09-23', 'Regional', 'Community of Madrid Elections');
INSERT INTO Events VALUES (7, 'Cataluña', '2018-09-23', 'Regional', 'Catalan Government Elections');
INSERT INTO Events VALUES (8, 'Cordoba', '2018-01-22', 'Local', 'Cordoba Municipal Elections');
INSERT INTO Events VALUES (9, 'Seville', '2018-01-22', 'Local', 'Seville Municipal Elections');
INSERT INTO Events VALUES (10, 'Madrid', '2018-01-22', 'Local', 'Madrid Municipal Elections');
INSERT INTO Events VALUES (11, 'Statute', '2018-01-10', 'Others', 'Approval of Andalusian Autonomy Statute');

INSERT INTO Event_Results VALUES (1, 1, 1, 0.37);
INSERT INTO Event_Results VALUES (2, 1, 2, 0.24);
INSERT INTO Event_Results VALUES (3, 1, 3, 0.16);
INSERT INTO Event_Results VALUES (4, 1, 4, 0.10);
INSERT INTO Event_Results VALUES (5, 1, 5, 0.13);
INSERT INTO Event_Results VALUES (6, 2, 1, 0.30);
INSERT INTO Event_Results VALUES (7, 2, 2, 0.14);
INSERT INTO Event_Results VALUES (8, 2, 3, 0.16);
INSERT INTO Event_Results VALUES (9, 2, 4, 0.27);
INSERT INTO Event_Results VALUES (10, 2, 5, 0.13);
INSERT INTO Event_Results VALUES (11, 3, 1, 0.20);
INSERT INTO Event_Results VALUES (12, 3, 2, 0.40);
INSERT INTO Event_Results VALUES (13, 3, 3, 0.11);
INSERT INTO Event_Results VALUES (14, 3, 4, 0.09);
INSERT INTO Event_Results VALUES (15, 3, 5, 0.20);
INSERT INTO Event_Results VALUES (16, 4, 1, 0.39);
INSERT INTO Event_Results VALUES (17, 4, 2, 0.50);
INSERT INTO Event_Results VALUES (18, 4, 5, 0.11);
INSERT INTO Event_Results VALUES (19, 5, 1, 0.27);
INSERT INTO Event_Results VALUES (20, 5, 2, 0.64);
INSERT INTO Event_Results VALUES (21, 5, 3, 0.06);
INSERT INTO Event_Results VALUES (22, 5, 4, 0.01);
INSERT INTO Event_Results VALUES (23, 5, 5, 0.02);
INSERT INTO Event_Results VALUES (24, 6, 1, 0.67);
INSERT INTO Event_Results VALUES (25, 6, 2, 0.14);
INSERT INTO Event_Results VALUES (26, 6, 3, 0.06);
INSERT INTO Event_Results VALUES (27, 6, 4, 0.11);
INSERT INTO Event_Results VALUES (28, 6, 5, 0.02);
INSERT INTO Event_Results VALUES (29, 7, 1, 0.07);
INSERT INTO Event_Results VALUES (30, 7, 2, 0.62);
INSERT INTO Event_Results VALUES (31, 7, 3, 0.30);
INSERT INTO Event_Results VALUES (32, 7, 4, 0.01);
INSERT INTO Event_Results VALUES (33, 7, 5, 0.02);
INSERT INTO Event_Results VALUES (34, 8, 1, 0.34);
INSERT INTO Event_Results VALUES (35, 8, 2, 0.12);
INSERT INTO Event_Results VALUES (36, 8, 5, 0.54);
INSERT INTO Event_Results VALUES (37, 9, 1, 0.34);
INSERT INTO Event_Results VALUES (38, 9, 2, 0.12);
INSERT INTO Event_Results VALUES (39, 9, 3, 0.34);
INSERT INTO Event_Results VALUES (40, 9, 4, 0.20);
INSERT INTO Event_Results VALUES (41, 10, 1, 0.37);
INSERT INTO Event_Results VALUES (42, 10, 2, 0.24);
INSERT INTO Event_Results VALUES (43, 10, 3, 0.16);
INSERT INTO Event_Results VALUES (44, 10, 4, 0.10);
INSERT INTO Event_Results VALUES (45, 10, 5, 0.13);

/*
INSERT INTO Queries VALUES (1, 1, 30983712, '22/03/2018');
INSERT INTO Queries VALUES (2, 1, 41867538, '22/03/2018');
INSERT INTO Queries VALUES (3, 1, 44826745, '22/03/2018');
INSERT INTO Queries VALUES (4, 1, 30725352, '21/03/2018');
INSERT INTO Queries VALUES (5, 1, 45245264, '22/03/2018');
INSERT INTO Queries VALUES (6, 1, 31075940, '21/03/2018');
INSERT INTO Queries VALUES (7, 1, 45374737, '22/03/2018');
INSERT INTO Queries VALUES (8, 1, 31087814, '21/03/2018');
INSERT INTO Queries VALUES (9, 1, 45628436, '21/03/2018');
INSERT INTO Queries VALUES (10, 3, 30983712, '12/03/2017');
INSERT INTO Queries VALUES (11, 3, 41867538, '12/03/2017');
INSERT INTO Queries VALUES (12, 3, 44826745, '12/03/2017');
INSERT INTO Queries VALUES (13, 3, 30725352, '11/03/2017');
INSERT INTO Queries VALUES (14, 3, 45245264, '12/03/2017');
INSERT INTO Queries VALUES (15, 3, 31075940, '11/03/2017');
INSERT INTO Queries VALUES (16, 3, 45374737, '12/03/2017');
INSERT INTO Queries VALUES (17, 3, 31087814, '11/03/2017');
INSERT INTO Queries VALUES (18, 3, 45628436, '11/03/2017');
INSERT INTO Queries VALUES (19, 8, 30725352, '19/11/2017');
INSERT INTO Queries VALUES (20, 8, 31075940, '19/11/2017');
INSERT INTO Queries VALUES (21, 8, 75648104, '19/11/2017');
INSERT INTO Queries VALUES (22, 6, 80762946, '31/07/2017');
INSERT INTO Queries VALUES (23, 6, 30559073, '31/07/2017');
INSERT INTO Queries VALUES (24, 6, 30559074, '31/07/2017');
INSERT INTO Queries VALUES (25, 6, 30559075, '31/07/2017');
INSERT INTO Queries VALUES (26, 5, 75648104, '31/07/2017');
INSERT INTO Queries VALUES (27, 5, 30983712, '31/07/2017');
INSERT INTO Queries VALUES (28, 5, 41867538, '31/07/2017');
INSERT INTO Queries VALUES (29, 5, 44826745, '30/07/2017');
INSERT INTO Queries VALUES (30, 5, 30725352, '31/07/2017');
INSERT INTO Queries VALUES (31, 5, 45245264, '30/07/2017');
INSERT INTO Queries VALUES (32, 5, 31075940, '31/07/2017');
INSERT INTO Queries VALUES (33, 5, 45374737, '29/07/2017');
INSERT INTO Queries VALUES (34, 5, 30852845, '29/07/2017');
INSERT INTO Queries VALUES (35, 5, 31087814, '29/07/2017');
INSERT INTO Queries VALUES (36, 5, 45657294, '29/07/2017');
INSERT INTO Queries VALUES (37, 5, 08727847, '31/07/2017');
INSERT INTO Queries VALUES (38, 2, 30983712, '21/01/2015');
INSERT INTO Queries VALUES (39, 2, 41867538, '21/01/2015');
INSERT INTO Queries VALUES (40, 2, 44826745, '21/01/2015');
INSERT INTO Queries VALUES (41, 2, 30725352, '22/01/2015');
INSERT INTO Queries VALUES (42, 2, 45245264, '21/01/2015');
INSERT INTO Queries VALUES (43, 2, 31075940, '21/01/2015');
INSERT INTO Queries VALUES (44, 2, 45374737, '22/01/2015');
INSERT INTO Queries VALUES (45, 2, 30852845, '21/01/2015');
INSERT INTO Queries VALUES (46, 2, 45628436, '22/01/2015');
INSERT INTO Queries VALUES (47, 2, 31087814, '21/01/2015');
INSERT INTO Queries VALUES (48, 2, 45657294, '22/01/2015');
INSERT INTO Queries VALUES (49, 2, 08727847, '21/01/2015');
INSERT INTO Queries VALUES (50, 2, 75648104, '21/01/2015');
INSERT INTO Queries VALUES (51, 2, 80762946, '21/01/2015');
INSERT INTO Queries VALUES (52, 2, 30559073, '22/01/2015');
INSERT INTO Queries VALUES (53, 2, 30559074, '22/01/2015');
INSERT INTO Queries VALUES (54, 2, 30559075, '22/01/2015');
*/
INSERT INTO Queries VALUES (1, 1, 30983712, '2018-03-22');
INSERT INTO Queries VALUES (2, 1, 41867538, '2018-03-22');
INSERT INTO Queries VALUES (3, 1, 44826745, '2018-03-22');
INSERT INTO Queries VALUES (4, 1, 30725352, '2018-03-21');
INSERT INTO Queries VALUES (5, 1, 45245264, '2018-03-22');
INSERT INTO Queries VALUES (6, 1, 31075940, '2018-03-21');
INSERT INTO Queries VALUES (7, 1, 45374737, '2018-03-22');
INSERT INTO Queries VALUES (8, 1, 31087814, '2018-03-21');
INSERT INTO Queries VALUES (9, 1, 45628436, '2018-03-21');
INSERT INTO Queries VALUES (10, 3, 30983712, '2017-03-12');
INSERT INTO Queries VALUES (11, 3, 41867538, '2017-03-12');
INSERT INTO Queries VALUES (12, 3, 44826745, '2017-03-12');
INSERT INTO Queries VALUES (13, 3, 30725352, '2017-03-11');
INSERT INTO Queries VALUES (14, 3, 45245264, '2017-03-12');
INSERT INTO Queries VALUES (15, 3, 31075940, '2017-03-11');
INSERT INTO Queries VALUES (16, 3, 45374737, '2017-03-12');
INSERT INTO Queries VALUES (17, 3, 31087814, '2017-03-11');
INSERT INTO Queries VALUES (18, 3, 45628436, '2017-03-11');
INSERT INTO Queries VALUES (19, 8, 30725352, '2017-11-19');
INSERT INTO Queries VALUES (20, 8, 31075940, '2017-11-19');
INSERT INTO Queries VALUES (21, 8, 75648104, '2017-11-19');
INSERT INTO Queries VALUES (22, 6, 80762946, '2017-07-31');
INSERT INTO Queries VALUES (23, 6, 30559073, '2017-07-31');
INSERT INTO Queries VALUES (24, 6, 30559074, '2017-07-31');
INSERT INTO Queries VALUES (25, 6, 30559075, '2017-07-31');
INSERT INTO Queries VALUES (26, 5, 75648104, '2017-07-31');
INSERT INTO Queries VALUES (27, 5, 30983712, '2017-07-31');
INSERT INTO Queries VALUES (28, 5, 41867538, '2017-07-31');
INSERT INTO Queries VALUES (29, 5, 44826745, '2017-07-30');
INSERT INTO Queries VALUES (30, 5, 30725352, '2017-07-31');
INSERT INTO Queries VALUES (31, 5, 45245264, '2017-07-30');
INSERT INTO Queries VALUES (32, 5, 31075940, '2017-07-31');
INSERT INTO Queries VALUES (33, 5, 45374737, '2017-07-29');
INSERT INTO Queries VALUES (34, 5, 30852845, '2017-07-29');
INSERT INTO Queries VALUES (35, 5, 31087814, '2017-07-29');
INSERT INTO Queries VALUES (36, 5, 45657294, '2017-07-29');
INSERT INTO Queries VALUES (37, 5, 08727847, '2017-07-31');
INSERT INTO Queries VALUES (38, 2, 30983712, '2015-01-21');
INSERT INTO Queries VALUES (39, 2, 41867538, '2015-01-21');
INSERT INTO Queries VALUES (40, 2, 44826745, '2015-01-21');
INSERT INTO Queries VALUES (41, 2, 30725352, '2015-01-22');
INSERT INTO Queries VALUES (42, 2, 45245264, '2015-01-21');
INSERT INTO Queries VALUES (43, 2, 31075940, '2015-01-21');
INSERT INTO Queries VALUES (44, 2, 45374737, '2015-01-22');
INSERT INTO Queries VALUES (45, 2, 30852845, '2015-01-21');
INSERT INTO Queries VALUES (46, 2, 45628436, '2015-01-22');
INSERT INTO Queries VALUES (47, 2, 31087814, '2015-01-21');
INSERT INTO Queries VALUES (48, 2, 45657294, '2015-01-22');
INSERT INTO Queries VALUES (49, 2, 08727847, '2015-01-21');
INSERT INTO Queries VALUES (50, 2, 75648104, '2015-01-21');
INSERT INTO Queries VALUES (51, 2, 80762946, '2015-01-21');
INSERT INTO Queries VALUES (52, 2, 30559073, '2015-01-22');
INSERT INTO Queries VALUES (53, 2, 30559074, '2015-01-22');
INSERT INTO Queries VALUES (54, 2, 30559075, '2015-01-22');



INSERT INTO Query_Data VALUES (1, 1, 1, 'Yes', 0.90);
INSERT INTO Query_Data VALUES (2, 2, 1, 'Yes', 0.87);
INSERT INTO Query_Data VALUES (3, 3, 1, 'Yes', 0.85);
INSERT INTO Query_Data VALUES (4, 4, 1, 'Yes', 0.57);
INSERT INTO Query_Data VALUES (5, 4, 2, 'No', 0.47);
INSERT INTO Query_Data VALUES (6, 5, 1, 'Yes', 0.78);
INSERT INTO Query_Data VALUES (7, 6, 2, 'Yes', 0.78);
INSERT INTO Query_Data VALUES (8, 7, 2, 'Yes', 0.92);
INSERT INTO Query_Data VALUES (9, 8, 2, 'Yes', 0.78);
INSERT INTO Query_Data VALUES (10, 9, 3, 'Yes', 0.78);
INSERT INTO Query_Data VALUES (11, 10, 1, 'Yes', 0.78);
INSERT INTO Query_Data VALUES (12, 10, 2, 'No', 0.92);
INSERT INTO Query_Data VALUES (13, 10, 3, 'No', 0.95);
INSERT INTO Query_Data VALUES (14, 11, 1, 'Yes', 0.58);
INSERT INTO Query_Data VALUES (15, 12, 2, 'Yes', 0.85);
INSERT INTO Query_Data VALUES (16, 13, 2, 'Yes', 0.88);
INSERT INTO Query_Data VALUES (17, 14, 2, 'Yes', 0.81);
INSERT INTO Query_Data VALUES (18, 15, 2, 'Yes', 0.81);
INSERT INTO Query_Data VALUES (19, 16, 3, 'Yes', 0.65);
INSERT INTO Query_Data VALUES (20, 17, 4, 'Yes', 0.81);
INSERT INTO Query_Data VALUES (21, 18, 5, 'Yes', 0.81);
INSERT INTO Query_Data VALUES (22, 19, 1, 'Yes', 0.81);
INSERT INTO Query_Data VALUES (23, 20, 5, 'Yes', 0.81);
INSERT INTO Query_Data VALUES (24, 21, 5, 'Yes', 0.81);
INSERT INTO Query_Data VALUES (25, 22, 1, 'Yes', 0.61);
INSERT INTO Query_Data VALUES (26, 23, 2, 'Yes', 0.78);
INSERT INTO Query_Data VALUES (27, 24, 3, 'Yes', 0.51);
INSERT INTO Query_Data VALUES (28, 25, 4, 'Yes', 0.51);
INSERT INTO Query_Data VALUES (29, 26, 1, 'Yes', 0.51);
INSERT INTO Query_Data VALUES (30, 27, 4, 'Yes', 0.56);
INSERT INTO Query_Data VALUES (31, 28, 2, 'Yes', 0.57);
INSERT INTO Query_Data VALUES (32, 29, 4, 'Yes', 0.61);
INSERT INTO Query_Data VALUES (33, 30, 3, 'Yes', 0.72);
INSERT INTO Query_Data VALUES (34, 31, 4, 'Yes', 0.83);
INSERT INTO Query_Data VALUES (35, 32, 5, 'Yes', 0.98);
INSERT INTO Query_Data VALUES (36, 33, 5, 'Yes', 0.90);
INSERT INTO Query_Data VALUES (37, 34, 2, 'Yes', 0.85);
INSERT INTO Query_Data VALUES (38, 35, 4, 'Yes', 0.84);
INSERT INTO Query_Data VALUES (39, 36, 2, 'Yes', 0.81);
INSERT INTO Query_Data VALUES (40, 37, 2, 'Yes', 0.59);
INSERT INTO Query_Data VALUES (41, 38, 1, 'Yes', 0.59);
INSERT INTO Query_Data VALUES (42, 39, 1, 'Yes', 0.99);
INSERT INTO Query_Data VALUES (43, 40, 1, 'Yes', 0.79);
INSERT INTO Query_Data VALUES (44, 41, 2, 'Yes', 0.89);
INSERT INTO Query_Data VALUES (45, 42, 2, 'Yes', 0.59);
INSERT INTO Query_Data VALUES (46, 43, 3, 'Yes', 0.86);
INSERT INTO Query_Data VALUES (47, 44, 4, 'Yes', 0.59);
INSERT INTO Query_Data VALUES (48, 45, 2, 'Yes', 0.59);
INSERT INTO Query_Data VALUES (49, 46, 5, 'Yes', 0.51);
INSERT INTO Query_Data VALUES (50, 47, 3, 'Yes', 0.50);
INSERT INTO Query_Data VALUES (51, 48, 5, 'No', 0.59);
INSERT INTO Query_Data VALUES (52, 49, 5, 'Yes', 0.55);
INSERT INTO Query_Data VALUES (53, 50, 3, 'Yes', 0.66);
INSERT INTO Query_Data VALUES (54, 51, 1, 'Yes', 0.77);
INSERT INTO Query_Data VALUES (55, 52, 1, 'Yes', 0.76);
INSERT INTO Query_Data VALUES (56, 53, 1, 'Yes', 0.64);
INSERT INTO Query_Data VALUES (57, 54, 2, 'Yes', 0.99);
INSERT INTO Query_Data VALUES (58, 54, 1, 'No', 0.99);
INSERT INTO Query_Data VALUES (59, 54, 3, 'No', 0.76);
INSERT INTO Query_Data VALUES (60, 54, 4, 'No', 0.92);
INSERT INTO Query_Data VALUES (61, 54, 5, 'No', 0.82);
