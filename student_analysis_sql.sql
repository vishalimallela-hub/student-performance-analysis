USE student_performance;
CREATE TABLE students (
    school VARCHAR(2),
	sex CHAR(1),
    age INT,
    address CHAR(1),
    famsize VARCHAR(3),
    Pstatus CHAR(1),
    Medu INT,
    Fedu INT,
    Mjob VARCHAR(10),
    Fjob VARCHAR(10),
    reason VARCHAR(12),
    guardian VARCHAR(7),
    traveltime INT,
    studytime INT,
    failures INT,
    schoolsup VARCHAR(3),
    famsup VARCHAR(3),
    paid VARCHAR(3),
    activities VARCHAR(3),
    nursery VARCHAR(3),
    higher VARCHAR(3),
    internet VARCHAR(3),
    romantic VARCHAR(3),
    famrel INT,
    freetime INT,
    goout INT,
    Dalc INT,
    Walc INT,
    health INT,
    absences INT,
    G1 INT,
    G2 INT,
    G3 INT
    );
SELECT COUNT(*) FROM students;
SELECT * FROM students LIMIT 5;
SELECT AVG(G3)
FROM students;

SELECT studytime, AVG(G3)
FROM students
GROUP BY studytime;

SELECT
    CASE
        WHEN studytime = 1 THEN '<2 hours'
        WHEN studytime = 2 THEN '2–5 hours'
        WHEN studytime = 3 THEN '5–10 hours'
        WHEN studytime = 4 THEN '>10 hours'
    END AS study_time_group,
    AVG(G3)
FROM students
GROUP BY studytime;

SELECT
    CASE
        WHEN absences <= 5 THEN '0-5'
        WHEN absences BETWEEN 6 AND 10 THEN '6-10'
        WHEN absences > 10 THEN '>10'
    END AS absence_group,
    AVG(G3)
FROM students
GROUP BY 
    CASE
        WHEN absences <= 5 THEN '0-5'
        WHEN absences BETWEEN 6 AND 10 THEN '6-10'
        WHEN absences > 10 THEN '>10'
    END;

SELECT failures, AVG(G3)
FROM students
GROUP BY failures
ORDER BY failures;

SELECT internet, AVG(G3)
FROM students
GROUP BY internet;

SELECT schoolsup, AVG(G3)
FROM students
GROUP BY schoolsup;

SELECT famsup, AVG(G3)
FROM students
GROUP BY famsup;

SELECT higher, AVG(G3)
FROM students
GROUP BY higher;

SELECT paid, AVG(G3)
FROM students
GROUP BY paid;

SELECT school, sex, AVG(G3)
FROM students
GROUP BY school, sex;

SELECT failures, AVG(G3)
FROM students
WHERE failures >= 1
GROUP BY failures
HAVING AVG(G3) < 10;

SELECT COUNT(*)
FROM students
WHERE guardian IN ('mother','father');

SELECT AVG(G3)
FROM students
WHERE guardian In ('mother','father');

SELECT AVG(G3)
FROM students
WHERE guardian NOT IN ('mother', 'father');

SELECT DISTINCT mjob
FROM students 
WHERE mjob LIKE '%e%';

SELECT DISTINCT fjob
FROM students 
WHERE fjob LIKE '%r';

SELECT DISTINCT mjob
FROM students
WHERE mjob LIKE 's%';

SELECT COUNT(*)
FROM students
WHERE school NOT IN ('GP');

SELECT AVG(G3)
FROM students
WHERE Mjob NOT IN ('at_home', 'other');

SELECT Mjob, AVG(G3)
FROM students
WHERE Mjob NOT IN ('at_home', 'other')
GROUP BY Mjob;

SELECT COUNT(*)
FROM students
WHERE Fjob LIKE '%a%';

SELECT DISTINCT reason
FROM students
WHERE reason LIKE 'h%';

SELECT AVG(G3)
FROM students
WHERE Fjob IN ('teacher', 'health');

SELECT COUNT(*)
FROM students
WHERE Mjob NOT LIKE '%e%';

SELECT school, AVG(G3)
FROM students
WHERE Fjob NOT IN ('other')
GROUP BY school;

SELECT Mjob, AVG(G3)
FROM students
GROUP BY Mjob
ORDER BY AVG(G3) DESC
LIMIT 3;

SELECT school, MIN(G3), MAX(G3)
FROM students
GROUP BY school;

SELECT studytime, AVG(G3), MIN(G3), MAX(G3)
FROM students
GROUP BY studytime;

SELECT failures, AVG(G3)
FROM students
GROUP BY failures
ORDER BY AVG(G3) DESC
LIMIT 3;

SELECT  studytime ,AVG(G3)
FROM students 
GROUP BY  studytime  
ORDER BY AVG(G3) ASC 
LIMIT 2;

select mjob ,max(g3)
from students 
group by mjob 
order  by max(g3) desc  
limit 3;

select school , avg(g3)
from students 
group by school 
order by avg(g3) asc 
limit 2;

SELECT mjob, AVG(g3), COUNT(*)
FROM students
GROUP BY mjob
HAVING COUNT(*) >= 30
ORDER BY AVG(g3) DESC
LIMIT 3;

SELECT COUNT(*)
FROM students
WHERE G3 >= 10;

