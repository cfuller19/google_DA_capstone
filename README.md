**Bellabeat Case Study**

**Google Data Analytics Professional Certification Capstone Project**

**Introduction:**

The Google Data Analytics professional certification program is designed to equip the learner with a solid understanding of the skills and processes a junior or associate data analyst would use in their job. The program is offered through coursera and consists of eight courses to prepare the learner for a position as a junior data analyst.

[?](https://www.coursera.org/learn/foundations-data?specialization=google-data-analytics)**Course 1: Foundations: Data, Data, Everywhere**

[?](https://www.coursera.org/learn/ask-questions-make-decisions?specialization=google-data-analytics)**Course 2: Ask Questions to Make Data-Driven Decisions**

[?](https://www.coursera.org/learn/data-preparation?specialization=google-data-analytics)**Course 3: Prepare Data for Exploration**

[?](https://www.coursera.org/learn/process-data?specialization=google-data-analytics)**Course 4: Process Data from Dirty to Clean**

[?](https://www.coursera.org/learn/analyze-data?specialization=google-data-analytics)**Course 5: Analyze Data to Answer Questions**

[?](https://www.coursera.org/learn/visualize-data?specialization=google-data-analytics)**Course 6: Share Data Through the Art of Visualization**

[?](https://www.coursera.org/learn/data-analysis-r?specialization=google-data-analytics)**Course 7: Data Analysis with R Programming**

[?](https://www.coursera.org/learn/google-data-analytics-capstone?specialization=google-data-analytics)**Course 8: Google Data Analytics Capstone: Complete a Case Study**

This case study was completed to fulfill the requirements of course 8 for this certification program and utilizes the six phases of the data analytic life cycle:

- Ask

- Prepare

- Process

- Analyze

- Share

- Act

**ASK:**

**[About Bellabeat](https://bellabeat.com/)**

Bellabeat is a wellness company founded by Urska Srsen and Sando Mur in 2013. Their focus is on producing high-tech, health-focused products for women. Their current product line includes:

- Bellabeat App - which provides health data on activity, sleep, stress, menstrual cycle, and mindfulness habits to users.

- Leaf - a wearable wellness tracker that can be worn as a bracelet, necklace or clip, and tracks user activity, sleep, and stress.

- Time - a watch wellness tracker that tracks user activity, sleep, and stress.

**Business Task:**

Analyze smart device data to gain insight into how consumers are using their smart devices.

**Stakeholders:**

Findings from this analysis will be presented to the company co founders: Ur?ka Sr?en and Sando Mur along with the Marketing Analytics team at Bellabeat.

**PREPARE:**

**Data:**

By request of Urska Srsen, the data used for this analysis consisted of Fitbit Fitness Tracker Data collected voluntarily from 30 fitbit users March-May of 2016. The data set is CC0: Public Domain, and is made available by the user Mobius through [Kaggle.com](https://www.kaggle.com/datasets/arashnic/fitbit). The dataset is described as containing minute-level output for physical activity, heart rate, and sleep monitoring.

**Step 1:**

Data were downloaded from Kaggle and then uploaded to Google Drive. To make the data contents of each file more clear, the files were renamed following best practices.

- ?Merged? was removed from the file names

- Words were converted to all lowercase (except for METs), and a ?_? was placed between words in a name.

- The date of creation was added to each file: 031216 or 041216

**Step 2:**

The data were then examined to identify the contents and organization of each dataset.

- In general, the data were provided in the long format, with each row representing one point of measurement for each user. Each user (as represented by an id) has multiple rows in each dataset.

- The daily_activity_031216 and daily_activity_041216 datasets contain daily summaries of user activity which are found in the hourly_calories, hourly_intensities, and minute_calories datasets.

**Step 3:**

The credibility of the data was analyzed using the ROCCC method.

- R = reliable

- In general, Kaggle.com is a reliable source to obtain datasets for analysis. This dataset has been downloaded 129,000 times and has a usability rating of 8.75.

- The dataset is described as containing responses from 30 fitbit users, however, during inspection of the daily_activity.csv files, 35 different user ids were found.

- O = original

- The original source of the data was from survey responses via Amazon Mechanical Turk. The data provided on Kaggle appear to be from a secondary party: [https://zenodo.org/records/53894#.YMoUpnVKiP9](https://zenodo.org/records/53894#.YMoUpnVKiP9)  

- C = comprehensive

- The datasets contain a good sampling of the most common measurements fitness/wellness trackers collect. However, the datasets only represent 30 respondents, which is a small sample size. As such, it would be difficult to accurately extrapolate the findings of this analysis to a larger population.

- C = current

- The data are not current, as they are from 2016.

- C = cited

- The data are cited as coming from Amazon Mechanical Turk, however, no link to the original data source is provided. There is a citation to a secondary source: Furberg, Robert; Brinton, Julia; Keating, Michael ; Ortiz, Alexa [https://zenodo.org/record/53894#.YMoUpnVKiP9](https://zenodo.org/record/53894#.YMoUpnVKiP9)

**Step 4:**

For this analysis, my goal for address this business task was to determine how the trackers were being used.

- Are consumers using their trackers every day?

- Are consumers manually recording information or only relying on measurements that are automatically collected?

- Are consumers using the sleep tracking feature?

In examination of the datasets provided, I determined that the daily_activity files and the minutes_sleep files would be appropriate for addressing the business task. The daily_activity files provide a summary of each user?s daily activity and calories, and the sleep data can be analyzed to provide a summary of the user's sleeping habits. If after initial analysis, I want to dig deeper into heart rate and METs, I can add the other datasets into the analysis.

**PROCESS:**

**Step 1:**

I performed an initial examination of the 4 datasets for this analysis, by opening each file in Google Sheets. 

The daily_activity files both contained the same columns:

- Id

- ActivityDate

- TotalSteps

- TotalDistance

- TrackerDistance

- LoggedActivities

- VeryActiveDistance

- ModeratelyActive

- LightActiveDistance

- SedentaryActive

- VeryActiveMinutes

- FairlyActiveMinutes

- LightlyActiveMinutes

- SedentaryMinutes

- Calories

Each file was small enough (458 and 940 records) that I could easily merge them together into one spreadsheet. These files were merged together into a new file: daily_activity_combined using the ?import file? function.

At first glance, the TotalDistance (D) and TrackerDistance (E) columns appeared to contain identical information. To verify this, in an empty column, I wrote the formula: \
=ARRAYFORMULA(D2:D<>E2:E)

This would return TRUE for any records where the value in column D was not equal to the value in column E. To make the TRUE values easier to identify, I also added conditional formatting to turn TRUE cells a yellow color. In examining the results, the majority of values in D matched E, however, there were some records that did not match, indicating these two columns did not contain duplicate information.

![](/images/Cbg_Image_1.png)

Column names were then revised to make them easier to work with, both in Sheets and SQL.

The minute_sleep files contained the same columns.

Each record (row) represents a 1 minute time interval in which a user?s sleep was measured.

However, each file was too large (198,560 and 188,522 records) to merge together in Google Sheets. They would have to be combined in SQL. So, before moving to SQL, the column names were revised to make them easier to work with.

The value column contains the numbers 1, 2, or 3 which appear to correspond to different stages of the sleep cycle, as defined in this blog post: [https://blog.fitbit.com/sleep-stages-explained/](https://blog.fitbit.com/sleep-stages-explained/) where 1 indicates light sleep, 2 indicates deep sleep, and 3 indicates REM sleep. To better represent the categorical nature of this measurement, a new column, sleep_stage, was added to the data using the formula:

=IF(C2=1, ?Light?, IF(C2=2, ?Deep?, ?REM?))

**Step 2:**

The three datasets, daily_activity_combined, minute_sleep_031216, and minute_sleep_041216 were loaded into a database, Fitness_Tracker, on BigQuery.

The schema was set to ?auto detect? and 1 header row was identified for each table.

![](/images/Op8_Image_2.png)

![](/images/cGr_Image_3.png)

Then, each table was examined to ensure proper loading into BigQuery and to check data type.

![](/images/O8q_Image_4.png)


```
SELECT *  
FROM `more-practice-with-sql-416000.Fitness_Tracker.daily_activity_combined`
LIMIT 5;

```
![](/images/oaB_Image_5.png)


```
SELECT *
FROM `more-practice-with-sql-416000.Fitness_Tracker.minute_sleep_031216`
LIMIT 5;

```
3. minute_sleep_041216

![](/images/SkU_Image_6.png)


```
SELECT *
FROM `more-practice-with-sql-416000.Fitness_Tracker.minute_sleep_041216`
LIMIT 5;

```
**PROCESS AND ANALYZE:**

**Step 1:**

The datasets were checked for errors, by first checking for the number of total records in each data set.

*daily_activity_combined*

| SELECT COUNT(*)
FROM `more-practice-with-sql-416000.Fitness_Tracker.daily_activity_combined`;

Upon inspection it looks like all the blank rows in the google sheet were imported as well. This was verified by checking for null values.

| -- Checking for null values
-- daily_activity_combined
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
 |  |
|---|---|

49,102 null records were returned, which is consistent with the blank rows in the google sheet being imported.

The next step was to drop these records from the table. Since I knew the source of the data and could verify these were blank rows, I was comfortable permanently deleting these records from the table. Here?s where I ran into a snag in my analysis.

| --Deleting Null Records from daily_activity_combined
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
  calories IS NULL; |  |
|---|---|

Since I was using the free version of BigQuery, I was unable to delete these records from the table. At this point I decided to delete the records directly from Google Sheets, and then re-import the newly cleaned daily_activity_combined table into BigQuery.

With the newly imported daily_activity_combined, I checked for the presence of null values in any of the columns.

| --Checking for null values
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
  calories IS NULL; | 
No null values were found. |
|---|---|

*minute_sleep_031216*

| SELECT COUNT(*)
FROM `more-practice-with-sql-416000.Fitness_Tracker.minute_sleep_031216`
 |  |
|---|---|

This value corresponds with the number of records reflected in the Google Sheets version of this table, confirming there are no empty rows present.

| --Checking for null values
SELECT *
FROM `more-practice-with-sql-416000.Fitness_Tracker.minute_sleep_031216`
WHERE user_id IS NULL OR
  activity_date IS NULL OR
  sleep_num IS NULL OR
  sleep_stage IS NULL OR
  log_id IS NULL;
 | 
No null values were found. |
|---|---|

*minute_sleep_041216*

| SELECT COUNT(*)
FROM `more-practice-with-sql-416000.Fitness_Tracker.minute_sleep_041216`
 |  |
|---|---|

This value corresponds to the number of records found in the Google Sheets version of this table, confirming there are no empty rows present.

| --Checking for null values
SELECT *
FROM `more-practice-with-sql-416000.Fitness_Tracker.minute_sleep_041216`
WHERE user_id IS NULL OR
  activity_date IS NULL OR
  sleep_num IS NULL OR
  sleep_stage IS NULL OR
  log_id IS NULL;

 | 
No null records were found. |
|---|---|

Next, each dataset was checked for the presence of duplicate records.

*daily_activity_combined*

| --Checking for duplicates
SELECT *
FROM (
  SELECT *,
    COUNT(*) OVER (PARTITION BY user_id, activity_date, total_steps) AS duplicate_count
  FROM `more-practice-with-sql-416000.Fitness_Tracker.daily_activity_combined`
)
WHERE duplicate_count > 1;
 | 
No duplicate records were found. |
|---|---|

*minute_sleep_031216*

| --Checking for duplicates
SELECT *
FROM (
  SELECT *,
    COUNT(*) OVER (PARTITION BY user_id, activity_date, sleep_num, sleep_stage, log_id) AS duplicate_count
  FROM `more-practice-with-sql-416000.Fitness_Tracker.minute_sleep_031216`
)
WHERE duplicate_count > 1;

 | 

1050 duplicate records were found. They appear to be from the same user with the activity_date timestamp being counted twice for each log. |
|---|---|

*minute_sleep_041216*

| --Checking for duplicates
SELECT *
FROM (
  SELECT *,
    COUNT(*) OVER (PARTITION BY user_id, activity_date, sleep_num, sleep_stage, log_id) AS duplicate_count
  FROM `more-practice-with-sql-416000.Fitness_Tracker.minute_sleep_041216`
)
WHERE duplicate_count > 1;
 | 
1086 duplicate records were found. They also appear to be from the same user with the activity_date timestamp being counted twice for each log.  |
|---|---|

**Step 2:**

In this step, I merged the two minute_sleep tables into one new table: sleep_min_combined.

```
--Creating merged sleep_min_combined table
CREATE TABLE `more-practice-with-sql-416000.Fitness_Tracker.sleep_min_combined` AS
SELECT * FROM `more-practice-with-sql-416000.Fitness_Tracker.minute_sleep_031216`
UNION ALL
SELECT * FROM `more-practice-with-sql-416000.Fitness_Tracker.minute_sleep_041216`
```
![](/images/TTT_Image_7.png)

![](/images/aGI_Image_8.png)

**Step 3:**

Initial exploratory data analysis.

**Daily Activity Data**

*daily_activity_combined*

I queried summary statistics from the daily activity data.

First, I wanted to find out how many distinct users are represented in the data.

```
SELECT COUNT(DISTINCT user_id)
FROM `more-practice-with-sql-416000.Fitness_Tracker.daily_activity_combined`
```
There are **35** distinct users.

Next, I wanted to find out how many different dates are represented in the data.

```
SELECT
  COUNT(DISTINCT activity_date)
FROM `more-practice-with-sql-416000.Fitness_Tracker.daily_activity_combined`
```
There are **62** different dates represented in the data.

Then, I wanted to find out how often these 35 users were tracking data by examining summary statistics of fitbit use.

```
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
```
| avg_num_sessions | min_num_sessions | max_num_sessions | sd_num_sessions |
|---|---|---|---|
| 39.229 | 8 | 62 | 9.4 |

Next, I wanted to see how the number of users varied by date.

```
SELECT
  activity_date,
  COUNT(DISTINCT user_id)
FROM `more-practice-with-sql-416000.Fitness_Tracker.daily_activity_combined`
GROUP BY activity_date
ORDER BY activity_date;
```
The number of users started out low, peaked at the beginning of April, and then slowly decreased through May 12. **The 35 users are not consistently tracking their health.**

![](/images/q8k_Image_9.png "Chart")

Next, I examined average Fitbit use by day of the week:

```
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
```
There does not appear to be a large difference in the average number of users by day of the week, with the most users logging in on Fridays (average 24.9) and the least users logging in on Mondays (20.9).

![](/images/GDQ_Image_10.png "Chart")

Finally, I wanted to see if users were taking advantage of manually logging their activity. This was represented in the logged_activity column in the data.

First, I queried how many records contained 0 vs. a value greater than 0 for logged_activity.

```
-- Finding the number of records where logged_activity equals 0
SELECT
  COUNT(*)
FROM `more-practice-with-sql-416000.Fitness_Tracker.daily_activity_combined`
WHERE logged_activity = 0

-- Finding the number of records where logged_activity does not equal 0
SELECT
  COUNT(*)
FROM `more-practice-with-sql-416000.Fitness_Tracker.daily_activity_combined`
WHERE logged_activity <> 0
```
There are 1341 records in the data table with no logged activity recorded vs. 56 records with logged activity.

I then wanted to find out how many different users were responsible for the 56 logged_activity records.

```
-- Finding the number of users logging activity
SELECT
  COUNT(DISTINCT user_id)
FROM `more-practice-with-sql-416000.Fitness_Tracker.daily_activity_combined`
WHERE logged_activity <> 0

-- Finding the number of times each user logged activity
SELECT
  user_id,
  COUNT(*)
FROM `more-practice-with-sql-416000.Fitness_Tracker.daily_activity_combined`
WHERE logged_activity <> 0
GROUP BY user_id;
```
Only 7 users are utilizing the logged activity function - with use ranging from 1 log (2 users) up to 23 logs (1 user). Five of the seven users manually logged activity seven or fewer times. The remaining two users logged activity 19 and 23 times.

Next, I wanted to see how consistently users are wearing/using their Fitbit.

```
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
```
![](/images/eKb_Image_11.png "Chart")

Summary of Fitbit Use:

| Percentage Using Fitbit At Least Once | 100% |
|---|---|
| Maximum Percentage Using Fitbit Per Day | 100% |
| Minimum Percentage Using Fitbit Per Day | 6% |

**Sleep Data:**

For the sleep data, I wanted to organize the data by the number of minutes slept per session grouped by sleep stage. I also wanted to save the results of this query as a new table that I could query later for further analysis. I used the COUNT(DISTINCT activity_date) in the query to deal with the duplicate records.

*sleep_min_grouped*

```
--Creating merged sleep_min_grouped table
CREATE TABLE `more-practice-with-sql-416000.Fitness_Tracker.sleep_min_grouped` AS
SELECT
  user_id,
  COUNT(DISTINCT activity_date) AS min_sleep,
  sleep_stage,
  log_id,
  FORMAT_TIMESTAMP('%m-%d-%y', activity_date) AS activity_date
FROM `more-practice-with-sql-416000.Fitness_Tracker.sleep_min_combined`
GROUP BY user_id, log_id, activity_date, sleep_stage
ORDER BY user_id, log_id, activity_date

```
![](/images/8Z9_Image_12.png)

![](/images/hVe_Image_13.png)

Activity_date is represented as a STRING, so I used the CAST function to convert the dates into the DATE data type.

```
CREATE OR REPLACE TABLE `more-practice-with-sql-416000.Fitness_Tracker.sleep_min_grouped` AS
SELECT *,
  CAST(PARSE_DATE('%m-%d-%Y', activity_date) AS DATE) AS date
FROM `more-practice-with-sql-416000.Fitness_Tracker.sleep_min_grouped`;
```
Next, I wanted to examine how many users are tracking their sleep.

```
SELECT COUNT(DISTINCT user_id)
FROM `more-practice-with-sql-416000.Fitness_Tracker.sleep_min_grouped`
```
*How many distinct users are tracking sleep? ****25***

Then, I wanted to examine how often these 25 users are tracking sleep.

First, I needed to find out how many different dates are represented in the data.

```
SELECT
  COUNT(DISTINCT activity_date)
FROM `more-practice-with-sql-416000.Fitness_Tracker.sleep_min_grouped`
```
There are **63 different dates represented** in the data for users to log sleep sessions. \


Then, I queried summary statistics based on the number of sessions users are logging.

```
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
```
| avg_num_sessions | min_num_sessions | max_num_sessions | sd_num_sessions |
|---|---|---|---|
| 40.28 | 1 | 83 | 27.42 |

I checked the total number of users tracking their sleep per date.

```
SELECT
  activity_date,
  COUNT(DISTINCT user_id)
FROM `more-practice-with-sql-416000.Fitness_Tracker.sleep_min_grouped`
GROUP BY activity_date
ORDER BY activity_date;
```
The number of users tracking their sleep each night fluctuated between 8 and 18 users.

![](/images/m7R_Image_14.png "Chart")

Summary of Sleep Tracker Use:

| Percentage Using Sleep Tracking At Least Once | 71% |
|---|---|
| Maximum Percentage Using Sleep Tracking Per Day | 51% |
| Minimum Percentage Using Sleep Tracking Per Day | 23% |

Then, I wanted to see how consistently users are tracking sleep.

```
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
```
![](/images/rZ5_Image_15.png "Chart")

And finally, I examined average sleep tracker use by day of the week:

```
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

```
There does not appear to be a difference in the average number of users tracking their sleep by day of the week, with a high of 14.6667 users (Saturday and Sunday) and a low of 13.6667 users (Friday).

![](/images/fDK_Image_16.png "Chart")

**SHARE AND ACT:**

**Key Points:**

- Users are not consistently using their Fitbit tracker.

- Use by day:

- Minimum number of users = 2 (5.7%)

- Maximum number of users = 35 (100%)

- No significant difference in number of users by day of the week. Average number of users ranged from 20.9 (Monday) to 24.9 (Friday)

- Use by frequency:

- ~63% of users are using their Fitbit 61-70% of the time.

- Only 8.6% of users are using their Fitbit more than 90% of the time.

- Use of manually logged information:

- Logged_activity: Only 20% of users (7) utilized manual entry at least 1 x.

- Of the users that manually logged activity, 5 of them logged 7 or fewer entries. The remaining 2 logged 19 and 23 entries, respectively.

- 71% of users (25) tracked their sleep at least 1 x between March 12 and May 12.

- Sleep tracking by day:

- Minimum number of users = 8 (22.8%)

- Maximum number of users = 18 (51.4%)

- No difference in number of users by day of the week. Average number of users ranged from 13.7 (Friday) to 14.7 (Saturday and Sunday).

- Sleep tracking by frequency:

- 23% of Fitbit users track their sleep more than 90% of the time, with the next largest group (14%) tracking their sleep less than 10% of the time.

Here is a link to the presentation I put together summarizing these findings and recommended action items. **[Bellabeat Capstone Presentation](https://docs.google.com/presentation/d/1N1a92JSpZP4dFrCNKaex-6be2wZGuGNtODzYC9QtY7I/edit?usp=sharing)**
