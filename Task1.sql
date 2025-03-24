CREATE DATABASE SISDB;
USE SISDB;
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL
);
CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL CHECK (credits > 0),
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id) ON DELETE SET NULL
);
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrollment_date DATE NOT NULL DEFAULT (CURDATE()),
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);
CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    amount DECIMAL(10,2) NOT NULL CHECK (amount > 0),
    payment_date DATE NOT NULL DEFAULT (CURDATE()),
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE
);

INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number) VALUES
('Manovishaal', 'D', '2004-04-29', 'manovishaal@gmail.com', '9345678901'),
('Jeyasundar', 'R', '2004-04-29', 'jeyasundar@gmail.com', '9678901234'),
('Promoth', 'V', '2004-05-02', 'promoth@gmail.com', '9456789012'),
('Pranesh', 'R', '2004-01-18', 'rspranesh18@gmail.com', '8489289898'),
('Calvin', 'M', '2004-09-11', 'calvin@gmail.com', '9567890523'),
('Naren', 'P', '2004-09-11', 'naren@gmail.com', '9567890123'),
('Ahamed', 'T', '2004-01-29', 'ahamed@gmail.com', '9678991234'),
('Dhanush', 'T', '2004-07-08', 'dhanush@gmail.com', '8489289818'),
('Jeeva', 'S', '2004-08-29', 'joseph@gmail.com', '8345678901'),
('Hari', 'T', '2004-06-12', 'hari@gmail.com', '9456289012');

INSERT INTO Courses (course_name, credits, teacher_id) VALUES
('Mathematics', 4, 1),
('Physics', 3, 2),
('Chemistry', 3, 3),
('Computer Science', 4, 4),
('Biology', 3, 5),
('History', 2, 6),
('Philosophy', 2, 7),
('Economics', 3, 8),
('Psychology', 3, 9),
('Political Science', 3, 10);

INSERT INTO Teacher (first_name, last_name, email) VALUES
('Albert', 'Einstein', 'albert.einstein@example.com'),
('Isaac', 'Newton', 'isaac.newton@example.com'),
('Marie', 'Curie', 'marie.curie@example.com'),
('Alan', 'Turing', 'alan.turing@example.com'),
('Charles', 'Darwin', 'charles.darwin@example.com'),
('Napoleon', 'Bonaparte', 'napoleon.bonaparte@example.com'),
('Socrates', 'Philosopher', 'socrates@example.com'),
('Adam', 'Smith', 'adam.smith@example.com'),
('Sigmund', 'Freud', 'sigmund.freud@example.com'),
('Plato', 'Thinker', 'plato@example.com');

INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2025-04-01'),
(2, 2, '2025-04-02'),
(3, 3, '2025-04-03'),
(4, 4, '2025-04-04'),
(5, 5, '2025-04-05'),
(6, 6, '2025-04-06'),
(7, 7, '2025-04-07'),
(8, 8, '2025-04-08'),
(9, 9, '2025-04-09'),
(10, 10, '2025-04-10');

INSERT INTO Payments (student_id, amount, payment_date) VALUES
(1, 1000.00, '2025-04-01'),
(2, 1500.00, '2025-04-02'),
(3, 1200.00, '2025-04-03'),
(4, 2000.00, '2025-04-04'),
(5, 1800.00, '2025-04-05'),
(6, 1700.00, '2025-04-06'),
(7, 1600.00, '2025-04-07'),
(8, 1900.00, '2025-04-08'),
(9, 1400.00, '2025-04-09'),
(10, 1100.00, '2025-04-10');
