-- #create database

CREATE DATABASE bellabeat_analysis

-- #verify connection
SELECT current_database();

-- #create table for cleaned data
DROP TABLE IF EXISTS activity_sleep;

CREATE TABLE activity_sleep (
 user_id BIGINT,
 date DATE,
 steps INT,
 total_distance NUMERIC(6,2),
 tracker_distance NUMERIC(6,2),
 logged_distance NUMERIC(6,2),
 very_active_dist NUMERIC(6,2),
 moderate_active_dist NUMERIC(6,2),
 light_active_dist NUMERIC(6,2),
 sedentary_dist NUMERIC(6,2),
 very_active_min INT,
 fair_active_min INT,
 light_active_mint INT,
 sedentary_min INT,
 calories INT,
 sleep_records INT,
 mints_asleep INT,
 time_bond INT,
 dayofweek TEXT,
 activity_level TEXT,
 sleephours NUMERIC(4,2)
);

-- #checking columns name and data types

SELECT COLUMN_NAME, DATA_TYPE
FROM information_schema.columns
where table_name = 'activity_sleep'

-- # retrieving all columns to check data
SELECT * FROM activity_sleep;


-- ### STARTS EDA OF ACTIVITY SLEEPS OF USERS

-- #Query_1 - Average steps per user

SELECT user_id, ROUND(AVG(steps),2) as avg_daily_steps
FROM activity_sleep
GROUP BY user_id
ORDER BY avg_daily_steps DESC;


-- #Query_2 - Activity Level Distribution

SELECT activity_level, COUNT(*) As days_count
FROM activity_sleep
GROUP BY activity_level
ORDER BY days_count DESC;

-- #Query_3 - Does activity influence calorie burn?

SELECT activity_level, ROUND(AVG(calories),0) As avg_calories
FROM activity_sleep
GROUP BY activity_level
ORDER BY avg_calories DESC;

-- #Query_4 - Does activity affect sleep duration?

SELECT activity_level, ROUND(AVG(mints_asleep)/60.0,2) As avg_sleep_hours
FROM activity_sleep
GROUP BY activity_level
ORDER BY avg_sleep_hours DESC;


-- #inserted new column for sleep efficency

-- ALTER TABLE activity_sleep
-- ADD COLUMN sleep_efficiency NUMERIC(4,2);

-- UPDATE activity_sleep
-- SET sleep_efficiency = ROUND(mints_asleep::numeric / NULLIF(time_bond, 0), 2);


SELECT * FROM activity_sleep;

-- #Query_5 - Sleep quality?

SELECT activity_level, ROUND(AVG(sleep_efficiency)*100,2) As avg_sleep_efficiency_pct
FROM activity_sleep
GROUP BY activity_level
ORDER BY avg_sleep_efficiency_pct DESC;


-- #Query_6 - Weekday vs weekend behavior?

SELECT dayofweek, ROUND(AVG(steps),0) As avg_steps
FROM activity_sleep
GROUP BY dayofweek
ORDER BY avg_steps DESC;


-- #Query_7 - Consitency check

SELECT user_id, COUNT(DISTINCT date) As active_days
FROM activity_sleep
GROUP BY user_id
ORDER BY active_days DESC;



## Key Insights from SQL Analysis
-- A small group of users are very active, while most users are moderately or less active.
-- Most activity records fall under High and Medium activity levels, showing users are generally active.
-- High activity users burn the most calories around 2500+ calories per day, while low activity users burn much less.
-- Low activity users sleep slightly longer on average than high activity users.
-- Sleep efficency is high for all users 90%+ but it is slightly lower for highly active users, possibly due to physial fatigue.
-- Saturday is the most active day, while Sunday has the lowest average steps, showing a clear weekend pattern.
-- Only a few users are consistently active every day, while many users are active for fewer days.


# Create a Final Analytics View 


CREATE VIEW bellabeat_final_view AS
SELECT user_id, date, dayofweek, activity_level, steps, calories, mints_asleep, time_bond,
ROUND(mints_asleep::numeric/NULLIF(time_bond,0),2) AS sleep_efficiency
FROM activity_sleep;


select *  from bellabeat_final_view






