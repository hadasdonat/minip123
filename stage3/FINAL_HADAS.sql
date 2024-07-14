

DECLARE
    v_first_name VARCHAR2(50) := 'יוסי';
    v_last_name VARCHAR2(50) := 'כהן';
    v_email VARCHAR2(100) := 'yossi@example.com';
    v_role_id NUMBER := 1;
    v_event_id NUMBER := 2; -- הוסף את מזהה האירוע הרצוי
    v_volunteer_count NUMBER;
BEGIN
    -- קריאה לפונקציה להוספת מתנדב חדש
    DBMS_OUTPUT.PUT_LINE('Attempting to add a new volunteer...');
    add_volunteer(v_first_name, v_last_name, v_email, v_role_id);

 
    DBMS_OUTPUT.PUT_LINE('Updating volunteers and generating report...');
    UpdateAndReportVolunteers(p_role_id => v_role_id, p_event_id => v_event_id, p_new_status => 'Active');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error in the main program: ' || SQLERRM);
END;

