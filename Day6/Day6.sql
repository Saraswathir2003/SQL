use studentdb;
-- 1. Create table
CREATE TABLE events (
    id INT PRIMARY KEY,
    event_name VARCHAR(100),
    event_date DATE
);

-- 2. Insert events with different dates
INSERT INTO events (id, event_name, event_date)
VALUES
(1, 'Annual Meeting', '2026-07-15'),
(2, 'Workshop', '2026-08-20'),
(3, 'Conference', '2026-09-10'),
(4, 'Sports Day', '2026-10-05'),
(5, 'Farewell Party', '2026-11-25');

SELECT * FROM events;

-- 3. Use NOW() to display current date & time.
SELECT NOW() AS current_datetime;

-- 4. Format event_date using DATE_FORMAT().
SELECT
    event_name,
    DATE_FORMAT(event_date, '%d-%m-%Y') AS formatted_date
FROM events;

-- 5. Extract YEAR and MONTH from event_date.
SELECT
    event_name,
    YEAR(event_date) AS event_year,
    MONTH(event_date) AS event_month
FROM events;

-- 6. Use CONCAT() to combine event_name and event_date.
SELECT
    CONCAT(event_name, ' - ', event_date) AS event_details
FROM events;
drop table events;