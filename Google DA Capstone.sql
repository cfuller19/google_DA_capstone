-- Examining daily_activity table
SELECT *
FROM `more-practice-with-sql-416000.Fitness_Tracker.daily_activity_combined`
LIMIT 5;

-- Examining minutes_sleep_031216 table
SELECT *
FROM `more-practice-with-sql-416000.Fitness_Tracker.minute_sleep_031216`
LIMIT 5;

-- Examining minutes_sleep_041216 table
SELECT *
FROM `more-practice-with-sql-416000.Fitness_Tracker.minute_sleep_041216`
LIMIT 5;

-- Checking tables for errors
-- Examining total number of records daily_activity_combined
SELECT COUNT(*)
FROM `more-practice-with-sql-416000.Fitness_Tracker.daily_activity_combined`;

-- Checking for null values in daily_activity_combined
SELECT *
FROM `more-practice-with-sql-416000.Fitness_Tracker.daily_activity_combined`
WHERE user_id IS NULL AND
  activity_date IS NULL AND
  total_steps IS NULL AND
  total_distance IS NULL AND
  tracker_distance IS NULL AND
  logged_activity IS NULL AND
  v_active_dist IS NULL AND
  mod_active_dist IS NULL AND
  light_active_dist IS NULL AND
  sed_active_dist IS NULL AND
  v_active_min IS NULL AND
  mod_active_min IS NULL AND
  light_active_min IS NULL AND
  sed_active_min IS NULL AND
  calories IS NULL;

--Deleting Null Records from daily_activity_combined
DELETE FROM `more-practice-with-sql-416000.Fitness_Tracker.daily_activity_combined`
WHERE user_id IS NULL AND
  activity_date IS NULL AND
  total_steps IS NULL AND
  total_distance IS NULL AND
  tracker_distance IS NULL AND
  logged_activity IS NULL AND
  v_active_dist IS NULL AND
  mod_active_dist IS NULL AND
  light_active_dist IS NULL AND
  sed_active_dist IS NULL AND
  v_active_min IS NULL AND
  mod_active_min IS NULL AND
  light_active_min IS NULL AND
  sed_active_min IS NULL AND
  calories IS NULL;

--Checking for null values in daily_activity_combined
SELECT *
FROM `more-practice-with-sql-416000.Fitness_Tracker.daily_activity_combined`
WHERE user_id IS NULL OR
  activity_date IS NULL OR
  total_steps IS NULL OR
  total_distance IS NULL OR
  tracker_distance IS NULL OR
  logged_activity IS NULL OR
  v_active_dist IS NULL OR
  mod_active_dist IS NULL OR
  light_active_dist IS NULL OR
  sed_active_dist IS NULL OR
  v_active_min IS NULL OR
  mod_active_min IS NULL OR
  light_active_min IS NULL OR
  sed_active_min IS NULL OR
  calories IS NULL;

--Checking for duplicate values in daily_activity_combined
SELECT *
FROM (
  SELECT *,
    COUNT(*) OVER (PARTITION BY user_id, activity_date, total_steps) AS duplicate_count
  FROM `more-practice-with-sql-416000.Fitness_Tracker.daily_activity_combined`
)
WHERE duplicate_count > 1;

-- Examining total number of records minute_sleep_031216
SELECT COUNT(*)
FROM `more-practice-with-sql-416000.Fitness_Tracker.minute_sleep_031216`;

-- Checking for null values in minute_sleep_031216
SELECT *
FROM `more-practice-with-sql-416000.Fitness_Tracker.minute_sleep_031216`
WHERE user_id IS NULL OR
  activity_date IS NULL OR
  sleep_num IS NULL OR
  sleep_stage IS NULL OR
  log_id IS NULL;

--Checking for duplicates in minute_sleep_031216
SELECT *
FROM (
  SELECT *,
    COUNT(*) OVER (PARTITION BY user_id, activity_date, sleep_num, sleep_stage, log_id) AS duplicate_count
  FROM `more-practice-with-sql-416000.Fitness_Tracker.minute_sleep_031216`
)
WHERE duplicate_count > 1;

--Examining total number of records minute_sleep_041216
SELECT COUNT(*)
FROM `more-practice-with-sql-416000.Fitness_Tracker.minute_sleep_041216`;

--Checking for null values
SELECT *
FROM `more-practice-with-sql-416000.Fitness_Tracker.minute_sleep_041216`
WHERE user_id IS NULL OR
  activity_date IS NULL OR
  sleep_num IS NULL OR
  sleep_stage IS NULL OR
  log_id IS NULL;

