SELECT 
    E.Event_ID,
    E.Deescription AS Event_Description,
    R.Report_Type,
    COUNT(*) AS Num_Reports
FROM 
    Eevents E
JOIN 
    Reports R ON E.Event_ID = R.Event_ID
GROUP BY 
    E.Event_ID,
    E.Deescription,
    R.Report_Type;
