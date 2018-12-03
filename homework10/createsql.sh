#!/bin/bash

sqlite3 mydata.db <<EOF

CREATE TABLE billing (
billingid INT NOT NULL PRIMARY KEY,
encounterid INT NOT NULL,
code CHAR(5) NOT NULL);

CREATE TABLE encounter (
encounterid INT NOT NULL PRIMARY KEY,
patientid INT NOT NULL,
encounterdate DATE NOT NULL,
encounterphysician INT NOT NULL,
encounterreason CHAR(12) NOT NULL,
billingamount REAL NOT NULL);

CREATE TABLE patient (
patientid INT NOT NULL PRIMARY KEY,
lastname CHAR(8) NOT NULL,
firstname CHAR(8) NOT NULL,
gender CHAR(3) NOT NULL,
DOB DATE NOT NULL);

CREATE TABLE physician (
physicianid INT NOT NULL PRIMARY KEY,
lastname CHAR(12) NOT NULL,
firstname CHAR(6) NOT NULL,
specialty CHAR(12) NOT NULL);

.mode csv

.import billing.csv billing
.import encounter.csv encounter
.import patient.csv patient
.import physician.csv physician

