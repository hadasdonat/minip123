CREATE OR REPLACE PROCEDURE ShowVolunteerShifts (
    volunteer_id IN NUMBER
) IS
    CURSOR shifts_cursor IS
    SELECT s.Shift_ID, s.Daate, s.Start_Time, s.Loocation
    FROM VolunteerShiftAllocation vsa
    JOIN Shifts s ON vsa.Shift_ID = s.Shift_ID
    WHERE vsa.Volunteer_ID = volunteer_id;

    v_shift_id Shifts.Shift_ID%TYPE;
    v_date Shifts.Daate%TYPE;
    v_start_time Shifts.Start_Time%TYPE;
    v_location Shifts.Loocation%TYPE;
BEGIN
    OPEN shifts_cursor;

    LOOP
        FETCH shifts_cursor INTO v_shift_id, v_date, v_start_time, v_location;
        EXIT WHEN shifts_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Shift ID: ' || v_shift_id || ', Date: ' || v_date || ', Start Time: ' || v_start_time  || ', Location: ' || v_location);
    END LOOP;

    CLOSE shifts_cursor;
EXCEPTION
    WHEN OTHERS THEN
        RAISE;
END;
/
