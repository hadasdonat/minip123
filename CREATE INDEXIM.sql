SELECT
    V.Volunteer_ID,
    V.First_Name,
    V.Last_Name,
    COUNT(SR.Report_ID) AS Num_Reports
FROM 
    Volunteers V
LEFT JOIN 
    SortedReports SR ON V.Volunteer_ID = SR.
GROUP BY 
    V.Volunteer_ID,
    V.First_Name,
    V.Last_Name;

CREATE VIEW EventReportCounts AS
SELECT
    E.Event_ID,
    COUNT(R.Report_ID) AS Num_Reports
FROM
    EEvents E
LEFT JOIN
    Reports R ON E.Event_ID = R.Event_ID
GROUP BY
    E.Event_ID;

SELECT
    E.Event_ID,
    R.Report_ID,
    R.Report_Type
FROM
    EEvents E
JOIN
    Reports R ON E.Event_ID = R.Event_ID
WHERE
    E.Event_ID = 113;
