#!/bin/bash

sqlite3 table_four.db <<EOF

CREATE TABLE encounter(
  "encounterid" TEXT PRIMARY KEY NOT NULL UNIQUE,
  "patientid" TEXT NOT NULL,
  "encounterdate" TEXT NOT NULL, 
  "encounterphysician" TEXT NOT NULL,
  "encounterreason" TEXT NOT NULL,
  "billingamount" REAL NOT NULL
);

CREATE TABLE physician(
  "physicianid" TEXT PRIMARY KEY NOT NULL UNIQUE,
  "lastname" TEXT NOT NULL,
  "firstname" TEXT NOT NULL, 
  "specialty" TEXT NOT NULL
);

CREATE TABLE billing(
  "billingid" TEXT PRIMARY KEY NOT NULL UNIQUE,
  "encounterid" TEXT NOT NULL,
  "code" TEXT NOT NULL
);

CREATE TABLE patient(
  "patientid" TEXT PRIMARY KEY NOT NULL UNIQUE,
  "lastname" TEXT NOT NULL,
  "firstname" TEXT NOT NULL, 
  "gender" TEXT NOT NULL,
  "dob" TEXT NOT NULL
);

.mode csv

.import ./encounter.csv encounter
.import ./physician.csv physician 
.import ./billing.csv billing
.import ./patient.csv patient

.schema encounter
.schema physician
.schema billing
.schema patient


EOF
