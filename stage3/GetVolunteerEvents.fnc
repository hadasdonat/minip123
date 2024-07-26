CREATE OR REPLACE FUNCTION GetVolunteerEvents (volunteer_id IN NUMBER)
RETURN SYS_REFCURSOR IS
    volunteer_events SYS_REFCURSOR;
BEGIN
    OPEN volunteer_events FOR
    SELECT e.Event_ID, e.Event_Date, e.Deescription
    FROM VolunteerShiftAllocation vsa
    JOIN Shifts s ON vsa.Shift_ID = s.Shift_ID
    JOIN eevents e ON s.Event_ID = e.Event_ID
    WHERE vsa.Volunteer_ID = volunteer_id;

    RETURN volunteer_events;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/
/
