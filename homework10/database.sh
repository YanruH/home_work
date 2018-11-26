#!/bin/bash
  

sqlite3 mydatabase.sqlite <<EOF
create table physician(physicianid int primary key not null, lastname text, firstname text, specialty text);
create table patient(patientid int primary key not null, lastname text, firstname text, gender text, birthday date);
create table encounter(encounterid int primary key not null, patientid int, date date, physician text, reason text, billamount numeric,foreign key (patientid) references patient(patientid));
create table billing(billingid int primary key not null, encounterid int, code int,foreign key (encounterid) references encounter(encounterid));
EOF

sed -i.tmp 's/,/|/g' physician.csv
sed -i.tmp 's/,/|/g' billing.csv
sed -i.tmp 's/,/|/g' encounter.csv
sed -i.tmp 's/,/|/g' patient.csv

sqlite3 mydatabase.sqlite <<EOF
.import "|tail -n +2  physician.csv" physician
.import "|tail -n +2 patient.csv" patient
.import "|tail -n +2 encounter.csv" encounter
.import "|tail -n +2 billing.csv" billing
select * from physician;
select * from patient;
select * from encounter;
select * from billing;
EOF



