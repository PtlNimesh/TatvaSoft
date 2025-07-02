CREATE DATABASE College;

USE College;
CREATE TABLE Students(
enroll_no INT NOT NULL PRIMARY KEY,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
email VARCHAR(255) UNIQUE NOT NULL,
department VARCHAR(255),
department_code INT NOT NULL
);


INSERT INTO Students(enroll_no,first_name,last_name,email,department,department_code)
VALUES(104,'Nimesh','Patel','nimeshpatel@gmail.com','Computer',07);

INSERT INTO Students (enroll_no, first_name, last_name, email, department, department_code) VALUES
(1001, 'Aarav', 'Shah', 'aarav.shah@example.com', 'Computer Engineering', 101),
(1002, 'Ishita', 'Patel', 'ishita.patel@example.com', 'Information Technology', 102),
(1003, 'Rahul', 'Mehta', 'rahul.mehta@example.com', 'Mechanical Engineering', 103),
(1004, 'Sneha', 'Desai', 'sneha.desai@example.com', 'Electrical Engineering', 104),
(1005, 'Dev', 'Trivedi', 'dev.trivedi@example.com', 'Civil Engineering', 105),
(1006, 'Nidhi', 'Joshi', 'nidhi.joshi@example.com', 'Computer Engineering', 101),
(1007, 'Karan', 'Bhatt', 'karan.bhatt@example.com', 'Electronics Engineering', 106),
(1008, 'Pooja', 'Rana', 'pooja.rana@example.com', 'Computer Engineering', 101),
(1009, 'Yash', 'Kapadia', 'yash.kapadia@example.com', 'Information Technology', 102),
(1010, 'Riya', 'Vora', 'riya.vora@example.com', 'Civil Engineering', 105),
(1011, 'Manav', 'Solanki', 'manav.solanki@example.com', 'Mechanical Engineering', 103),
(1012, 'Hetvi', 'Dave', 'hetvi.dave@example.com', 'Electrical Engineering', 104),
(1013, 'Tushar', 'Choksi', 'tushar.choksi@example.com', 'Computer Engineering', 101),
(1014, 'Anjali', 'Naik', 'anjali.naik@example.com', 'Information Technology', 102),
(1015, 'Vivek', 'Pandya', 'vivek.pandya@example.com', 'Electronics Engineering', 106);


SELECT * FROM Students;

CREATE TABLE feculties(
id INT,
name VARCHAR(255) NOT NULL,
department_code INT NOT NULL
);

INSERT INTO feculties (id, name, department_code) VALUES
(1, 'Dr. Neha Sharma', 101),
(2, 'Prof. Rajesh Patel', 102),
(3, 'Dr. Meera Desai', 103),
(4, 'Prof. Arvind Joshi', 104),
(5, 'Dr. Snehal Shah', 105),
(6, 'Prof. Ketan Mehta', 106),
(7, 'Dr. Bhavna Trivedi', 101),
(8, 'Prof. Chirag Vyas', 102),
(9, 'Dr. Rupal Dave', 104),
(10, 'Prof. Hemant Rana', 105);


INSERT INTO feculties(id,name,department_code)
VALUES(1,'N.C.Patel',07);

SELECT * FROM feculties;

ALTER TABLE feculties ADD COLUMN age INT;
SELECT * FROM feculties;

SELECT * FROM Students ORDER BY FIRST_name ASC;

SELECT * FROM Students WHERE department_code = 101;

SELECT * FROM Students WHERE first_name LIKE 'A%';

SELECT * FROM Students INNER JOIN feculties ON Students.department_code = feculties.department_code;

SELECT * FROM Students AS s LEFT JOIN feculties AS f on s.department_code = f.department_code;

SELECT s.department_code,
       COUNT(s.enroll_no) AS total_students,
       COUNT(f.id) AS total_faculties
FROM Students AS s
LEFT JOIN feculties AS f ON s.department_code = f.department_code
GROUP BY s.department_code;

SELECT s.department_code,
       COUNT(s.enroll_no) AS total_students
FROM Students AS s
GROUP BY s.department_code
HAVING COUNT(s.enroll_no) > 2;

SELECT * FROM Students
WHERE department_code IN (
    SELECT DISTINCT department_code FROM feculties
);

SELECT enroll_no, first_name, last_name, email
FROM Students AS s
WHERE EXISTS (
    SELECT 1 FROM feculties f WHERE f.department_code = s.department_code
);

UPDATE Students
SET first_name = 'Bansi', last_name = 'Sachade', email = 'bansi.sachade@tatvasoft.com'
WHERE enroll_no = 1001;

DELETE FROM Students WHERE enroll_no = 1011;


