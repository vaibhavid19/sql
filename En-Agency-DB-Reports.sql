USE EntertainmentAgencyExample;
show tables;
set sql_mode=PIPES_AS_CONCAT;
SELECT * FROM Engagements;

#	“Display agents and the engagement dates they booked.”

#	“Which engagements do not yet have a contract price?”
SELECT EngagementNumber
FROM Engagements
WHERE ContractPrice IS NULL;

# “Which entertainers do we represent in Seattle, Redmond, and Bothell?”
SELECT EntStageName
FROM Entertainers
WHERE EntCity
IN ('Seattle', 'Redmond', 'Bothell');

#	“Show me all engagements that are scheduled to occur on October 10, 2012.”
SELECT EngagementNumber, StartDate, EndDate
FROM Engagements
WHERE '2012-10-10' BETWEEN StartDate AND EndDate;


#	“How long is each engagement due to run?”
SELECT EngagementNumber,
CAST(CAST(EndDate AS DATE)-CAST(StartDate AS DATE) + 1
AS CHAR) || ' day(s)' AS DueToRun
FROM Engagements;

