
[General]
Version=1

[Preferences]
Username=
Password=2290
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=ROLES
Count=10..6

[Record]
Name=ROLE_ID
Type=NUMBER
Size=
Data=Random(1, 6)
Master=

[Record]
Name=ROLE_NAME
Type=VARCHAR2
Size=
Data=List('paramedic', 'ambulance driver','taking blood',customer service',center manager',trainee')
Master=

[Record]
Name=DEESCRIPTION
Type=VARCHAR2
Size=
Data=Components.Description
Master=

[Record]
Name=REQUIRED_TRAINING
Type=VARCHAR2
Size=
Data=List('yes', 'no')
Master=

[Record]
Name=MAX_VOLUNTEERS
Type=NUMBER
Size=
Data=List('70')
Master=

