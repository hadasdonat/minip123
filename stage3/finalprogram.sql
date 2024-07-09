SET SERVEROUTPUT ON;

DECLARE
    v_role_id NUMBER;
    v_event_id NUMBER;
    v_activity_id NUMBER;
    v_volunteer_count NUMBER;
BEGIN
    -- הגדרת מזהי תפקיד, אירוע ופעילות
    v_role_id := 1; -- נניח שהתפקיד עם Role_ID=1 קיים
    v_event_id := 1; -- נניח שהאירוע עם Event_ID=1 קיים
    v_activity_id := 1; -- נניח שהפעילות עם Activity_ID=1 קיימת

    -- קריאה לפונקציה GetVolunteerRoleCount
    v_volunteer_count := GetVolunteerRoleCount(v_role_id);
    DBMS_OUTPUT.PUT_LINE('מספר המתנדבים לתפקיד עם Role_ID=' || v_role_id || ' הוא: ' || v_volunteer_count);

    -- קריאה לפרוצדורה GenerateCustomReport
    DBMS_OUTPUT.PUT_LINE('דו"ח מותאם אישית:');
    GenerateCustomReport(p_role_id => v_role_id, p_event_id => v_event_id, p_activity_id => v_activity_id);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('שגיאה: ' || SQLERRM);
END;
/
