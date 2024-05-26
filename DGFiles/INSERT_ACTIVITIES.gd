
[General]
Version=1

[Preferences]
Username=
Password=2000
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=EVENT_ACTIVITY
Count=400

[Record]
Name=EVENT_ID
Type=NUMBER
Size=
Data=List(select EVENT_ID from EEVENTS)
Master=

[Record]
Name=ACTIVITY_ID
Type=NUMBER
Size=
Data=List(select ACTIVITY_ID from ACTIVITIES)
Master=

