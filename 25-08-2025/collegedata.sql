create database university;
use university;
CREATE TABLE College (
    college_id INT PRIMARY KEY AUTO_INCREMENT,
    college_name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);
CREATE TABLE Department (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(100) NOT NULL,
    college_id INT,
    FOREIGN KEY (college_id) REFERENCES College(college_id)
);
CREATE TABLE Student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    age INT,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

INSERT INTO College (college_name, location) VALUES
('Satyabama', 'Chennai'),
('SRM', 'Bangalore');

INSERT INTO Department (dept_name, college_id) VALUES
('Computer Science', 1),
('Mechanical Engineering', 1),
('Commerce', 2),
('English Literature', 2);

INSERT INTO Student (student_name, age, dept_id) VALUES
('Ravi Kumar', 20, 1),
('Priya Sharma', 21, 1),
('Arun Mehta', 22, 2),
('Divya Reddy', 19, 3),
('Kiran Nair', 20, 4);

select* from student;
select* from department;
select* from college;

CREATE TABLE StudentLikes (
    like_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    liked_by VARCHAR(100), 
    like_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);

CREATE TABLE StudentViews (
    view_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    viewed_by VARCHAR(100), 
    view_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);

INSERT INTO StudentLikes (student_id, liked_by) VALUES
(1, 'Rahul'),
(1, 'Sneha'),
(2, 'Amit'),
(3, 'Priya'),
(3, 'John');

INSERT INTO StudentViews (student_id, viewed_by) VALUES
(1, 'Meena'),
(1, 'Vikram'),
(2, 'Ravi'),
(2, 'Suresh'),
(3, 'Neha'),
(3, 'Kiran'),
(3, 'Alok');
SELECT 
    s.student_id,
    s.student_name AS Name,
    d.dept_name AS Department,
    c.college_name AS College,
    COUNT(DISTINCT l.like_id) AS Likes,
    COUNT(DISTINCT v.view_id) AS Views
FROM Student s
JOIN Department d ON s.dept_id = d.dept_id
JOIN College c ON d.college_id = c.college_id
LEFT JOIN StudentLikes l ON s.student_id = l.student_id
LEFT JOIN StudentViews v ON s.student_id = v.student_id
GROUP BY s.student_id, s.student_name, d.dept_name, c.college_name;
CREATE VIEW StudentStats AS
SELECT 
    s.student_id,
    s.student_name AS Name,
    d.dept_name AS Department,
    c.college_name AS College,
    COUNT(DISTINCT l.like_id) AS Likes,
    COUNT(DISTINCT v.view_id) AS Views
FROM Student s
JOIN Department d ON s.dept_id = d.dept_id
JOIN College c ON d.college_id = c.college_id
LEFT JOIN StudentLikes l ON s.student_id = l.student_id
LEFT JOIN StudentViews v ON s.student_id = v.student_id
GROUP BY s.student_id, s.student_name, d.dept_name, c.college_name;

SELECT * FROM  StudentStats;