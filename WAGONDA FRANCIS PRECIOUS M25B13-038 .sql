
create database UCU_records;

show databases;

use UCU_records;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender ENUM('M','F') NOT NULL,
    dob DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    program VARCHAR(100) NOT NULL,
    year_of_study INT NOT NULL
);

desc students;

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credit_units INT NOT NULL,
    instructor VARCHAR(100) NOT NULL
);
desc courses;

CREATE TABLE registrations (
    registration_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    academic_year VARCHAR(9) NOT NULL,
    semester ENUM('Semester 1', 'Semester 2') NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

desc registrations;

CREATE TABLE grades (
    grade_id INT PRIMARY KEY,
    registration_id INT NOT NULL,
    marks INT NOT NULL,
    grade VARCHAR(2)  NOT NULL,
    FOREIGN KEY (registration_id) REFERENCES registrations(registration_id)
);

desc grades;

show tables;

INSERT INTO students (student_id, first_name, last_name, gender, dob, email, program, year_of_study) VALUES 
(1,'Erisa','Kigengyi','M','2001-05-14','erisakigengyi@gmail.com','BSc Computer Science',2);
INSERT INTO students (student_id, first_name, last_name, gender, dob, email, program, year_of_study) VALUES
 (2,'Maria','Namugeere','F','2000-08-22','marianamugeere@hotmail.com','BBA Finance',3);
INSERT INTO students (student_id, first_name, last_name, gender, dob, email, program, year_of_study) VALUES 
(3,'Lisah','Nyakato','F','2002-02-10','lisahnyakato@outlook.com','BSc Information Technology',1);
INSERT INTO students (student_id, first_name, last_name, gender, dob, email, program, year_of_study) VALUES 
(4,'Noel','Mulungi','M','1999-11-03','noelmulungi@yahoo.com','LLB Law',4);
INSERT INTO students (student_id, first_name, last_name, gender, dob, email, program, year_of_study) VALUES
 (5,'Dorothy','Nansamba','F','2001-07-18','dorothynansamba@gmail.com','BSC Engineering',2);
INSERT INTO students (student_id, first_name, last_name, gender, dob, email, program, year_of_study) VALUES
 (6,'Peter','Elabu','M','2002-04-29','peterelabu@live.com','BBA Finance',1);
INSERT INTO students (student_id, first_name, last_name, gender, dob, email, program, year_of_study) VALUES
 (7,'Karol','Nakyeyune','F','2000-12-05','karolnakyeyune@protonmail.com','BSc Information Technology',3);
INSERT INTO students (student_id, first_name, last_name, gender, dob, email, program, year_of_study) VALUES 
(8,'Aaliyah','Nabatimba','F','2001-09-14','aaliyahnabatimba@icloud.com','LLB Law',2);
INSERT INTO students (student_id, first_name, last_name, gender, dob, email, program, year_of_study) VALUES
 (9,'Calvin','Wasswa','M','1998-05-22','calvinwasswa@gmail.com','BSc Engineering',5);
INSERT INTO students (student_id, first_name, last_name, gender, dob, email, program, year_of_study) VALUES 
(10,'Sanyu','Namazzi','F','2002-06-30','sanyunamazzi@outlook.com','BSc Computer Sceincce',1);

select* from students;

INSERT INTO courses (course_id, course_name, credit_units, instructor) VALUES
(1, 'Database Systems', 3, 'Dr. Ocen'),
(2, 'Programming Fundamentals', 4, 'Ms. Nakato'),
(3, 'Business Management', 3, 'Mr. Okello'),
(4, 'Mathematical Modelling', 3, 'Dr. Lwanga'),
(5, 'Criminal Law', 3, 'Dr. Nandutu');

select*from courses;

INSERT INTO registrations (registration_id, student_id, course_id, academic_year, semester) VALUES
(1, 1, 1, '2024/2025', 'Semester 1'),
(2, 1, 2, '2024/2025', 'Semester 1'),
(3, 1, 4, '2024/2025', 'Semester 2'),
(4, 2, 2, '2024/2025', 'Semester 1'),
(5, 2, 3, '2024/2025', 'Semester 2'),
(6, 3, 1, '2024/2025', 'Semester 1'),
(7, 3, 5, '2024/2025', 'Semester 2'),
(8, 4, 4, '2024/2025', 'Semester 1'),
(9, 4, 3, '2024/2025', 'Semester 1'),
(10, 4, 1, '2024/2025', 'Semester 2');

select*from registrations;

INSERT INTO grades (grade_id, registration_id, marks, grade) VALUES (1, 1, 75, 'A');
INSERT INTO grades (grade_id, registration_id, marks, grade) VALUES (2, 2, 68, 'B');
INSERT INTO grades (grade_id, registration_id, marks, grade) VALUES (3, 3, 49, 'F');
INSERT INTO grades (grade_id, registration_id, marks, grade) VALUES (4, 4, 85, 'A');
INSERT INTO grades (grade_id, registration_id, marks, grade) VALUES (5, 5, 58, 'C');
INSERT INTO grades (grade_id, registration_id, marks, grade) VALUES (6, 6, 47, 'F');
INSERT INTO grades (grade_id, registration_id, marks, grade) VALUES (7, 7, 61, 'B');
INSERT INTO grades (grade_id, registration_id, marks, grade) VALUES (8, 8, 90, 'A');
INSERT INTO grades (grade_id, registration_id, marks, grade) VALUES (9, 9, 66, 'B');
INSERT INTO grades (grade_id, registration_id, marks, grade) VALUES (10, 10, 53,'C');

select* from grades;

## QUERIES

###Students with more than 2 courses

SELECT students.*
FROM students 
JOIN registrations  ON students.student_id = registrations.student_id
GROUP BY students.student_id
HAVING COUNT(registrations.course_id) > 2;

##Student course registration and grades

SELECT students.first_name, students.last_name, courses.course_name, grades.marks, grades.grade
FROM students 
JOIN registrations  ON students.student_id = registrations.student_id
JOIN courses  ON registrations.course_id = courses.course_id
JOIN grades  ON registrations.registration_id = grades.registration_id;

### Average mark per course

SELECT courses.course_name, AVG(marks) AS average_mark
FROM courses 
JOIN registrations ON courses.course_id = registrations.course_id
JOIN grades  ON registrations.registration_id = grades.registration_id
GROUP BY courses.course_name;

####Students who failed

SELECT students.first_name, students.last_name, courses.course_name, grades.marks
FROM students 
JOIN registrations  ON students.student_id = registrations.student_id
JOIN courses  ON registrations.course_id = courses.course_id
JOIN grades ON registrations.registration_id = grades.registration_id
WHERE grades.marks < 50;

#### Create view showinng Student performance per semester

CREATE VIEW student_performance AS
SELECT students.student_id, students.first_name, students.last_name, registrations.academic_year, registrations.semester, courses.course_name, grades.marks, grades.grade
FROM students 
JOIN registrations  ON students.student_id = registrations.student_id
JOIN courses  ON registrations.course_id = courses.course_id
JOIN grades  ON registrations.registration_id = grades.registration_id;

select*from student_performance;


### Total enrollments per course

SELECT courses.course_name, COUNT(registrations.student_id) AS total_enrollments
FROM courses 
JOIN registrations  ON courses.course_id = registrations.course_id
GROUP BY courses.course_name;