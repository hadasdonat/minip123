CREATE TABLE Volunteers
(
  Volunteer_ID INT NOT NULL,
  First_Name VARCHAR(255) NOT NULL,
  Last_Name VARCHAR(255) NOT NULL,
  Address VARCHAR(255) NOT NULL,
  Phone_Number INT NOT NULL,
  Email VARCHAR(255) NOT NULL,
  Role_ID INT NOT NULL,
  VolunteerRole VARCHAR(255) NOT NULL,
  Status VARCHAR(255) NOT NULL,
  PRIMARY KEY (Volunteer_ID)
);

CREATE TABLE Rooles
(
  Role_ID INT NOT NULL,
  Role_Name VARCHAR(255) NOT NULL,
  Deescription VARCHAR(255) NOT NULL,
  Required_Training NODATATYPE NOT NULL,
  Max_Volunteers INT NOT NULL,
  PRIMARY KEY (Role_ID),
  UNIQUE (Role_Name)
);

CREATE TABLE Activities
(
  Activity_ID INT NOT NULL,
  Activity_Name VARCHAR(255) NOT NULL,
  Activity_Description VARCHAR(255) NOT NULL,
  Activity_Date DATE NOT NULL,
  Activity_Start_Time DATE NOT NULL,
  Activity_End_Time DATE NOT NULL,
  Shift_ID INT NOT NULL,
  PRIMARY KEY (Activity_ID)
);

CREATE TABLE Eevents
(
  Event_ID INT NOT NULL,
  Event_Date DATE NOT NULL,
  Loocation VARCHAR(255) NOT NULL,
  Deescription VARCHAR(255) NOT NULL,
  Shift_ID INT NOT NULL,
  PRIMARY KEY (Event_ID)
);

CREATE TABLE Reports
(
  Report_ID INT NOT NULL,
  Creation_Date DATE NOT NULL,
  Report_Type VARCHAR(255) NOT NULL,
  Coontent VARCHAR NOT NULL,
  Event_ID INT NOT NULL,
  Event_ID INT NOT NULL,
  PRIMARY KEY (Report_ID),
  FOREIGN KEY (Event_ID) REFERENCES Eevents(Event_ID),
  UNIQUE (Coontent)
);

CREATE TABLE event_activity
(
  Event_ID INT NOT NULL,
  Activity_ID INT NOT NULL,
  PRIMARY KEY (Event_ID, Activity_ID),
  FOREIGN KEY (Event_ID) REFERENCES Eevents(Event_ID),
  FOREIGN KEY (Activity_ID) REFERENCES Activities(Activity_ID)
);

CREATE TABLE VolunteerRole
(
  Rolename VARCHAR(255) NOT NULL,
  Role_ID INT NOT NULL,
  Volunteer_ID INT NOT NULL,
  PRIMARY KEY (Role_ID, Volunteer_ID),
  FOREIGN KEY (Role_ID) REFERENCES Rooles(Role_ID),
  FOREIGN KEY (Volunteer_ID) REFERENCES Volunteers(Volunteer_ID)
);

CREATE TABLE Shifts
(
  Shift_ID INT NOT NULL,
  Daate DATE NOT NULL,
  Start_Time DATE NOT NULL,
  End_Time DATE NOT NULL,
  Loocation VARCHAR(255) NOT NULL,
  Shift_Leader VARCHAR(255) NOT NULL,
  Event_ID INT NOT NULL,
  PRIMARY KEY (Shift_ID),
  FOREIGN KEY (Event_ID) REFERENCES Eevents(Event_ID),
  UNIQUE (Daate)
);

CREATE TABLE VolunteerShiftAllocation
(
  Daate DATE NOT NULL,
  Volunteer_ID INT NOT NULL,
  Shift_ID INT NOT NULL,
  PRIMARY KEY (Volunteer_ID, Shift_ID),
  FOREIGN KEY (Volunteer_ID) REFERENCES Volunteers(Volunteer_ID),
  FOREIGN KEY (Shift_ID) REFERENCES Shifts(Shift_ID)
);
