USE SchoolSchedulingExample;
show tables;


SELECT * FROM STUDENT_SCHEDULES;
SELECT * FROM CLASSES;
SELECT * FROM SUBJECTS;

#	“Show me the students who have an average score of 85 or better in Art and who also have an average score of 85 or better in Computer Science.”
#	“List the subjects taught on Wednesday.”
SELECT SUBJECTNAME
FROM SUBJECTS
INNER JOIN CLASSES
ON SUBJECTS.SUBJECTID = CLASSES.SUBJECTID
AND WednesdaySchedule = 1;

SELECT DISTINCT Subjects.SubjectName
FROM Subjects
INNER JOIN Classes
ON Subjects.SubjectID
= Classes.SubjectID
WHERE Classes.WednesdaySchedule = 1;



#	“Show me an alphabetical list of all the staff members and their salariesif they make between $40,000 and $50,000 a year.”
SELECT StfFirstName, StfLastName
FROM Staff
WHERE Salary BETWEEN 40000 AND 50000;

#	“Give me a list of students—along with their phone numbers—whose last names begin with the letter B.”
SELECT StudFirstName, StudLastName, StudPhoneNumber
from Students
WHERE StudLastName BETWEEN 'B' AND 'Bz';

#	“List how many years each staff member has been with the school as of October 1, 2007, and sort the result by last name and first name.”
SELECT StfFirstName, StfLastName, CAST(CAST(DateHired AS DATE) - '10-01-2007'/365 AS UNSIGNED) AS yearsServed
from staff;

SELECT StfLastName || ', ' || StfFirstName AS Staff, DateHired,
DATEDIFF(DateHired, "2007-10-01")/365 AS Years
FROM Staff
ORDER BY StfLastName, StfFirstName;

SELECT StfFirstName, StfLastName
FROM Staff
WHERE DateHired
BETWEEN '1986-07-01' AND '1986-07-31'
