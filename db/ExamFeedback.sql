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
exam_date date
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
q_number INT NOT NULL,
general_feedback VARCHAR(30),
specific_feedback TEXT
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

SELECT 
e.id AS 'exam_id', 
e.exam_date AS 'date', 
e.name, 
s.id AS 'stud_id', 
s.firstname, 
s.lastname 
FROM exam e 
JOIN exam_student j ON e.id = j.exam_id 
JOIN student s ON s.id = j.student_id;

SELECT
e.id AS 'exam_id', 
e.exam_date AS 'date', 
e.name, 
s.id AS 'stud_id', 
s.firstname, 
s.lastname 
FROM exam e 
JOIN exam_student j ON e.id = j.exam_id 
JOIN student s ON s.id = j.student_id AND exam_date = '2026-07-25';

SELECT 
e.id AS 'exam_id', 
e.exam_date AS 'date', 
e.NAME, s.id AS'stud_id', 
s.firstname, 
s.lastname 
FROM exam e 
JOIN exam_student j ON e.id = j.exam_id 
JOIN student s ON s.id = j.student_id 
WHERE e.exam_date = '2026-07-27' AND s.id = 4;




