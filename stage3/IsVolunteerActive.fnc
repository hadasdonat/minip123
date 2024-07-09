CREATE OR REPLACE FUNCTION IsVolunteerActive (volunteer_id IN NUMBER)
RETURN VARCHAR2 IS
    v_status VARCHAR2(20);
BEGIN
    SELECT Status INTO v_status
    FROM Volunteers
    WHERE Volunteer_ID = volunteer_id;
    
    RETURN v_status;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Not Found';
    WHEN OTHERS THEN
        RAISE;
END;
/
