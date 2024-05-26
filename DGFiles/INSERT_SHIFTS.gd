
[General]
Version=1

[Preferences]
Username=
Password=2302
Database=
DateFormat=DD-MM-YYYY
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=SHIFTS
Count=400

[Record]
Name=SHIFT_ID
Type=NUMBER
Size=
Data=Sequence(100000, [1], [WithinParent])
Master=

[Record]
Name=DAATE
Type=DATE
Size=
Data=Random(1/1/1970, 1/1/2025)
Master=

[Record]
Name=START_TIME
Type=VARCHAR2
Size=255
Data=Random(0, 23) +':'+ Random(0, 59)
Master=

[Record]
Name=LOOCATION
Type=VARCHAR2
Size=255
Data=City
Master=

[Record]
Name=SHIFT_LEADER
Type=VARCHAR2
Size=255
Data=FirstName + LastName
Master=

[Record]
Name=EVENT_ID
Type=NUMBER
Size=
Data=List(select EVENT_ID from EEVENTS)
Master=

