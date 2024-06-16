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
