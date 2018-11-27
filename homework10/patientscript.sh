
-- #Create schema tables based on the 4 csv files

CREATE TABLE billing (
billingid INTEGER PRIMARY KEY NOT NULL,
encounterid INTEGER,
code VARCHAR,
FOREIGN KEY (encounterid) REFERENCES encounter (encounterid)
);

CREATE TABLE encounter (
encounterid INTEGER PRIMARY KEY NOT NULL,
patientid INTEGER,
encounterdate DATE,
encounterphysician INTEGER,
encounterreason VARCHAR,
billingamount FLOAT,
FOREIGN KEY (patientid) REFERENCES patient (patientid),
FOREIGN KEY (encounterphysician) REFERENCES physician (physicianid)
);

CREATE TABLE patient (
patientid INTEGER PRIMARY KEY NOT NULL,
lastname VARCHAR,
firstname VARCHAR,
gender VARCHAR,
dob DATE
);

CREATE TABLE physician (
physicianid INTEGER PRIMARY KEY NOT NULL,
lastname VARCHAR,
firstname VARCHAR,
speciality VARCHAR
);

-- #Indicate mode and separator of data
.mode csv
.separator ","

-- #Import csv files into created tables
.import billing.csv billing
.import encounter.csv encounter
.import patient.csv patient
.import physician.csv physician

