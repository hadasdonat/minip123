CREATE OR REPLACE FUNCTION GetVolunteerRoleCount(p_role_id IN NUMBER) RETURN NUMBER
IS
    v_count INTEGER := 0;
    CURSOR vol_cursor IS
        SELECT COUNT(*)
        FROM Volunteers
        WHERE Role_ID = p_role_id;
BEGIN
    OPEN vol_cursor;
    FETCH vol_cursor INTO v_count;
    CLOSE vol_cursor;
    RETURN v_count;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('שגיאה בקבלת מספר המתנדבים לתפקיד: ' || SQLERRM);
        RETURN -1;
END
/
