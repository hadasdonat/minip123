CREATE VIEW SortedReports AS
SELECT 
    *
FROM 
    Reports
ORDER BY 
    Report_Type ASC;
