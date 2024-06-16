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
