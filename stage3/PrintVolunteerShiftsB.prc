CREATE OR REPLACE PROCEDURE PrintVolunteerShiftsB (
    p_start_date IN DATE,
    p_end_date IN DATE
) IS
    CURSOR volunteer_cursor IS
        SELECT v.First_Name, v.Last_Name, COUNT(s.Shift_ID) AS Total_Shifts, v.Role_ID
        FROM Volunteers v
        JOIN VolunteerShiftAllocation vsa ON v.Volunteer_ID = vsa.Volunteer_ID
        JOIN Shifts s ON vsa.Shift_ID = s.Shift_ID
        WHERE vsa.Daate BETWEEN p_start_date AND p_end_date
        GROUP BY v.First_Name, v.Last_Name, v.Role_ID;

    v_first_name Volunteers.First_Name%TYPE;
    v_last_name Volunteers.Last_Name%TYPE;
    v_total_shifts NUMBER;
    v_role_id Volunteers.Role_ID%TYPE;

    -- top volunteer for 2021
    top_volunteer_first_name Volunteers.First_Name%TYPE;
    top_volunteer_last_name Volunteers.Last_Name%TYPE;
    top_volunteer_shifts NUMBER := 0;
    top_volunteer_role_id Volunteers.Role_ID%TYPE;
BEGIN
    -- Open the cursor
    OPEN volunteer_cursor;
    LOOP
        FETCH volunteer_cursor INTO v_first_name, v_last_name, v_total_shifts, v_role_id;
        EXIT WHEN volunteer_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Volunteer: ' || v_first_name || ' ' || v_last_name || ', Total Shifts: ' || v_total_shifts || ', Role ID: ' || v_role_id);


        IF v_total_shifts >= 1 AND v_role_id = 4 THEN
            DECLARE
                v_shift_count_2021 NUMBER;
            BEGIN
                SELECT COUNT(*)
                INTO v_shift_count_2021
                FROM VolunteerShiftAllocation vsa
                WHERE vsa.Volunteer_ID = (SELECT Volunteer_ID FROM Volunteers WHERE First_Name = v_first_name AND Last_Name = v_last_name)
                AND EXTRACT(YEAR FROM vsa.Daate) = 2021;

                IF v_shift_count_2021 > 0 AND v_total_shifts > top_volunteer_shifts THEN
                    top_volunteer_first_name := v_first_name;
                    top_volunteer_last_name := v_last_name;
                    top_volunteer_role_id := v_role_id;
                    top_volunteer_shifts := v_total_shifts;
                END IF;
            END;
        END IF;
    END LOOP;
    -- Close the cursor
    CLOSE volunteer_cursor;

    -- Print the top volunteer details
    IF top_volunteer_shifts > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Top Volunteer of 2021: ' || top_volunteer_first_name || ' ' || top_volunteer_last_name || ', Role ID: ' || top_volunteer_role_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('No top volunteer found for 2021.');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
