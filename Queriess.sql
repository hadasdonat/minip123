SELECT v.Volunteer_ID, v.First_Name, v.Last_Name, COUNT(DISTINCT e.Event_ID) AS Total_Events_Participated
FROM Volunteers v
JOIN VolunteerShiftAllocation vsa ON v.Volunteer_ID = vsa.Volunteer_ID
JOIN Shifts s ON vsa.Shift_ID = s.Shift_ID
JOIN EEvents e ON s.Event_ID = e.Event_ID
GROUP BY v.Volunteer_ID, v.First_Name, v.Last_Name
ORDER BY Total_Events_Participated DESC;



SELECT 
    e.Event_ID,
    e.Loocation,
    COUNT(DISTINCT vsa.Volunteer_ID) AS Attendance
FROM EEvents e
JOIN Shifts s ON e.Event_ID = s.Event_ID
JOIN VolunteerShiftAllocation vsa ON s.Shift_ID = vsa.Shift_ID
GROUP BY e.Event_ID, e.Loocation
ORDER BY Attendance DESC;


SELECT Volunteer_ID, First_Name, Last_Name, Total_Events_Participated
FROM (
    SELECT v.Volunteer_ID, v.First_Name, v.Last_Name, COUNT(DISTINCT e.Event_ID) AS Total_Events_Participated
    FROM Volunteers v
    JOIN VolunteerShiftAllocation vsa ON v.Volunteer_ID = vsa.Volunteer_ID
    JOIN Shifts s ON vsa.Shift_ID = s.Shift_ID
    JOIN EEvents e ON s.Event_ID = e.Event_ID
    WHERE e.Event_Date >= TRUNC(SYSDATE) - INTERVAL '6' MONTH
    GROUP BY v.Volunteer_ID, v.First_Name, v.Last_Name
    ORDER BY Total_Events_Participated DESC
)
WHERE ROWNUM <= 3;


SELECT 
    Event_Date,
    COUNT(Event_ID) AS NumberOfEvents
FROM 
    Eevents
GROUP BY 
    Event_Date
ORDER BY 
    Event_Date;

SELECT 
    E.Event_ID,
    E.Event_Date,
    E.Loocation AS Event_Location,
    V.Volunteer_ID,
    V.First_Name,
    V.Last_Name,
    V.Email,
    VR.Rolename
FROM 
    Eevents E
JOIN 
    Shifts S ON E.Event_ID = S.Event_ID
JOIN 
    VolunteerShiftAllocation VSA ON S.Shift_ID = VSA.Shift_ID
JOIN 
    Volunteers V ON VSA.Volunteer_ID = V.Volunteer_ID
JOIN 
    VolunteerRole VR ON V.Volunteer_ID = VR.Volunteer_ID
ORDER BY 
    E.Event_ID, V.Volunteer_ID;

SELECT 
    E.Event_ID,
    E.Event_Date,
    E.Loocation AS Event_Location,
    COUNT(DISTINCT V.Volunteer_ID) AS NumberOfVolunteers
FROM 
    Eevents E
JOIN 
    Shifts S ON E.Event_ID = S.Event_ID
JOIN 
    VolunteerShiftAllocation VSA ON S.Shift_ID = VSA.Shift_ID
JOIN 
    Volunteers V ON VSA.Volunteer_ID = V.Volunteer_ID
GROUP BY 
    E.Event_ID, E.Event_Date, E.Loocation
ORDER BY 
    E.Event_ID;
SELECT 
    VR.Rolename,
    V.Volunteer_ID,
    V.First_Name,
    V.Last_Name,
    V.Email
FROM 
    VolunteerRole VR
JOIN 
    Volunteers V ON VR.Volunteer_ID = V.Volunteer_ID
ORDER BY 
    VR.Rolename, V.Volunteer_ID;

CREATE VIEW SortedReports AS
SELECT 
    *
FROM 
    Reports
ORDER BY 
    Report_Type ASC;

SELECT 
    E.Event_ID,
    E.Deescription AS Event_Description,
    R.Report_Type,
    R.Coontent,
    COUNT(*) AS Num_Reports
FROM 
    Eevents E
JOIN 
    Reports R ON E.Event_ID = R.Event_ID
GROUP BY 
    E.Event_ID,
    E.Deescription,
    R.Report_Type,
    R.Coontent;