--Checking for duplicates in minute_sleep_041216
SELECT *
FROM (
  SELECT *,
    COUNT(*) OVER (PARTITION BY user_id, activity_date, sleep_num, sleep_stage, log_id) AS duplicate_count
  FROM `more-practice-with-sql-416000.Fitness_Tracker.minute_sleep_041216`
)
WHERE duplicate_count > 1;

-- Combining minute_sleep_031216 and minute_sleep_041216 into a new table
CREATE TABLE `more-practice-with-sql-416000.Fitness_Tracker.sleep_min_combined` AS
SELECT * FROM `more-practice-with-sql-416000.Fitness_Tracker.minute_sleep_031216`
UNION ALL
SELECT * FROM `more-practice-with-sql-416000.Fitness_Tracker.minute_sleep_041216`;

--Exploratory Data Analysis
-- Identifying number of distinct users in daily_activity_combined table
SELECT COUNT(DISTINCT user_id)
FROM `more-practice-with-sql-416000.Fitness_Tracker.daily_activity_combined`;

-- Identifying number of distinct dates represented in daily_activity_combined table
SELECT
  COUNT(DISTINCT activity_date)
FROM `more-practice-with-sql-416000.Fitness_Tracker.daily_activity_combined`;

--Summary statistics from daily_activity_combined: Identifying how often users are utilizing the Fitbit tracker
SELECT
  AVG(num_sessions) AS avg_num_sessions,
  MIN(num_sessions) AS min_num_sessions,
  MAX(num_sessions) AS max_num_sessions,
  STDDEV(num_sessions) AS sd_num_sessions
FROM (
  SELECT
    COUNT(DISTINCT activity_date) AS num_sessions,
    user_id
  FROM `more-practice-with-sql-416000.Fitness_Tracker.daily_activity_combined`
  GROUP BY user_id
);

-- Examining how the number of Fitbit users varies by date from daily_activity_combined table
SELECT
  activity_date,
  COUNT(DISTINCT user_id)
FROM `more-practice-with-sql-416000.Fitness_Tracker.daily_activity_combined`
GROUP BY activity_date
ORDER BY activity_date;

-- Identifying average number of Fitbit users by day of the week
SELECT
  FORMAT_DATE('%A', activity_date) AS day_of_week,
  AVG(num_users) AS avg_num_users
FROM (
  SELECT
    activity_date,
    COUNT(DISTINCT user_id) AS num_users
  FROM `more-practice-with-sql-416000.Fitness_Tracker.daily_activity_combined`
  GROUP BY activity_date
)
GROUP BY day_of_week
ORDER BY avg_num_users DESC;

-- Examining how many users are manually logging activity from daily_activity_combined table
-- Finding the number of records where logged_activity equals 0 in daily_activity_combined table
SELECT
  COUNT(*)
FROM `more-practice-with-sql-416000.Fitness_Tracker.daily_activity_combined`
WHERE logged_activity = 0;

-- Finding the number of records where logged_activity does not equal 0 in daily_activity_combined table
SELECT
  COUNT(*)
FROM `more-practice-with-sql-416000.Fitness_Tracker.daily_activity_combined`
WHERE logged_activity <> 0;

-- Identifying the number of distinct users logging activity in daily_activity_combined table
SELECT
  COUNT(DISTINCT user_id)
FROM `more-practice-with-sql-416000.Fitness_Tracker.daily_activity_combined`
WHERE logged_activity <> 0;

-- Finding the number of times each user logged activity in daily_activity_combined table
SELECT
  user_id,
  COUNT(*)
FROM `more-practice-with-sql-416000.Fitness_Tracker.daily_activity_combined`
WHERE logged_activity <> 0
GROUP BY user_id;

-- Identifying how consistently users are wearing/using their Fitbit from daily_activity_combined table
SELECT
  CASE
    WHEN frequency < 0.10 THEN 'Less than 10%'
    WHEN frequency BETWEEN 0.10 AND 0.20 THEN '10%-20%'
    WHEN frequency BETWEEN 0.21 AND 0.30 THEN '21%-30%'
    WHEN frequency BETWEEN 0.31 AND 0.40 THEN '31%-40%'
    WHEN frequency BETWEEN 0.41 AND 0.50 THEN '41%-50%'
    WHEN frequency BETWEEN 0.51 AND 0.60 THEN '51%-60%'
    WHEN frequency BETWEEN 0.61 AND 0.70 THEN '61%-70%'
    WHEN frequency BETWEEN 0.71 AND 0.80 THEN '71%-80%'
    WHEN frequency BETWEEN 0.81 AND 0.90 THEN '81%-90%'
    ELSE 'More than 90%'
  END AS frequency_group,
  COUNT(*) AS count
