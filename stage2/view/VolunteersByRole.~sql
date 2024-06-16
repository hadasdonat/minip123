CREATE VIEW VolunteersByRole AS
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
