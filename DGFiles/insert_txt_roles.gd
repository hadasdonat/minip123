
[General]
Version=1

[Preferences]
Username=
Password=2045
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=REPORTS
Count=10..20

[Record]
Name=REPORT_ID
Type=NUMBER
Size=
Data=Random(10000, 99999)
Master=

[Record]
Name=CREATION_DATE
Type=DATE
Size=
Data=Random(1/1/1970, 1/1/2025)
Master=

[Record]
Name=REPORT_TYPE
Type=VARCHAR2
Size=255
Data=List('treatment on the spot', 'cencelation', 'evacuation','determination of death')
Master=

[Record]
Name=COONTENT
Type=VARCHAR2
Size=255
Data=Elements.Symbol + Components.Description
Master=

[Record]
Name=EVENT_ID
Type=NUMBER
Size=
Data=Random(Min, Max)
Master=

