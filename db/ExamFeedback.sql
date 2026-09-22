DROP DATABASE IF EXISTS feedback;
CREATE DATABASE feedback;
USE feedback;

DROP TABLE IF EXISTS student;
CREATE TABLE student
( id INT PRIMARY KEY AUTO_INCREMENT,
username VARCHAR(30) NOT NULL,
password VARCHAR(30),
firstname VARCHAR(30) NOT NULL,
lastname VARCHAR(30) NOT NULL
);

describe student;

DROP TABLE IF EXISTS exam;
CREATE TABLE exam
( id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(30) NOT NULL,
exam_date DATE 
);

describe exam;

DROP TABLE IF EXISTS exam_student;
CREATE TABLE exam_student
( exam_id INT NOT NULL,
student_id INT NOT NULL, 
FOREIGN KEY (exam_id) REFERENCES exam(id),
FOREIGN KEY (student_id) REFERENCES student(id)
);

describe exam_student;

DROP TABLE IF EXISTS feedback;
CREATE TABLE feedback
(
id INT PRIMARY KEY AUTO_INCREMENT,
exam_id INT NOT NULL,
q_number INT NOT NULL,
general_feedback VARCHAR(30),
specific_feedback TEXT,
FOREIGN KEY (exam_id) REFERENCES exam(id)
);

describe feedback;

-- INSERT

INSERT INTO student (username, password, firstname, lastname)
VALUES
('sinead', 'sinead123', 'Sinéad', 'Cleary'),
('martha', 'martha1', 'Martha', 'Cleary'),
('grace', 'grace1', 'Grace', 'Cleary'),
('mary', 'mary1', 'Mary', 'Kennedy');

SELECT * FROM STUDENT;

INSERT INTO exam (name, exam_date)
VALUES
('Physics', '2026-07-25'),
('Human Factors', '2026-07-26'),
('Aerodynamics', '2026-07-27'),
('Electrical Fund', '2026-07-28');

SELECT * FROM exam;

INSERT INTO exam_student
VALUES
(1,1),
(1,2),
(1,3),
(1,4),
(2,1),
(2,2),
(2,3),
(2,4),
(3,1),
(3,2),
(3,3),
(3,4),
(4,1);

SELECT * FROM exam_student;

-- JOIN TABLES

-- Select a student's exam
SELECT 
e.id AS 'exam_id', 
DATE_FORMAT(e.exam_date, "%d-%m-%Y") AS 'date', 
e.name AS 'exam_name', 
s.id AS 'stud_id', 
s.username,
s.firstname, 
s.lastname 
FROM exam e 
JOIN exam_student j ON e.id = j.exam_id 
JOIN student s ON s.id = j.student_id
WHERE s.id = 1
ORDER BY date DESC;

-- Select all feedback
SELECT 
f.id, f.exam_id, f.q_number, f.general_feedback, f.specific_feedback,
DATE_FORMAT(e.exam_date, "%d-%m-%Y") AS 'date', e.name AS 'exam_name'
FROM feedback f
JOIN exam e ON f.exam_id = e.id;

-- Get a student
SELECT s.id, s.username, s.firstname, s.lastname FROM student s
WHERE username = 'sinead' AND password = 'sinead123';





