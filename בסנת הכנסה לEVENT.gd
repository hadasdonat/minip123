
[General]
Version=1

[Preferences]
Username=
Password=2611
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=EEVENTS
Count=10..20

[Record]
Name=EVENT_ID
Type=NUMBER
Size=
Data=Random(1000, 9999)
Master=

[Record]
Name=EVENT_DATE
Type=DATE
Size=
Data=Random(10/01/1970, 01/01/2025)
Master=

[Record]
Name=LOOCATION
Type=VARCHAR2
Size=255
Data=Address1
Master=

[Record]
Name=DEESCRIPTION
Type=VARCHAR2
Size=255
Data=Components.Description
Master=

[Record]
Name=SHIFT_ID
Type=NUMBER
Size=
Data=Random(1, 6)
Master=

