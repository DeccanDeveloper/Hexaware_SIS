SELECT AVG(student_count) AS avg_students_per_course
FROM (SELECT course_id, COUNT(student_id) AS student_count FROM Enrollments GROUP BY course_id) AS course_enrollments;

SELECT s.student_id, s.first_name, s.last_name, SUM(p.amount) AS total_payment
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.student_id
HAVING total_payment = (SELECT MAX(total_payment) FROM (SELECT SUM(amount) AS total_payment FROM Payments GROUP BY student_id) AS max_pay);

SELECT c.course_id, c.course_name, COUNT(e.student_id) AS enrollment_count
FROM Courses c
JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id
HAVING enrollment_count = (SELECT MAX(enrollment_count) FROM (SELECT course_id, COUNT(student_id) AS enrollment_count FROM Enrollments GROUP BY course_id) AS max_enrolled);

SELECT t.teacher_id, t.first_name, t.last_name, (SELECT SUM(p.amount) FROM Payments p JOIN Enrollments e ON p.student_id = e.student_id JOIN Courses c ON e.course_id = c.course_id WHERE c.teacher_id = t.teacher_id) AS total_payments 
FROM Teachers t;

SELECT s.student_id, s.first_name, s.last_name
FROM Students s
WHERE (SELECT COUNT(DISTINCT e.course_id) FROM Enrollments e WHERE e.student_id = s.student_id) = (SELECT COUNT(*) FROM Courses);

SELECT t.teacher_id, t.first_name, t.last_name
FROM Teachers t
WHERE NOT EXISTS (SELECT 1 FROM Courses c WHERE c.teacher_id = t.teacher_id);

SELECT AVG(YEAR(CURRENT_DATE) - YEAR(date_of_birth)) AS average_age
FROM Students;

SELECT course_id, course_name
FROM Courses
WHERE course_id NOT IN (SELECT DISTINCT course_id FROM Enrollments);

SELECT s.student_id, s.first_name, s.last_name, c.course_id, c.course_name, SUM(p.amount) AS total_paid
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.student_id, c.course_id;

SELECT s.student_id, s.first_name, s.last_name, COUNT(p.payment_id) AS payment_count
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.student_id
HAVING payment_count > 1;

SELECT s.student_id, s.first_name, s.last_name, SUM(p.amount) AS total_paid
FROM Students s
LEFT JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.student_id;

SELECT c.course_id, c.course_name, COUNT(e.student_id) AS student_count
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id;

SELECT AVG(p.amount) AS average_payment
FROM Payments p;
