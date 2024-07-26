DECLARE
    v_first_name VARCHAR2(50) := 'Yossi';
    v_last_name VARCHAR2(50) := 'Cohen';
    v_address VARCHAR2(255) := '123 Main St';
    v_phone_number NUMBER := 1234567890;
    v_email VARCHAR2(100) := 'yossi@example.com';
    v_role_id NUMBER := 1;
    v_volunteer_role VARCHAR2(255) := 'General';
    v_status VARCHAR2(20) := 'Active';
    v_volunteer_count NUMBER;
    v_active_volunteers SYS_REFCURSOR;
    v_volunteer_id Volunteers.Volunteer_ID%TYPE;
    v_active_first_name Volunteers.First_Name%TYPE;
    v_active_last_name Volunteers.Last_Name%TYPE;
    v_active_email Volunteers.Email%TYPE;
BEGIN
    -- Attempting to add a new volunteer
    DBMS_OUTPUT.PUT_LINE('Attempting to add a new volunteer...');
    add_volunteer(v_first_name, v_last_name, v_address, v_phone_number, v_email, v_role_id, v_volunteer_role, v_status);

    -- Getting the count of volunteers for a specific role
    v_volunteer_count := GetVolunteerRoleCount(v_role_id);
    DBMS_OUTPUT.PUT_LINE('The number of volunteers with Role_ID=' || v_role_id || ' is: ' || v_volunteer_count);

    -- Fetching active volunteers
    DBMS_OUTPUT.PUT_LINE('Fetching active volunteers...');
    v_active_volunteers := IsActive;

    LOOP
        FETCH v_active_volunteers INTO v_volunteer_id, v_active_first_name, v_active_last_name, v_active_email;
        EXIT WHEN v_active_volunteers%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Active Volunteer: ' || v_active_first_name || ' ' || v_active_last_name || ', Email: ' || v_active_email);
    END LOOP;

    CLOSE v_active_volunteers;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error in the main program: ' || SQLERRM);
END;

