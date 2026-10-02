PRAGMA foreign_keys = ON;

-- ============================================================
-- Завдання 1
-- INNER JOIN факт + вимір 1
-- ============================================================

SELECT
    students.full_name AS студент,
    grades.grade AS оцінка,
    grades.date AS дата
FROM grades
INNER JOIN students
    ON grades.student_id = students.id
WHERE grades.grade >= 80
ORDER BY grades.grade DESC;

-- Результат:
-- Тарасюк Олександр | 95 | 2026-09-01
-- Тарасюк Олександр | 91 | 2026-09-03
-- Петренко Максим | 89 | 2026-09-07
-- Петренко Максим | 86 | 2026-09-09
-- Іваненко Андрій | 82 | 2026-09-05


-- ============================================================
-- Завдання 2
-- INNER JOIN усіх трьох таблиць
-- ============================================================

SELECT
    students.full_name AS студент,
    subjects.name AS предмет,
    grades.grade AS оцінка,
    grades.date AS дата
FROM grades
INNER JOIN students
    ON grades.student_id = students.id
INNER JOIN subjects
    ON grades.subject_id = subjects.id
ORDER BY students.full_name, subjects.name;

-- Результат:
-- Іваненко Андрій | Вебтехнології | 78 | 2026-09-06
-- Іваненко Андрій | Програмування | 82 | 2026-09-05
-- Петренко Максим | Бази даних | 89 | 2026-09-07
-- Петренко Максим | Математика | 86 | 2026-09-09
-- Петренко Максим | Операційні системи | 74 | 2026-09-08
-- Тарасюк Олександр | Бази даних | 95 | 2026-09-01
-- Тарасюк Олександр | Вебтехнології | 91 | 2026-09-03
-- Тарасюк Олександр | Програмування | 76 | 2026-09-02


-- ============================================================
-- Завдання 3
-- LEFT JOIN — предмети без жодної оцінки
-- ============================================================

INSERT INTO subjects (name, hours, status)
SELECT 'Штучний інтелект', 60, 'активний'
WHERE NOT EXISTS (
    SELECT 1
    FROM subjects
    WHERE name = 'Штучний інтелект'
);

SELECT
    subjects.id,
    subjects.name,
    subjects.hours,
    subjects.status
FROM subjects
LEFT JOIN grades
    ON grades.subject_id = subjects.id
WHERE grades.id IS NULL;

-- Результат:
-- 6 | Комп'ютерні мережі | 60 | активний
-- 7 | Штучний інтелект | 60 | активний


-- ============================================================
-- Завдання 4
-- Свідома пастка CROSS JOIN
-- ============================================================

SELECT COUNT(*) AS кількість_students
FROM students;

-- Результат:
-- 3

SELECT COUNT(*) AS кількість_subjects
FROM subjects;

PRAGMA foreign_keys = ON;

SELECT
    students.full_name AS студент,
    grades.grade AS оцінка,
    grades.date AS дата
FROM grades
INNER JOIN students
    ON grades.student_id = students.id
WHERE grades.grade >= 80
ORDER BY grades.grade DESC;

SELECT
    students.full_name AS студент,
    subjects.name AS предмет,
    grades.grade AS оцінка,
    grades.date AS дата
FROM grades
INNER JOIN students
    ON grades.student_id = students.id
INNER JOIN subjects
    ON grades.subject_id = subjects.id
ORDER BY students.full_name, subjects.name;

INSERT INTO subjects (name, hours, status)
SELECT 'Штучний інтелект', 60, 'активний'
WHERE NOT EXISTS (
    SELECT 1
    FROM subjects
    WHERE name = 'Штучний інтелект'
);

SELECT
    subjects.id,
    subjects.name,
    subjects.hours,
    subjects.status
FROM subjects
LEFT JOIN grades
    ON grades.subject_id = subjects.id
WHERE grades.id IS NULL;

SELECT COUNT(*)
FROM students;

SELECT COUNT(*)
FROM subjects;

SELECT COUNT(*)
FROM students, subjects;