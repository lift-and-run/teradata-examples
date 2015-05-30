CREATE DATABASE test AS PERMANENT =1000000; 


CREATE SET TABLE test.team (
     team_id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (
         START WITH 1
         INCREMENT BY 1
         MINVALUE 1
         MAXVALUE 10000) PRIMARY KEY,
     team_name VARCHAR (55) NOT NULL,
     team_country VARCHAR (35))
     INDEX (team_name, team_country);

CREATE SET TABLE test.drivers (
     driver_id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (
         START WITH 1
         INCREMENT BY 1
         MINVALUE 1
         MAXVALUE 30000) PRIMARY KEY,
     driver_name VARCHAR (55) NOT NULL,
     driver_country VARCHAR (35),
     driver_birth DATE)
     INDEX (driver_name, driver_country);

 CREATE SET TABLE test.races (
     race_id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (
         START WITH 1
         INCREMENT BY 1
         MINVALUE 1
         MAXVALUE 30000) PRIMARY KEY,
     race_name VARCHAR (55) NOT NULL,
     race_country VARCHAR (35))
     INDEX (race_name, race_country);

 CREATE SET TABLE test.team_members (
     team_member_id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (
         START WITH 1
         INCREMENT BY 1
         MINVALUE 1
         MAXVALUE 1000000) PRIMARY KEY,
     years INTEGER NOT NULL,
     team_id INTEGER NOT NULL,
     driver_id INTEGER NOT NULL)
     INDEX (years, team_id, driver_id);

CREATE SET TABLE test.races_by_season (
     race_by_season_id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (
         START WITH 1
         INCREMENT BY 1
         MINVALUE 1
         MAXVALUE 1000000) PRIMARY KEY,
     years INTEGER NOT NULL,
     race_id INTEGER NOT NULL,
     race_date DATE)
     INDEX (years, race_id, race_date);

CREATE SET TABLE test.drivers_standings (
     id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (
         START WITH 1
         INCREMENT BY 1
         MINVALUE 1
         MAXVALUE 1000000) PRIMARY KEY,
     years INTEGER NOT NULL,
     driver_id INTEGER NOT NULL,
     driver_place INTEGER NOT NULL,
     point INTEGER)
     INDEX (years, driver_id, driver_place);

CREATE SET TABLE test.constructor_standings (
     id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (
         START WITH 1
         INCREMENT BY 1
         MINVALUE 1
         MAXVALUE 1000000) PRIMARY KEY,
     years INTEGER NOT NULL,
     team_id INTEGER NOT NULL
     team_place INTEGER NOT NULL,
     point INTEGER)
     INDEX (years, team_id, team_place);

INSERT INTO test.team (team_name)
VALUES ('aaa');
INSERT INTO test.team (team_name)
VALUES ('aaa');
INSERT INTO test.team (team_name)
VALUES ('ghfg');
INSERT INTO test.team (team_name)
VALUES ('kkk');
INSERT INTO test.team (team_name)
VALUES ('aaar');
INSERT INTO test.team (team_name)
VALUES ('poio');
INSERT INTO test.team (team_name)
VALUES ('mmm');
INSERT INTO test.team (team_name)
VALUES ('xxx');
INSERT INTO test.team (team_name)
VALUES ('rrr');
     
DROP TABLE test.team;
DROP TABLE test.drivers;
DROP TABLE test.races;
DROP TABLE test.team_members;
DROP TABLE test.races_by_season;
DROP TABLE test.drivers_standings;
DROP TABLE test.constructor_standings;
