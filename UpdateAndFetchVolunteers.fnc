CREATE OR REPLACE FUNCTION UpdateAndFetchVolunteers (
    p_role_id IN NUMBER DEFAULT NULL,
    p_event_id IN NUMBER DEFAULT NULL,
    p_activity_id IN NUMBER DEFAULT NULL,
    p_new_status IN VARCHAR2 DEFAULT 'Active'
) RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    -- Update the status of volunteers based on the provided role_id
    IF p_role_id IS NOT NULL THEN
        UPDATE Volunteers
        SET Status = p_new_status
        WHERE Role_ID = p_role_id;
    END IF;

    -- Construct the SQL query
    OPEN v_cursor FOR
        'SELECT v.First_Name, v.Last_Name, v.Email, r.Role_Name, e.Deescription AS Event_Description, a.Activity_Name ' ||
        'FROM Volunteers v ' ||
        'JOIN Roles r ON v.Role_ID = r.Role_ID ' ||
        'LEFT JOIN VolunteerShiftAllocation vsa ON v.Volunteer_ID = vsa.Volunteer_ID ' ||
        'LEFT JOIN Shifts s ON vsa.Shift_ID = s.Shift_ID ' ||
        'LEFT JOIN Eevents e ON s.Event_ID = e.Event_ID ' ||
        'LEFT JOIN event_activity ea ON e.Event_ID = ea.Event_ID ' ||
        'LEFT JOIN Activities a ON ea.Activity_ID = a.Activity_ID ' ||
        'WHERE (v.Role_ID = :p_role_id OR :p_role_id IS NULL) ' ||
        'AND (e.Event_ID = :p_event_id OR :p_event_id IS NULL) ' ||
        'AND (a.Activity_ID = :p_activity_id OR :p_activity_id IS NULL)';

    RETURN v_cursor;
END UpdateAndFetchVolunteers;
/
