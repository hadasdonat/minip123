CREATE OR REPLACE FUNCTION GetEventDetailsByCity(
    p_city_name IN VARCHAR2,
    p_start_date IN DATE,
    p_end_date IN DATE
) RETURN SYS_REFCURSOR IS
    event_cursor SYS_REFCURSOR;
BEGIN
    -- Print debug message
    DBMS_OUTPUT.PUT_LINE('Starting GetEventDetailsByCity function...');
    DBMS_OUTPUT.PUT_LINE('City: ' || p_city_name || ', Start Date: ' || p_start_date || ', End Date: ' || p_end_date);

    OPEN event_cursor FOR
        SELECT 
            e.Event_ID,
            e.Event_Date,
            e.Loocation,
            e.Deescription,
            COUNT(DISTINCT vsa.Volunteer_ID) AS Total_Volunteers
        FROM 
            EEvents e
        JOIN 
            Shifts s ON e.Event_ID = s.Event_ID
        JOIN 
            VolunteerShiftAllocation vsa ON s.Shift_ID = vsa.Shift_ID
        WHERE 
            e.Loocation = p_city_name
        AND
            e.Event_Date BETWEEN p_start_date AND p_end_date
        GROUP BY 
            e.Event_ID, e.Event_Date, e.Loocation, e.Deescription;

    -- Print debug message
    DBMS_OUTPUT.PUT_LINE('Query executed successfully.');

    RETURN event_cursor;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RETURN NULL;
END;
/
/
