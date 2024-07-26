CREATE OR REPLACE FUNCTION CountEventsInCity (
    p_city_name IN VARCHAR2,
    p_start_date IN DATE,
    p_end_date IN DATE
) RETURN NUMBER IS
    v_event_count NUMBER := 0;
    CURSOR event_cursor IS
        SELECT Event_ID
        FROM EEvents
        WHERE LOocation = p_city_name
        AND Event_Date BETWEEN p_start_date AND p_end_date;
    v_event_id EEvents.Event_ID%TYPE;
BEGIN
    -- Open the cursor
    OPEN event_cursor;
    LOOP
        FETCH event_cursor INTO v_event_id;
        EXIT WHEN event_cursor%NOTFOUND;
        v_event_count := v_event_count + 1;
    END LOOP;
    -- Close the cursor
    CLOSE event_cursor;

    RETURN v_event_count;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RETURN -1; -- Return -1 in case of an error
END;
/
