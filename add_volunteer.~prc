CREATE OR REPLACE PROCEDURE add_volunteer (first_name IN VARCHAR2, last_name IN VARCHAR2, email IN VARCHAR2, role_id IN NUMBER) 
IS
    new_volunteer_id NUMBER;
BEGIN
    -- חישוב מזהה המתנדב הבא
    SELECT NVL(MAX(Volunteer_ID), 0) + 1 INTO new_volunteer_id
    FROM Volunteers;
    
    -- הדפסת המזהה החדש
    DBMS_OUTPUT.PUT_LINE('המזהה החדש הוא: ' || new_volunteer_id);

    -- הדפסת הפרטים שהתקבלו
    DBMS_OUTPUT.PUT_LINE('הכנסת מתנדב: ' || first_name || ' ' || last_name || ', אימייל: ' || email || ', Role ID: ' || role_id);

    -- הוספת הרשומה החדשה עם המזהה המחושב
    INSERT INTO Volunteers (Volunteer_ID, First_Name, Last_Name, Email, Role_ID)
    VALUES (new_volunteer_id, first_name, last_name, email, role_id);
    
    -- הדפסת הודעת הצלחה
    DBMS_OUTPUT.PUT_LINE('המתנדב הוסף בהצלחה.');
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('שגיאה בהוספת מתנדב חדש: ' || SQLERRM);
        ROLLBACK;
END add_volunteer;
/
