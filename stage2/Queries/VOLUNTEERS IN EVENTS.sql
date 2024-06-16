SELECT v.Volunteer_ID, v.First_Name, v.Last_Name, COUNT(DISTINCT e.Event_ID) AS Total_Events_Participated
FROM Volunteers v
JOIN VolunteerShiftAllocation vsa ON v.Volunteer_ID = vsa.Volunteer_ID
JOIN Shifts s ON vsa.Shift_ID = s.Shift_ID
JOIN EEvents e ON s.Event_ID = e.Event_ID
GROUP BY v.Volunteer_ID, v.First_Name, v.Last_Name
ORDER BY Total_Events_Participated DESC;
