<h1> Bellabeat Wellness Tracker Case Study: Google Data Analytics Professional Certificate Capstone Project </h1>
<br>
<h2> Project Description/Purpose</h2>
<br>
The purpose of this project was to help Bellabeat, a wellness company, gain insight into how consumers are using smart devices/fitness trackers. By analyzing data on fitness tracker use, the company can make informed decisions on increasing user fitness tracker engagement.
<br>
<h2> Tools Used for Analysis </h2>
<br>
<b>Data:</b> The data used for this analysis consisted of Fitbit Fitness Tracker Data collected voluntarily from 30 fitbit users March-May of 2016. The data set is CC0: Public Domain, and is made available by the user Mobius through <a href="https://www.kaggle.com/datasets/arashnic/fitbit">Kaggle.com</a>.
<br><br>
<b>Google Sheets:</b> An initial inspection of the data set was conducted with Google Sheets.
<br><br>
<b>BigQuery/SQL:</b> The data were loaded into a new database in Google's BigQuery. The database consisted of 5 tables:
<ul>
  <li>daily_activity_combined: contains daily data on users activity such as total steps, total distance, calories, and activity minutes/distance by category (sedentary, light, fairly, moderate, very) </li>
  <li>minute_sleep_031216: contains minute level data on users sleep, labeled by sleep stage (1, 2, or 3)</li>
  <li>minute_sleep_041216: contains minute level data on users sleep, labeled by sleep stage (1, 2, or 3)</li>
  <li>sleep_min_combined: contains combined data from minute_sleep_031216 and minute_sleep_041216</li>
  <li>sleep_min_grouped: contains data from sleep_min_combined grouped by sleep stage</li>
</ul>
<br>
<h2>Summary of Findings</h2>
<br>
A summary of the key findings can be found in the presentation linked <a href="https://docs.google.com/presentation/d/1N1a92JSpZP4dFrCNKaex-6be2wZGuGNtODzYC9QtY7I/edit?usp=sharing">here.</a>


<h2>Resources</h2>
<br>
<ul>
  <li><b>SQL Code:</b> The SQL code used in this project can be examined in the <a href="https://github.com/cfuller19/google_DA_capstone/blob/main/Google%20DA%20Capstone.sql">"code"</a> section of this repository.</li>
  <li><b>Detailed Explanation:</b> A detailed step-by-step explanation of this analysis can be found <a href="https://docs.google.com/document/d/1l6rVHq5qymulc6AZ0O3-mfyv96DBFKta1o0nsz_J2A8/edit?usp=sharing">here.</a></li>
</ul>
