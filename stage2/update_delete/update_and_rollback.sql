CREATE OR REPLACE PROCEDURE UpdateVolunteerStatus IS
BEGIN
    UPDATE Volunteers
    SET Status = 'done'
    WHERE Status = 'in process';
    
END;
/
BEGIN
    UpdateVolunteerStatus;
END;
/
UPDATE Volunteers
SET Status = 'i'
WHERE Volunteer_ID = 10000300;


  SELECT *
FROM Volunteers
WHERE Volunteer_ID = 10000300


  ROLLBACK;
