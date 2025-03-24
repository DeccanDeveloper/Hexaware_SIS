INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number) 
VALUES ('John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890');

INSERT INTO Enrollments (student_id, course_id, enrollment_date) 
VALUES (1, 2, CURDATE());

UPDATE Teachers 
SET email = 'new.email@example.com' 
WHERE teacher_id = 1;

DELETE FROM Enrollments 
WHERE student_id = 1 AND course_id = 2;

UPDATE Courses 
SET teacher_id = 1 
WHERE course_id = 3;

DELETE FROM Enrollments WHERE student_id = 1;
DELETE FROM Students WHERE student_id = 1;

UPDATE Payments 
SET amount = 5000 
WHERE payment_id = 5;
