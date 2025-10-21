CREATE DATABASE School;

use school;

create table students(
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender enum ('Male', 'Female') NOT NULL,
    date_of_birth DATE not null,
    class_id int,
     foreign key(class_id) references classes(class_id)
);

desc students;

create table classes(
    class_id INT PRIMARY KEY AUTO_INCREMENT,
    class_name VARCHAR(50) NOT NULL,
    teacher_name VARCHAR(100) NOT NULL
);



insert into table students(student_id, first_name, last_name,gen)