#!/bin/bash
sqlite3 data4.db << eof
CREATE TABLE billing(
  "billingid" TEXT UNIQUE NOT NULL PRIMARY KEY,
  "encounterid" TEXT,
  "code" TEXT
);
CREATE TABLE encounter(
  "encounterid" TEXT UNIQUE NOT NULL PRIMARY KEY,
  "patientid" TEXT,
  "encounterdate" TEXT,
  "encounterphysician" TEXT,
  "encounterreason" TEXT,
  "billingamount" REAL
);
CREATE TABLE patient(
  "patientid" TEXT UNIQUE NOT NULL PRIMARY KEY,
  "lastname" TEXT,
  "firstname" TEXT,
  "gender" TEXT,
  "dob" TEXT
);
CREATE TABLE physician(
  "physicianid" TEXT UNIQUE NOT NULL PRIMARY KEY,
  "lastname" TEXT,
  "firstname" TEXT,
  "specialty" TEXT
);
.mode csv
.import billing.csv billing
.import encounter.csv encounter
.import patient.csv patient
.import physician.csv physician
.schema billing
.schema encounter
.schema patient
.schema physician
eof
