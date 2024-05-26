
[General]
Version=1

[Preferences]
Username=
Password=2821
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=EEVENTS
Count=400

[Record]
Name=EVENT_ID
Type=NUMBER
Size=
Data=Random(1,1000)
Master=

[Record]
Name=EVENT_DATE
Type=DATE
Size=
Data=Random(1/1/1970, 1/1/2024) 
Master=

[Record]
Name=EVENT_TIME
Type=NUMBER
Size=
Data=Random(0, 23)+ ':' + Random(0, 59)
Master=

[Record]
Name=LOOCATION
Type=VARCHAR2
Size=
Data=City
Master=

[Record]
Name=DEESCRIPTION
Type=VARCHAR2
Size=
Data=Components.Description
Master=

[Record]
Name=SHIFT_ID
Type=NUMBER
Size=
Data=Random(100, 999)
Master=

