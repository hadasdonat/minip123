CREATE OR REPLACE PROCEDURE UpdateAndReportVolunteers (
    p_role_id IN NUMBER DEFAULT NULL,
    p_event_id IN NUMBER DEFAULT NULL,
    p_new_status IN VARCHAR2 DEFAULT 'Active'
) 
IS
    v_sql VARCHAR2(4000);
    v_cursor SYS_REFCURSOR;
    v_first_name Volunteers.First_Name%TYPE;
    v_last_name Volunteers.Last_Name%TYPE;
    v_email Volunteers.Email%TYPE;
    v_role_name Roles.Role_Name%TYPE;
    v_event_description Eevents.Deescription%TYPE;
BEGIN
    -- עדכון סטטוס של מתנדבים בהתאם למזהה תפקיד ומזהה אירוע
    IF p_role_id IS NOT NULL THEN
        UPDATE Volunteers
        SET Status = p_new_status
        WHERE Role_ID = p_role_id
        AND Volunteer_ID IN (
            SELECT v.Volunteer_ID
            FROM Volunteers v
            JOIN VolunteerShiftAllocation vsa ON v.Volunteer_ID = vsa.Volunteer_ID
            JOIN Shifts s ON vsa.Shift_ID = s.Shift_ID
            JOIN Eevents e ON s.Event_ID = e.Event_ID
            WHERE (e.Event_ID = p_event_id OR p_event_id IS NULL)
        );
    END IF;

    -- בניית שאילתת הדוח המותאם אישית
    v_sql := 'SELECT v.First_Name, v.Last_Name, v.Email, r.Role_Name, e.Deescription AS Event_Description ' ||
             'FROM Volunteers v ' ||
             'JOIN Roles r ON v.Role_ID = r.Role_ID ' ||
             'LEFT JOIN VolunteerShiftAllocation vsa ON v.Volunteer_ID = vsa.Volunteer_ID ' ||
             'LEFT JOIN Shifts s ON vsa.Shift_ID = s.Shift_ID ' ||
             'LEFT JOIN Eevents e ON s.Event_ID = e.Event_ID ' ||
             'WHERE v.Status = :p_new_status ' ||
             'AND (v.Role_ID = :p_role_id OR :p_role_id IS NULL) ' ||
             'AND (e.Event_ID = :p_event_id OR :p_event_id IS NULL)';

    OPEN v_cursor FOR v_sql USING p_new_status, p_role_id, p_event_id;

    -- הדפסת הדוח המותאם אישית
    LOOP
        FETCH v_cursor INTO v_first_name, v_last_name, v_email, v_role_name, v_event_description;
        EXIT WHEN v_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('מתנדב: ' || v_first_name || ' ' || v_last_name || ', אימייל: ' || v_email || ', תפקיד: ' || v_role_name || ', אירוע: ' || v_event_description);
    END LOOP;
    CLOSE v_cursor;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('שגיאה בעדכון ודוח מתנדבים: ' || SQLERRM);
        ROLLBACK;
END UpdateAndReportVolunteers;
/
