-- Abhinav Singh and Jake Veazey
-- asingh54@calpoly.edu and 

-- Q1
SELECT DISTINCT stu.FirstName, stu.LastName, stu.Grade,
				stu2.FirstName, stu2.LastName, stu2.Grade
FROM list stu, list stu2
WHERE stu.FirstName = stu2.FirstName AND stu.LastName < stu2.LastName
;

-- Q2
SELECT stu.FirstName, stu.LastName
FROM list stu, teachers tea
WHERE stu.Classroom = tea.Classroom
	  AND tea.FirstName != "OTHA"
	  AND tea.LastName != "MOYER"
	  AND stu.Grade = 1
ORDER BY
  stu.LastName
;

-- Q3
SELECT COUNT(*) AS "Total"
FROM list stu
WHERE stu.Grade = 3 OR stu.Grade = 4
;

-- Q4
SELECT COUNT(*) AS "Total"
FROM list stu, teachers tea
WHERE 	stu.Classroom = tea.Classroom
		AND tea.FirstName = 'LORIA'
		AND tea.LastName = 'ONDERSMA'
; 