--main
DECLARE
    v_city_name VARCHAR2(255) := 'Fremont';
    v_start_date DATE := TO_DATE('01-JAN-2020', 'DD-MON-YYYY');
    v_end_date DATE := TO_DATE('31-DEC-2023', 'DD-MON-YYYY');
    v_total_events NUMBER;
    v_event_details SYS_REFCURSOR;
    v_event_id VARCHAR2(255);
    v_event_date DATE;
    v_location VARCHAR2(255);
    v_description VARCHAR2(255);
    v_total_volunteers VARCHAR2(255);

BEGIN
    --call-PrintVolunteerShifts
    DBMS_OUTPUT.PUT_LINE('---volunteerShifts ---');
    PrintVolunteerShiftsB(v_start_date, v_end_date);

    --call-CountEventsInCity
    DBMS_OUTPUT.PUT_LINE('--- amount of event in the city ---');
    v_total_events := CountEventsInCity(v_city_name,v_start_date, v_end_date);
    DBMS_OUTPUT.PUT_LINE('  city' || v_city_name || 'num of events: ' || v_total_events);

    --call-GetEventDetailsByCity
    DBMS_OUTPUT.PUT_LINE('---    city event details  ---');
    v_event_details := GetEventDetailsByCity(v_city_name,v_start_date, v_end_date );

    --loop over data-Ref Cursor
    LOOP
        FETCH v_event_details INTO v_event_id, v_event_date, v_location, v_description, v_total_volunteers;
        EXIT WHEN v_event_details%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(' event id: ' || v_event_id || ', descryption: ' || v_description || ', date: ' || v_event_date || ', location: ' || v_location || ', volunteers : ' || v_total_volunteers);
    END LOOP;

    -- close-Ref Cursor
    CLOSE v_event_details;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('no data found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: ' || SQLERRM);
END;
