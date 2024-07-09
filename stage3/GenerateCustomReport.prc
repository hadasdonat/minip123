CREATE OR REPLACE PROCEDURE GenerateCustomReport (
    p_role_id IN NUMBER DEFAULT NULL,
    p_event_id IN NUMBER DEFAULT NULL,
    p_activity_id IN NUMBER DEFAULT NULL
) IS
    v_sql VARCHAR2(4000);
    v_cursor SYS_REFCURSOR;
    v_first_name Volunteers.First_Name%TYPE;
    v_last_name Volunteers.Last_Name%TYPE;
    v_email Volunteers.Email%TYPE;
    v_role_name Roles.Role_Name%TYPE;
    v_event_description Eevents.Deescription%TYPE;
    v_activity_name Activities.Activity_Name%TYPE;
BEGIN
    v_sql := 'SELECT v.First_Name, v.Last_Name, v.Email, r.Role_Name, e.Deescription AS Event_Description, a.Activity_Name ' ||
             'FROM Volunteers v ' ||
             'JOIN Roles r ON v.Role_ID = r.Role_ID ' ||
             'LEFT JOIN VolunteerShiftAllocation vsa ON v.Volunteer_ID = vsa.Volunteer_ID ' ||
             'LEFT JOIN Shifts s ON vsa.Shift_ID = s.Shift_ID ' ||
             'LEFT JOIN Eevents e ON s.Event_ID = e.Event_ID ' ||
             'LEFT JOIN event_activity ea ON e.Event_ID = ea.Event_ID ' ||
             'LEFT JOIN Activities a ON ea.Activity_ID = a.Activity_ID ' ||
             'WHERE 1=1 ';

    IF p_role_id IS NOT NULL THEN
        v_sql := v_sql || 'AND v.Role_ID = :p_role_id ';
    END IF;

    IF p_event_id IS NOT NULL THEN
        v_sql := v_sql || 'AND e.Event_ID = :p_event_id ';
    END IF;

    IF p_activity_id IS NOT NULL THEN
        v_sql := v_sql || 'AND a.Activity_ID = :p_activity_id ';
    END IF;

    OPEN v_cursor FOR v_sql USING p_role_id, p_event_id, p_activity_id;

    LOOP
        FETCH v_cursor INTO v_first_name, v_last_name, v_email, v_role_name, v_event_description, v_activity_name;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('מתנדב: ' || v_first_name || ' ' || v_last_name || ', אימייל: ' || v_email || ', תפקיד: ' || v_role_name || ', אירוע: ' || v_event_description || ', פעילות: ' || v_activity_name);
    END LOOP;
    CLOSE v_cursor;
END; 
/
