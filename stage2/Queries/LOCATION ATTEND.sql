SELECT 
    e.Event_ID,
    e.Loocation,
    COUNT(DISTINCT vsa.Volunteer_ID) AS Attendance
FROM EEvents e
JOIN Shifts s ON e.Event_ID = s.Event_ID
JOIN VolunteerShiftAllocation vsa ON s.Shift_ID = vsa.Shift_ID
GROUP BY e.Event_ID, e.Loocation
ORDER BY Attendance DESC;