SELECT COUNT(*), school
FROM students
WHERE G3 >= 10
GROUP BY school;

SELECT school,
       SUM(CASE WHEN G3 >= 10 THEN 1 ELSE 0 END),
       SUM(CASE WHEN G3 < 10 THEN 1 ELSE 0 END)
FROM students
GROUP BY school;

SELECT sex,
       SUM(CASE WHEN G3 >= 10 THEN 1 ELSE 0 END),
       SUM(CASE WHEN G3 < 10 THEN 1 ELSE 0 END)
FROM students
GROUP BY sex;

SELECT COUNT(*), mjob,
       SUM(CASE WHEN G3 >= 10 THEN 1 ELSE 0 END),
       SUM(CASE WHEN G3 < 10 THEN 1 ELSE 0 END)
FROM students
GROUP BY mjob
HAVING COUNT(*) > 30
ORDER BY SUM(CASE WHEN G3 >= 10 THEN 1 ELSE 0 END) DESC;

SELECT mjob,
       SUM(CASE WHEN G3 >= 10 THEN 1 ELSE 0 END) AS satisfactory_count,
       SUM(CASE WHEN G3 >= 10 THEN 1 ELSE 0 END) / COUNT(*) * 100 AS percentage
FROM students
GROUP BY mjob
HAVING COUNT(*) >= 30
ORDER BY percentage DESC;

SELECT school,
       COUNT(*) AS total_students,
       SUM(CASE WHEN G3 >= 10 THEN 1 ELSE 0 END) AS satisfactory_count,
       SUM(CASE WHEN G3 >= 10 THEN 1 ELSE 0 END) / COUNT(*) * 100 AS satisfactory_percentage,
       SUM(CASE WHEN G3 < 10 THEN 1 ELSE 0 END) AS needs_improvement_count,
       SUM(CASE WHEN G3 < 10 THEN 1 ELSE 0 END) / COUNT(*) * 100 AS needs_improvement_percentage
FROM students
GROUP BY school
ORDER BY satisfactory_percentage DESC;

SELECT failures,
       COUNT(*),
       SUM(CASE WHEN G3 >= 10 THEN 1 ELSE 0 END),
       SUM(CASE WHEN G3 >= 10 THEN 1 ELSE 0 END) / COUNT(*) * 100 AS satisfactory_percentage,
       SUM(CASE WHEN G3 < 10 THEN 1 ELSE 0 END),
       SUM(CASE WHEN G3 < 10 THEN 1 ELSE 0 END) / COUNT(*) * 100 AS needs_improvement_percentage
FROM students
GROUP BY failures
ORDER BY satisfactory_percentage DESC;

SELECT COUNT(*)
FROM students
WHERE G3 IS NULL;

SELECT COUNT(*)
FROM students
WHERE G3 IS NOT NULL;

SELECT G3, COALESCE(G3, 0)
FROM students;

SELECT DISTINCT Mjob
FROM students;

SELECT COUNT(DISTINCT Mjob)
FROM students;

SELECT DISTINCT school, sex
FROM students;

SELECT COUNT(*)
FROM students
WHERE sex = 'f' AND school = 'gp';

SELECT COUNT(*)
FROM students
WHERE school = 'gp' OR school = 'ms';

SELECT COUNT(*)
FROM students
WHERE sex = 'f'
  AND (school = 'ms' OR school = 'gp');
  
  SELECT
    SUM(CASE WHEN G3 < 10 THEN 1 ELSE 0 END) AS needs_improvement,
    SUM(CASE WHEN G3 >= 10 THEN 1 ELSE 0 END) AS satisfactory
FROM students
WHERE sex = 'f';

SELECT
    SUM(CASE WHEN G3 < 10 THEN 1 ELSE 0 END) AS needs_improvement,
    SUM(CASE WHEN G3 >= 10 THEN 1 ELSE 0 END) AS satisfactory
FROM students
WHERE sex = 'm';

SELECT
    COUNT(*),
    sex,
    SUM(CASE WHEN G3 >= 10 THEN 1 ELSE 0 END) / COUNT(*) * 100 AS satisfactory_percentage
FROM students
GROUP BY sex
ORDER BY satisfactory_percentage DESC;

SELECT G3
FROM students
WHERE G3 > (
    SELECT AVG(G3)
    FROM students
);

SELECT G3
FROM students
WHERE G3 > (
    SELECT AVG(G3)
    FROM students
    WHERE school = 'GP'
);

SELECT s.G3
FROM students AS s
WHERE G3 > (
    SELECT AVG(G3)
    FROM students
    WHERE school = s.school
);

SELECT g3 
FROM students 
WHERE g3 > (
    SELECT AVG(g3)
    FROM students
);

SELECT G3
FROM students
WHERE G3 BETWEEN (
    SELECT AVG(G3)
    FROM students
) AND 15;

SELECT G3
FROM students
WHERE G3 > (
    SELECT AVG(G3)
    FROM students
    WHERE school = 'MS'
);

SELECT COUNT(*)
FROM students
WHERE G3 > (
    SELECT AVG(G3)
    FROM students
    WHERE school = 'MS'
);

SELECT COUNT(*), school
FROM students
WHERE G3 > (
    SELECT AVG(G3)
    FROM students
)
GROUP BY school
ORDER BY COUNT(*) DESC;