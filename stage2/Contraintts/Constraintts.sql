SELECT
    R.Report_ID,
    R.Event_ID,
    R.Report_Type,
    R.Report_Deescription
FROM
    Reports R
ORDER BY
    R.Event_ID;
