CREATE OR REPLACE PROCEDURE UpdateVolunteerStatus (
    volunteer_id IN NUMBER,
    new_status IN VARCHAR2
) IS
BEGIN
    UPDATE Volunteers
    SET Status = new_status
    WHERE Volunteer_ID = volunteer_id;
    
    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Volunteer not found.');
    WHEN OTHERS THEN
        RAISE;
END;
/
