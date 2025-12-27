# Bellabeat Case Study – User Activity & Wellness Analysis

## Project Overview
This case study analyzes smart device usage data to understand user activity, sleep behavior, and consistency patterns.
The goal is to generate data-driven insights that can help Bellabeat improve targeted marketing strategies and product positioning.

## Business Problem
Bellabeat wants to better understand how users interact with smart fitness devices in terms of:
- Daily activity levels
- Sleep duration and efficiency
- User consistency over time

These insights can help align marketing campaigns with real user behavior.

## Business Questions
1. How active are users on a daily basis?
2. How does physical activity relate to sleep duration and sleep quality?
3. Are users consistent or irregular in using the device?

## Tools & Technologies
- **Python** (Pandas, NumPy) – Data Cleaning & EDA
- **SQL** (PostgreSQL) – Deep analysis & aggregations
- **Tableau** – Interactive dashboards
- **Excel/CSV** – Data storage & exports

## Repository Structure

├── Bellabeat Business Problem.pdf
├── clean_activity_sleep.csv
├── activity_sleep_bellabeat.sql
├── bellabeat_data_cleaning.ipynb
├── bellabeat_eda.ipynb
├── bellabeat_final_tableau.csv
├── Bellabeat User Activity.twbx
└── README.md

## Key Insights
- Most users fall under Medium and High activity levels, fewer users are Low activity.
- More steps lead to higher calorie burn, showing a clear positive relationship.
- Steps and sleep duration are weakly related - more activity does not always mean longer sleep.
- Sleep efficiency is high (90%+) across all activity levels, indicating good sleep quality overall.
- Medium and Low activity users have slightly better sleep efficiency than highly active users.
- Activity peaks on Saturdays, while mid-week and Sunday show lower step counts.
- Some extreme step outliers exist, which may need special handling in analysis.

## Additional Key Insights
- Users walk about 8,500 steps per day on average, which means they are active but still below the common 10,000 steps goal.
- Calories burned change clearly with activity level, while sleep measures change less. This makes calories a better signal of user engagement.
- Highly active users show big ups and downs in steps and calories, meaning their activity is not consistent every day.
- Low activity users stay mostly at very low step counts, showing they rarely increase their effort.
- Sleep hours vary a lot for all users, which means sleep is influenced by lifestyle and work, not just physical activity.
- Only a small group of users are active regularly, showing that long-term engagement is limited.
- Many users have very few active days, which may indicate low usage or risk of dropping the device.
- Weekday activity is steady, suggesting routine behavior, while weekends show spikes in activity.
- Doing more activity does not always improve sleep, showing that more effort does not always give better rest.
- User behavior is diverse, not one-size-fits-all, so marketing should target different user types separately.

## Dashboards Created
1. **User Activity Overview**
2. **Activity vs Health Impact**
3. **Weekly Behavior Patterns**
4. **User Consistency Analysis**

## Outcome
This analysis translates raw fitness data into actionable insights that can support smarter marketing decisions and product recommendations for Bellabeat.