FROM (
  SELECT
    user_id,
    COUNT(*)/62 AS frequency
  FROM
    `more-practice-with-sql-416000.Fitness_Tracker.daily_activity_combined`
  GROUP BY
    user_id
)
GROUP BY
  frequency_group
ORDER BY
  frequency_group;

--Exploratory Data Analysis of the Sleep Data
-- Creating a merged sleep_min_grouped table; grouping sleep minutes by sleep stage (1, 2, or 3)
CREATE TABLE `more-practice-with-sql-416000.Fitness_Tracker.sleep_min_grouped` AS
SELECT
  user_id,
  COUNT(DISTINCT activity_date) AS min_sleep,
  sleep_stage,
  log_id,
  FORMAT_TIMESTAMP('%m-%d-%y', activity_date) AS activity_date
FROM `more-practice-with-sql-416000.Fitness_Tracker.sleep_min_combined`
GROUP BY user_id, log_id, activity_date, sleep_stage
ORDER BY user_id, log_id, activity_date;

--Converting dates into DATE data type in sleep_min_grouped table
CREATE OR REPLACE TABLE `more-practice-with-sql-416000.Fitness_Tracker.sleep_min_grouped` AS
SELECT *,
  CAST(PARSE_DATE('%m-%d-%Y', activity_date) AS DATE) AS date
FROM `more-practice-with-sql-416000.Fitness_Tracker.sleep_min_grouped`;

--Identifying number of distinct users tracking sleep in sleep_min_grouped table
SELECT COUNT(DISTINCT user_id)
FROM `more-practice-with-sql-416000.Fitness_Tracker.sleep_min_grouped`;

--Identifying the number of distinct dates represented in the data from sleep_min_grouped table
SELECT
  COUNT(DISTINCT activity_date)
FROM `more-practice-with-sql-416000.Fitness_Tracker.sleep_min_grouped`;

--Summary statistics of number of sessions Fitbit users are logging sleep, from sleep_min_grouped table
SELECT
  AVG(num_sessions) AS avg_num_sessions,
  MIN(num_sessions) AS min_num_sessions,
  MAX(num_sessions) AS max_num_sessions,
  STDDEV(num_sessions) AS sd_num_sessions
FROM (
  SELECT
    COUNT(DISTINCT log_id) AS num_sessions,
    user_id
  FROM `more-practice-with-sql-416000.Fitness_Tracker.sleep_min_grouped`
  GROUP BY user_id
);

--Identifying the total number of users tracking sleep per date from sleep_min_grouped table
SELECT
  activity_date,
  COUNT(DISTINCT user_id)
FROM `more-practice-with-sql-416000.Fitness_Tracker.sleep_min_grouped`
GROUP BY activity_date
ORDER BY activity_date;

--Identifying how consistently users are tracking sleep, from sleep_min_grouped table
SELECT
  CASE
    WHEN frequency < 0.10 THEN 'Less than 10%'
    WHEN frequency BETWEEN 0.10 AND 0.20 THEN '10%-20%'
    WHEN frequency BETWEEN 0.21 AND 0.30 THEN '21%-30%'
    WHEN frequency BETWEEN 0.31 AND 0.40 THEN '31%-40%'
    WHEN frequency BETWEEN 0.41 AND 0.50 THEN '41%-50%'
    WHEN frequency BETWEEN 0.51 AND 0.60 THEN '51%-60%'
    WHEN frequency BETWEEN 0.61 AND 0.70 THEN '61%-70%'
    WHEN frequency BETWEEN 0.71 AND 0.80 THEN '71%-80%'
    WHEN frequency BETWEEN 0.81 AND 0.90 THEN '81%-90%'
    ELSE 'More than 90%'
  END AS frequency_group,
  COUNT(*) AS count
FROM (
  SELECT
    user_id,
    COUNT(DISTINCT log_id)/62 AS frequency
  FROM
    `more-practice-with-sql-416000.Fitness_Tracker.sleep_min_grouped`
  GROUP BY
    user_id
)
GROUP BY
  frequency_group
ORDER BY
  frequency_group;

--Examining average sleep tracker use by day of the week
SELECT
  FORMAT_DATE('%A', date) AS day_of_week,
  AVG(num_users) AS avg_num_users
FROM (
  SELECT
    date,
    COUNT(DISTINCT user_id) AS num_users
  FROM `more-practice-with-sql-416000.Fitness_Tracker.sleep_min_grouped`
  GROUP BY date
)
GROUP BY day_of_week
ORDER BY avg_num_users DESC;


