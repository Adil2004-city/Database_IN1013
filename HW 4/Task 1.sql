-- DROP DATABASE IF EXISTS pet_database;
-- CREATE DATABASE pet_database;
-- USE pet_database;

-- DROP TABLE IF EXISTS petPet, petEvent;

-- Up to the next CUTOFF POINT should be in task1.sql

Create table petPet (
  petname Varchar(20) Primary key,
  owner Varchar(45),
  species Char(1),
  gender Char(1) check (gender In ('M','F')),
  birth Date,
  death Date
);

Create table petEvent (
  petname Varchar(20),
  eventdate Date,
  eventtype Varchar(15),
  remark Varchar(255),
  FOREIGN KEY (petname) References petPet(petname),
  PRIMARY KEY (petname, eventdate, eventtype)
);
